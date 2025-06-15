const emailProvider = require('./emailProvider');

/**
 * Função para enviar email de cadastro para novos usuários com tipo específico.
 * @param {Object} userRecord - O registro do usuário recém-criado.
 * @param {Object} empresa - Dados da empresa que cadastrou o usuário.
 * @return {Promise<void>}
 */
// Função de envio de e-mail atualizada
module.exports = async (userRecord, empresaNome, usuarioTipo) => {
    const email = userRecord.email;
    
    if (!email) {
        console.error("O email do usuário está indefinido.");
        return null;
    }
    
    // Monta o corpo do email com as informações do usuário e da empresa
    const mensagemHtml = `
        <p>Olá,</p>
        <p>Você foi convidado e cadastrado em nosso aplicativo pela empresa "${empresaNome}" como ${usuarioTipo}.</p>
        <p>Ao acessar pela primeira vez, será solicitado a atualização da sua senha.</p>
        <p>Seja bem-vindo!</p>
    `;
    
    try {
        // Enviar o email de cadastro
        await emailProvider.sendEmail(email, "Cadastro no Aplicativo StratFin", mensagemHtml);
        console.log("E-mail de cadastro enviado para:", email);
    } catch (error) {
        console.error("Erro ao enviar o e-mail de cadastro:", error.message);
    }
};
