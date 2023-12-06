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

Future deleteRelatedDocuments(
  String collection1,
  String collection2,
  String uidValue,
) async {
  // Verificar se o documento com o UID especificado existe na primeira coleção
  var docRef1 =
      FirebaseFirestore.instance.collection(collection1).doc(uidValue);
  var docSnapshot1 = await docRef1.get();
  if (!docSnapshot1.exists) {
    return 'Document with UID $uidValue does not exist in $collection1';
  }

  // Verificar se o documento com o UID especificado existe na segunda coleção
  var docRef2 =
      FirebaseFirestore.instance.collection(collection2).doc(uidValue);
  var docSnapshot2 = await docRef2.get();
  if (!docSnapshot2.exists) {
    return 'Document with UID $uidValue does not exist in $collection2';
  }

  // Deletar o documento na primeira coleção
  await docRef1.delete();

  // Deletar o documento na segunda coleção
  await docRef2.delete();

  return 'Documents deleted successfully';
}
