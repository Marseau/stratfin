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

Future<String> updateFieldsInCollection(
  String collection,
  String campoBuscaName,
  String campoBuscaValue,
  String? field1Name,
  String? field1Value,
  String? field2Name,
  String? field2Value,
  String? field3Name,
  String? field3Value,
  String? field4Name,
  bool? field4Value,
  String? field5Name,
  DocumentReference? field5Value,
) async {
  final firestore = FirebaseFirestore.instance;

  var querySnapshot = await firestore
      .collection(collection)
      .where(campoBuscaName, isEqualTo: campoBuscaValue)
      .get();

  if (querySnapshot.docs.isEmpty) {
    return "Registro não encontrado para $campoBuscaName: $campoBuscaValue";
  }

  String docId = querySnapshot.docs.first.id;

  Map<String, dynamic> updateData = {};

  if (field1Name != null && field1Value != null) {
    updateData[field1Name] = field1Value;
  }

  if (field2Name != null && field2Value != null) {
    updateData[field2Name] = field2Value;
  }

  if (field3Name != null && field3Value != null) {
    updateData[field3Name] = field3Value;
  }

  if (field4Name != null && field4Value != null) {
    updateData[field4Name] = field4Value;
  }

  if (field5Name != null && field5Value != null) {
    updateData[field5Name] = field5Value;
  }

  try {
    await firestore.collection(collection).doc(docId).update(updateData);
    return "Registro atualizado com sucesso!";
  } catch (e) {
    return "Erro ao atualizar o registro: $e";
  }
}
