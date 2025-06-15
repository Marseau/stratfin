const admin = require('firebase-admin');
const fs = require('fs');

// Inicialize o Firebase Admin SDK
const serviceAccount = require('./stratfin-393617-firebase-adminsdk-ya4u5-6a4e88cee9.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const db = admin.firestore();

async function importPublicUsers() {
  try {
    // Leia o arquivo JSON exportado da coleção `users`
    const usersData = JSON.parse(fs.readFileSync('users.json', 'utf-8'));

    for (const user of usersData) {
      // Verifica se já existe um documento com o mesmo email em `public_users`
      const querySnapshot = await db.collection('public_users').where('email', '==', user.email).get();

      if (!querySnapshot.empty) {
        console.log(`Usuário com email ${user.email} já existe na coleção public_users. Pulando.`);
        continue; // Pule para o próximo usuário se o email já existir
      }

      // Cria o documento para `public_users`
      const publicUser = {
        email: user.email || "", // Substitui `undefined` por string vazia
        numeroAcessos: user.numeroAcessos || 0, // Substitui `undefined` por 0
        usuario_tipo: user.usuario_tipo || "", // Substitui `undefined` por string vazia
        cpf_cnpj: user.cpf_cnpj || "", // Substitui `undefined` por string vazia
        exists: true, // Sempre true
      };

      await db.collection('public_users').doc(user.uid).set(publicUser);
      console.log(`Usuário ${user.uid} adicionado à coleção public_users.`);
    }

    console.log('Importação concluída com sucesso!');
  } catch (error) {
    console.error('Erro durante a importação:', error);
  }
}

importPublicUsers();




