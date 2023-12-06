// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentReference?> createRelatedDocuments(
  String email,
  String password,
  String confirmPassword,
  String collection2,
  String extraField1Name,
  String? extraField1Value,
  String extraField2Name,
  String? extraField2Value,
  String extraField3Name,
  bool? extraField3Value,
  String collection1,
) async {
  // Verificar se a senha e a confirmação da senha são iguais
  if (password != confirmPassword) {
    print('Senhas não são iguais');
    return null;
  }

  // Verificar se o email já existe
  var querySnapshot = await FirebaseFirestore.instance
      .collection(collection1)
      .where('email', isEqualTo: email)
      .get();
  if (querySnapshot.docs.isNotEmpty) {
    print('Email já existe');
    return null;
  }

  UserCredential userCredential;
  try {
    userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print('Erro ao criar usuário: $e');
    return null;
  }

  String uid = userCredential.user!.uid;
  DateTime createdTime = DateTime.now();

  await FirebaseFirestore.instance.collection(collection1).doc(uid).set({
    'uid': uid,
    'email': email,
    'created_time': createdTime,
    if (extraField1Name.isNotEmpty) extraField1Name: extraField1Value,
    if (extraField2Name.isNotEmpty) extraField2Name: extraField2Value,
  });

  await FirebaseFirestore.instance.collection(collection2).doc(uid).set({
    'uid': uid,
    'user': FirebaseFirestore.instance.collection(collection1).doc(uid),
    if (extraField3Name.isNotEmpty) extraField3Name: extraField3Value,
  });

  await FirebaseFirestore.instance.collection(collection1).doc(uid).update({
    collection2: FirebaseFirestore.instance.collection(collection2).doc(uid)
  });

  return FirebaseFirestore.instance.collection(collection1).doc(uid);
}
