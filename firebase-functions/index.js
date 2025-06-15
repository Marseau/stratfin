const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Inicializa o Firebase Admin SDK
admin.initializeApp();

// Função Callable para definir declarações personalizadas
exports.setCustomClaims = functions.https.onCall(async (data, context) => {
  // Verifica se o usuário está autenticado
  if (!context.auth) {
    throw new functions.https.HttpsError(
        "unauthenticated",
        `Somente usuários autenticados podem definir 
                                         "declarações personalizadas.`,
    );
  }

  // Obtém os parâmetros fornecidos pelo cliente
  const {userId, vinculadoA} = data;

  // Validação básica dos parâmetros
  if (!userId || !vinculadoA) {
    throw new functions.https.HttpsError(
        "invalid-argument",
        "Os parâmetros 'userId' e 'vinculadoA' são obrigatórios.",
    );
  }

  try {
    // Define a declaração personalizada para o usuário
    await admin.auth().setCustomUserClaims(userId, {vinculadoA});

    // Retorna uma mensagem de sucesso
    return {message: `Declaração personalizada adicionada ao 
usuário ${userId}`};
  } catch (error) {
    console.error("Erro ao definir declarações personalizadas:", error);
    throw new functions.https.HttpsError(
        "unknown",
        `Erro ao definir declarações: ${error.message}`,
    );
  }
});


