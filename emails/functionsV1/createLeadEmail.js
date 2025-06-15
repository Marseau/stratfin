const admin = require('firebase-admin');
const emailProvider = require('./emailProvider');

// Função que será acionada para enviar o email aos agentes quando um novo lead é criado
exports.handleNewLead = async (snap, context) => {
    const newLead = snap.data();
    const leadId = context.params.leadId; // Obtenha o ID do documento
    const userId = newLead.user.id; // ID do usuário
    const userDoc = await admin.firestore().collection('users').doc(userId).get();
    const userData = userDoc.data();
    
    // Verifica se as informações necessárias do usuário estão presentes
    if (!userData || !userData.email) {
        console.error('Informações incompletas do usuário para enviar o e-mail.');
        return;
    }
    
    // Preparando o conteúdo do email
    const subject = "Novo interesse de assessoria - Potencial cliente via StratFin";
    const htmlContent = `
      <p>Prezado agente,</p>
      <p>O usuário <strong>${userData.display_name}</strong> (${userData.email}, telefone: ${userData.phone_number}) demonstrou interesse em ser assessorado por sua empresa através do <strong>StratFin</strong>.</p>
      <p>Data da solicitação: ${newLead.dataSolicitada.toDate().toLocaleString()}</p>
      <p>Nosso aplicativo <strong>StratFin</strong> conecta clientes como ${userData.display_name} a empresas como a sua, facilitando o processo de planejamento estratégico e assessoria financeira.</p>
      <p>Para mais informações sobre como podemos ajudá-lo a atrair mais clientes e expandir seu alcance, entre em contato conosco ou visite nosso site.</p>
      <p>Aproveite essa oportunidade para conhecer melhor o ${userData.display_name} e como nossa plataforma pode ser uma ferramenta poderosa para seu sucesso!</p>
    
      <p style="font-family: 'Roboto', sans-serif; font-size: 14px;color: #333;"></p>
    `;
    
    // Enviar email para todos os agentes listados
    const promises = newLead.agenteEmail.map((agenteEmail) => {
        return emailProvider.sendEmail(agenteEmail, subject, htmlContent);
    });
    
    // Aguarda o envio de todos os e-mails
    try {
        await Promise.all(promises);
        console.log('E-mails enviados com sucesso.');
        
        // Atualizar o campo dataEnviada com a data e hora atual após o envio
        await admin.firestore().collection('leadsAgente').doc(leadId).update({
        dataEnviada: admin.firestore.FieldValue.serverTimestamp()
        });
        
        console.log('Campo dataEnviada atualizado com sucesso.');
    } catch (error) {
        console.error('Erro ao enviar e-mails ou atualizar o campo dataEnviada:', error);
    }
};
