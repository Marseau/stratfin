const functions = require("firebase-functions");
const admin = require("firebase-admin");

const sgMail = require("@sendgrid/mail");

sgMail.setApiKey(functions.config().sendgrid.key);
admin.initializeApp();

exports.createInvitation = functions
  .region("us-central1")
  .https.onCall(async (data, context) => {
    const db = admin.firestore();
    const collectionRef = db.collection("convidados");

    const snapshot = await collectionRef.where("enviado", "==", false).get();

    if (snapshot.empty) {
      console.log("No matching documents.");
      return { status: "No emails to send." };
    }

    const currentDate = new Date().toISOString();

    const sendEmailPromises = snapshot.docs.map(async (doc) => {
      const recipientEmail = doc.data().email;
      const recipientName = doc.data().nome_completo;
      const link = `https://yourapp.com/invite/${docId}`; // Example link structure

      const msg = {
        to: recipientEmail,
        from: "stratfinco@gmail.com",
        subject: "Convite para nosso App",
        text: `Olá ${recipientName}, você foi convidado para se juntar ao nosso app! Clique no link a seguir para fazer login: ${link}`,
        html: `<strong>Olá ${recipientName}</strong>,<br><br>Você foi convidado para se juntar ao nosso app! <a href="${link}">Clique aqui</a> para fazer login.`,
      };

      try {
        await sgMail.send(msg);

        await collectionRef.doc(doc.id).update({
          enviado: true,
          data_envio: currentDate,
          status: "Enviado",
        });

        return true;
      } catch (error) {
        console.error(`Error sending email to ${recipientEmail}:`, error);

        await collectionRef.doc(doc.id).update({
          status: "Erro ao enviar",
        });

        return false;
      }
    });

    const results = await Promise.all(sendEmailPromises);

    const emailsSent = results.filter((result) => result).length;

    return { status: `Sent ${emailsSent} emails.` };
  });
