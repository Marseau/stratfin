const axios = require("axios");
const {Storage} = require("@google-cloud/storage");
const fs = require("fs");
const path = require("path");

/**
 * Lê a chave da API Brevo do Google Cloud Storage (GCS).
 * @return {Promise<string>} A chave da API Brevo.
 */
async function getBrevoApiKey() {
  const storage = new Storage();
  const bucketName = "service_credentials";
  const fileName = "BrevoKey.txt";
  const filePath = path.join("/tmp", fileName);

  // Baixa o arquivo do GCS e lê seu conteúdo
  await storage.bucket(bucketName).file(fileName).
      download({destination: filePath});
  return fs.readFileSync(filePath, "utf8").trim();
}

/**
 * Envia um e-mail usando a API da Brevo.
 * @param {string} toEmail - O e-mail do destinatário.
 * @param {string} subject - O assunto do e-mail.
 * @param {string} htmlContent - O conteúdo HTML do e-mail.
 * @return {Promise<void>} Promessa que indica o resultado do envio.
 */
async function sendBrevoEmail(toEmail, subject, htmlContent) {
  try {
    const brevoApiKey = await getBrevoApiKey();
    const data = {
      sender: {email: "admin@stratfin.tec.br", name: "StratFin"},
      to: [{email: toEmail}],
      subject: subject,
      htmlContent: htmlContent,
    };

    // Faz a requisição para a API da Brevo
    await axios.post("https://api.brevo.com/v3/smtp/email", data, {
      headers: {
        "accept": "application/json",
        "api-key": brevoApiKey,
        "content-type": "application/json",
      },
    });

    console.log(`E-mail enviado com sucesso para ${toEmail}`);
  } catch (error) {
    console.error(`Erro ao enviar e-mail para ${toEmail}:`, error.message);
  }
}

module.exports = {sendBrevoEmail};
