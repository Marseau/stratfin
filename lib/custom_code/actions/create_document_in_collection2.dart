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

Future<DocumentReference?> createDocumentInCollection2(
  String email,
  String collection2,
  String field1Name,
  String? field1Value,
  String fieldName2,
  bool? field2Value,
) async {
  try {
    // Obter o documento do usuário usando o e-mail fornecido
    var querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isEmpty) {
      return null; // Retornar null se o usuário não for encontrado
    }

    DocumentSnapshot userDoc = querySnapshot.docs.first;
    String uid = userDoc.id;

    DocumentReference userDocRef =
        FirebaseFirestore.instance.collection('users').doc(uid);

    // Criar entrada na collection2
    await FirebaseFirestore.instance.collection(collection2).doc(uid).set({
      'uid': uid, // armazenar o uid do usuário como um campo
      'user': userDocRef, // DocumentReference para o usuário
      field1Name: field1Value,
      fieldName2: field2Value,
    });

    // Adiciona uma referência do documento criado na collection2 ao documento do usuário na collection1
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      collection2: FirebaseFirestore.instance.collection(collection2).doc(uid)
    });

    return userDocRef; // Retornar o DocumentReference se for bem-sucedido
  } catch (e) {
    return null; // Retornar null se ocorrer um erro
  }
}
