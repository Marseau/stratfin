const { Storage } = require('@google-cloud/storage');
const axios = require('axios');
const fs = require('fs');

// Configurações gerais do provedor de email
const emailProvider = {
provider: "Brevo", // Nome do provedor de email
sender: {
email: "admin@stratfin.tec.br", // Remetente padrão
name: "StratFin" // Nome do remetente
},
signature: `
    <p style="font-family: 'Roboto', sans-serif; font-size: 16px;color: #333;">
      Atenciosamente,<br>Equipe StratFin
    </p>
    <p> </p>
    <p><img src="https://firebasestorage.googleapis.com/v0/b/stratfin-393617.appspot.com/o/Logo%20completo%20branco%20com%20fundo%20azul.png?alt=media&token=4a515457-a8c8-453b-90b1-59b19b2cec75" alt="Logo da Empresa" width="100"></p>
    <p style="font-family: 'Roboto', sans-serif; font-size: 14px;color: #333;">
      StratFin | <a href="https://www.stratfin.tec.br">www.stratfin.tec.br</a>
    </p>
  `, // Assinatura padrão com estilo
    
    // Função para obter a chave da API do Brevo do Google Cloud Storage
getApiKey: async () => {
    const storage = new Storage();
    const bucketName = "service_credentials"; // Nome do bucket
    const fileName = "BrevoKey.txt"; // Nome do arquivo onde a chave está armazenada
    const filePath = `/tmp/${fileName}`; // Caminho temporário para armazenar o arquivo
    
    // Baixa o arquivo com a chave da API do bucket
    await storage.bucket(bucketName).file(fileName).download({ destination: filePath });
    
    // Lê o conteúdo da chave da API
    const apiKey = fs.readFileSync(filePath, 'utf8').trim();
    return apiKey;
},
    
    // Função para enviar email usando o provedor Brevo
sendEmail: async (toEmail, subject, htmlContent) => {
    try {
        const apiKey = await emailProvider.getApiKey();
        
        // Aqui adicionamos o logo no cabeçalho do email (pode ser vazio, se não precisar)
        const logoHeader = `
        <p>  </p>
      `;
        
        // Aplica o estilo de fonte ao conteúdo do email
        const styledContent = `
        <div style="font-family: 'Roboto', sans-serif; font-size: 16px; color: #333;">
          ${htmlContent}
        </div>
      `;
        
        const data = {
        sender: emailProvider.sender,
        to: [{ email: toEmail }],
        subject: subject,
        htmlContent: logoHeader + styledContent + emailProvider.signature // Adiciona o logo no cabeçalho e a assinatura no final
        };
        
        // Envia o email via API da Brevo
        await axios.post(
                         "https://api.brevo.com/v3/smtp/email",
                         data,
                         {
                         headers: {
                         accept: "application/json",
                             "api-key": apiKey,
                             "content-type": "application/json"
                         }
                         }
                         );
        
        console.log(`E-mail enviado com sucesso para ${toEmail}`);
    } catch (error) {
        console.error(`Erro ao enviar e-mail para ${toEmail}:`, error.message);
    }
}
};

module.exports = emailProvider;
