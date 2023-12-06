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

Future orderSublist(
  String collectionName,
  String documentId,
  String sublistName,
) async {
  final docRef =
      FirebaseFirestore.instance.collection(collectionName).doc(documentId);

  DocumentSnapshot doc = await docRef.get();

  if (!doc.exists) {
    print('Document does not exist!');
    return;
  }

  List<dynamic>? sublist = doc[sublistName];

  if (sublist == null || sublist.isEmpty) {
    print('Sublist is empty or does not exist!');
    return;
  }

  sublist.sort(); // Ordenar a lista

  await docRef.update(
      {sublistName: sublist}); // Atualizar o documento com a sublista ordenada
}
