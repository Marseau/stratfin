const admin = require("firebase-admin/app");
admin.initializeApp();

const createInvitation = require("./create_invitation.js");
exports.createInvitation = createInvitation.createInvitation;
