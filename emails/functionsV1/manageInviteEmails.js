const admin = require("firebase-admin");
const emailProvider = require('./emailProvider');

/**
 * Função para gerenciar convites enviados via Firestore.
 * @param {Change} change - Objeto de mudança no documento Firestore.
 * @param {EventContext} context - Contexto do evento.
 * @return {Promise<void>}
 */
module.exports = async (change, context) => {
    const inviteId = context.params.inviteId;
    const data = change.after.exists ? change.after.data() : null;
    
    if (!data) {
        console.log(`Documento ${inviteId} excluído, nenhuma ação necessária.`);
        return null;
    }
    
    const { data_envio: dataEnvio, email, usuario_tipo: usuarioTipo, solicitante, tentativas = 0 } = data;
    
    // Verifica se o convidado já está cadastrado diretamente
    let userExists = false;
    try {
        const userRecord = await admin.auth().getUserByEmail(email);
        userExists = !!userRecord;
    } catch (error) {
        if (error.code !== "auth/user-not-found") {
            console.error("Erro ao verificar se o usuário já está cadastrado:", error);
            return null;
        }
    }
    
    if (userExists) {
        // Notifica o solicitante de que o convidado já está cadastrado
        const mensagemHtmlSolicitante = `
      <p>Olá ${solicitante},</p>
      <p>O convidado ${email} já se cadastrou diretamente em nosso sistema.</p>
      <p>Atenciosamente,<br>Equipe StratFin</p>
    `;
        await emailProvider.sendEmail(solicitante, "O convidado já está cadastrado!", mensagemHtmlSolicitante);
        return null;
    }
    
    // Verifica se devemos enviar ou reenviar o convite
    let shouldSendInvite = false;
    let newStatus = "enviado";
    
    if (!dataEnvio) {
        // Se não há data de envio anterior, o convite é enviado pela primeira vez
        shouldSendInvite = true;
    } else {
        const currentDate = new Date();
        const envioDate = dataEnvio.toDate();
        const diffDays = Math.ceil((currentDate - envioDate) / (1000 * 60 * 60 * 24));
        
        if (diffDays > 10 && tentativas < 2) {
            // Reenvia o convite se já passaram mais de 10 dias e houve menos de 2 tentativas
            shouldSendInvite = true;
            newStatus = "reenviado";
        }
    }
    
    if (shouldSendInvite) {
        // Gera o link de convite
        const actionCodeSettings = {
        url: `https://test.yourapp.com/finishSignUp?email=${email}`,
        handleCodeInApp: true
        };
        
        const inviteLink = await admin.auth().generateSignInWithEmailLink(email, actionCodeSettings);
        
        // Email para o convidado
        const mensagemHtmlConvidado = `
      <p>Olá,</p>
      <p>Você foi convidado por ${solicitante} para se juntar ao nosso aplicativo como ${usuarioTipo}.</p>
      <p>Clique no link abaixo para se cadastrar. Este link é válido por 5 dias.</p>
      <p><a href="${inviteLink}">${inviteLink}</a></p>
      <p>Atenciosamente,<br>Equipe StratFin</p>
    `;
        
        await emailProvider.sendEmail(email, "Convite para se cadastrar em nosso App", mensagemHtmlConvidado);
        
        // Atualiza Firestore com a nova data de envio e incrementa tentativas
        await admin.firestore().collection("convidados").doc(inviteId).update({
        data_envio: admin.firestore.FieldValue.serverTimestamp(),
        status: newStatus,
        tentativas: admin.firestore.FieldValue.increment(1)
        });
        
        // Se o convite foi reenviado, notifica o solicitante
        if (newStatus === "reenviado") {
            const mensagemHtmlReenvio = `
        <p>Olá ${solicitante},</p>
        <p>O convite para o usuário ${email} foi reenviado com sucesso.</p>
        <p>Atenciosamente,<br>Equipe StratFin</p>
      `;
            await emailProvider.sendEmail(solicitante, "Convite reenviado", mensagemHtmlReenvio);
        }
    } else {
        console.log(`Nenhuma ação necessária para o documento ${inviteId}.`);
    }
};
