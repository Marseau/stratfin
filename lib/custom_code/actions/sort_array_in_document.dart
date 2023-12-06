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

Future sortArrayInDocument(
  String collectionName,
  String documentId,
  String arrayFieldName,
) async {
  final docRef =
      FirebaseFirestore.instance.collection(collectionName).doc(documentId);

  // Recuperar o documento
  DocumentSnapshot docSnapshot = await docRef.get();

  if (!docSnapshot.exists) {
    print('Document does not exist!');
    return;
  }

  // Extrair e ordenar o array
  Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
  if (data == null) {
    print('Document data is null!');
    return;
  }

  List<dynamic>? arrayData = data[arrayFieldName];
  if (arrayData == null) {
    print('Field does not exist or is not an array!');
    return;
  }

  arrayData.sort();

  // Atualizar o documento com o array ordenado
  await docRef.update({arrayFieldName: arrayData});
}
