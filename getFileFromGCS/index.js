const { Storage } = require("@google-cloud/storage");
const functions = require("firebase-functions");

// Cria uma instância do cliente de Storage
const storage = new Storage();

exports.getFileFromGCS = functions.https.onRequest(async (req, res) => {
    try {
        const { directory, file_name: fileName, denom_social: denomSocial } = req.query;
        
        if (!directory || !fileName) {
            res.status(400).send("Missing required query parameters: directory or file_name.");
            return;
        }
        
        // Nome do bucket
        const bucketName = "cloud_folder"; // Substitua pelo nome do seu bucket
        
        // Referência para o arquivo no GCS
        const file = storage.bucket(bucketName).file(`${directory}/${fileName}`);
        
        // Baixa o arquivo como um buffer
        const [fileContents] = await file.download();
        
        // Converte o conteúdo do arquivo para JSON
        const data = JSON.parse(fileContents.toString());
        
        // Se o parâmetro denom_social for passado, filtrar os dados que contêm denom_social
        let filteredData = data;
        if (denomSocial) {
            console.log(`Searching for denom_social containing: ${denomSocial}`);
            filteredData = data.filter(item =>
                                       item.DENOM_SOCIAL && item.DENOM_SOCIAL.toLowerCase().includes(denomSocial.toLowerCase())
                                       );
        }
        
        // Define o tipo de conteúdo como JSON
        res.setHeader("Content-Type", "application/json");
        
        // Envia o conteúdo filtrado na resposta
        res.status(200).send(JSON.stringify(filteredData));
    } catch (error) {
        console.error("Error accessing file from GCS:", error);
        res.status(500).send("Internal Server Error");
    }
});
