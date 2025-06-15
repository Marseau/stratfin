const functions = require('firebase-functions');
const admin = require('firebase-admin');
const emailProvider = require('./emailProvider'); // Importando o emailProvider do arquivo separado
const sendWelcomeEmail = require('./sendWelcomeEmail');
const manageInviteEmails = require('./manageInviteEmails');
const createLeadEmail = require('./createLeadEmail');
const sendCadastroEmail = require('./sendCadastroEmail');

admin.initializeApp();


// Trigger para gerenciar convites no Firestore
exports.manageInviteEmails = functions.firestore
.document('convidados/{inviteId}')
.onWrite((change, context) => {
    console.log("Trigger disparado: alteração na coleção 'convidados'.");
    return manageInviteEmails(change, context); // Chama a função exportada
});

// Trigger para enviar emails aos agentes quando um novo lead é criado
exports.createLeadEmail = functions.firestore
.document('leadsAgente/{leadId}')
.onCreate((snap, context) => {
    return createLeadEmail.handleNewLead(snap, context);
});

// Função para aguardar até que o documento do Firestore seja criado e completo
async function waitForUserDocument(uid, maxRetries = 5, delay = 1000) {
    let retries = 0;
    while (retries < maxRetries) {
        const userDoc = await admin.firestore().collection('users').doc(uid).get();
        if (userDoc.exists) {
            console.log(`Documento encontrado no Firestore para UID: ${uid}`);
            return userDoc.data();  // Retorna os dados do usuário diretamente
        }
        console.log(`Tentativa ${retries + 1} de encontrar o documento do usuário ${uid}. Aguardando...`);
        retries += 1;
        await new Promise(resolve => setTimeout(resolve, delay));  // Espera 1 segundo antes de tentar de novo
    }
    throw new Error(`Documento do usuário ${uid} não foi encontrado após ${maxRetries} tentativas.`);
}

// Trigger para enviar email de boas-vindas após a criação de um novo usuário
exports.sendWelcomeEmail = functions.auth.user().onCreate(async (user) => {
    const uid = user.uid;
    
    try {
        console.log(`Trigger de boas-vindas disparado para o usuário com UID: ${uid}`);
        
        // Aguardar até que o documento do usuário esteja pronto no Firestore (com polling)
        const userData = await waitForUserDocument(uid);
        if (!userData) {
            throw new Error(`Documento do usuário com UID ${uid} não foi encontrado.`);
        }
        
        console.log('Dados do usuário encontrados no Firestore:', userData);
        
        // Verifica o campo usuario_tipo no documento do Firestore
        const usuarioTipo = userData.usuario_tipo || 'Tipo de Usuário Não Definido';
        console.log(`Tipo de usuário: ${usuarioTipo}`);  // Log para verificar o valor
        
        // Verifica se o usuário é do tipo "Usuário" ou "Empresa"
        if (usuarioTipo === "Usuário" || usuarioTipo === "Empresa") {
            console.log(`Enviando e-mail de boas-vindas para o usuário do tipo ${usuarioTipo}.`);
            // Chama a função que envia o e-mail de boas-vindas
            return sendWelcomeEmail(user);
        } else {
            console.log(`Usuário do tipo ${usuarioTipo}. Nenhum e-mail de boas-vindas enviado.`);
        }
    } catch (error) {
        console.error('Erro ao processar o envio de boas-vindas:', error.message);
    }
});

async function getCompanyName(empresaPath) {
    try {
        console.log(`Tentando extrair o ID do documento da empresa do caminho: ${empresaPath}`);
        
        // Verifica se o caminho contém uma referência válida
        if (!empresaPath) {
            console.error('Erro: O caminho da empresa é inválido ou não foi definido.');
            throw new Error('O caminho da empresa é inválido ou não foi definido.');
        }
        
        // Busca o documento da empresa com base no caminho
        console.log(`Buscando o documento da empresa com o caminho: ${empresaPath}`);
        const empresaDoc = await admin.firestore().doc(empresaPath).get();
        
        // Verifica se o documento existe
        if (empresaDoc.exists) {
            const empresaData = empresaDoc.data();
            console.log('Documento da empresa encontrado. Dados da empresa:', JSON.stringify(empresaData, null, 2));
            
            // Verifica se o campo display_name existe e retorna o nome da empresa
            const displayName = empresaData.display_name || 'Nome da Empresa Não Encontrado';
            console.log(`Nome da empresa obtido: ${displayName}`);
            return displayName;
        } else {
            console.warn(`Documento da empresa não encontrado com o caminho: ${empresaPath}`);
            return 'Empresa desconhecida';
        }
    } catch (error) {
        console.error(`Erro ao buscar o documento da empresa no caminho ${empresaPath}:`, error);
        return 'Erro ao obter o nome da empresa';
    }
}

// Trigger para enviar email de cadastro baseado no campo "usuario_tipo"
exports.sendCadastroEmail = functions.auth.user().onCreate(async (user) => {
    const uid = user.uid;
    
    try {
        console.log(`Trigger de cadastro disparado para o usuário com UID: ${uid}`);
        
        // Aguardar até que o documento do usuário esteja pronto no Firestore (com polling)
        const userData = await waitForUserDocument(uid);
        console.log('Dados do usuário encontrados no Firestore:', userData);
        
        const usuarioTipo = userData.usuario_tipo || 'Tipo de Usuário Não Definido';
        const empresaPath = userData.empresa;  // Pega o caminho completo da empresa
        
        // Verifica se o usuário é do tipo "Administrativo", "Advisor" ou "Principal"
        if (usuarioTipo === "Administrativo" || usuarioTipo === "Advisor" || usuarioTipo === "Principal") {
            console.log(`Novo usuário do tipo ${usuarioTipo}. Enviando e-mail de cadastro.`);
            
            // Obtém o nome da empresa a partir do ID da empresa
            const empresaNome = await getCompanyName(empresaPath);
            
            // Chama a função para enviar o e-mail, passando o nome da empresa e o tipo de usuário
            return sendCadastroEmail(user, empresaNome, usuarioTipo);
        } else {
            console.log(`Usuário do tipo ${usuarioTipo}. Nenhum e-mail de cadastro enviado.`);
            return null;
        }
    } catch (error) {
        console.error('Erro ao recuperar o documento do Firestore ou ao aguardar:', error);
        return null;
    }
});




