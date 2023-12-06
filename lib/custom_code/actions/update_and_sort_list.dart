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

Future updateAndSortList(
  String collectionName,
  String documentId,
  String fieldName,
  String sublistName,
  List<String> newData,
) async {
  final collection = FirebaseFirestore.instance.collection(collectionName);
  final document = collection.doc(documentId);

  // Ordenar os dados
  newData.sort((a, b) => a.compareTo(b));

  // Atualizar o documento no Firestore
  await document.update({
    '$fieldName.$sublistName': newData,
  });
}
