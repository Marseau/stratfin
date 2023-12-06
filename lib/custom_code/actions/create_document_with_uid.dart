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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentReference> createDocumentWithUid(
  String collection,
  String fieldName1,
  String fieldValue1,
  String? fieldName2,
  String? fieldValue2,
  String? fieldName3,
  String? fieldValue3,
) async {
  DocumentReference docRef =
      FirebaseFirestore.instance.collection(collection).doc();

  Map<String, dynamic> data = {
    'uid': docRef.id, // ID do documento
    'data_inclusao': FieldValue.serverTimestamp(), // Data de criação
    fieldName1: fieldValue1,
  };

  // Adiciona campos opcionais se forem fornecidos
  if (fieldName2 != null && fieldValue2 != null) {
    data[fieldName2] = fieldValue2;
  }
  if (fieldName3 != null && fieldValue3 != null) {
    data[fieldName3] = fieldValue3;
  }

  // Cria o documento com os dados fornecidos
  await docRef.set(data);

  // Retorna o DocumentReference criado
  return docRef;
}
