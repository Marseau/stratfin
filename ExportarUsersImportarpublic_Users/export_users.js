const admin = require('firebase-admin');
const fs = require('fs');

const serviceAccount = require('./stratfin-393617-firebase-adminsdk-ya4u5-6a4e88cee9.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const db = admin.firestore();

async function exportUsers() {
  const usersCollection = db.collection('users');
  const snapshot = await usersCollection.get();

  if (snapshot.empty) {
    console.log('Nenhum documento encontrado!');
    return;
  }

  const users = [];
  snapshot.forEach(doc => {
    users.push({ id: doc.id, ...doc.data() });
  });

  // Salva os dados em um arquivo JSON
  fs.writeFileSync('users.json', JSON.stringify(users, null, 2));
  console.log('Exportação concluída! Dados salvos em users.json.');
}
try {
    const admin = require('firebase-admin');
    const serviceAccount = require('./stratfin-393617-firebase-adminsdk-ya4u5-6a4e88cee9.json');
  
    admin.initializeApp({
      credential: admin.credential.cert(serviceAccount),
    });
  
    const db = admin.firestore();
    console.log('Firebase configurado com sucesso!');
  } catch (error) {
    console.error('Erro ao configurar Firebase:', error);
  }
  
exportUsers();
