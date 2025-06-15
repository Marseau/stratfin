const emailProvider = require('./emailProvider');

/**
 * Função para enviar email de boas-vindas para novos usuários.
 * @param {Object} userRecord - O registro do usuário recém-criado.
 * @return {Promise<void>}
 */
module.exports = async (userRecord) => {
    const email = userRecord.email;
    
    if (!email) {
        console.error("O email do usuário está indefinido.");
        return null;
    }
    
    const mensagemHtml = `
    <p>Olá,</p>
    <p>Bem-vindo à StratFin! Estamos felizes em ter você conosco.</p>
  `;
    
    try {
        await emailProvider.sendEmail(email, "Bem-vindo ao nosso Aplicativo!", mensagemHtml);
        console.log("E-mail de boas-vindas enviado para:", email);
    } catch (error) {
        console.error("Erro ao enviar o e-mail de boas-vindas:", error.message);
    }
};
