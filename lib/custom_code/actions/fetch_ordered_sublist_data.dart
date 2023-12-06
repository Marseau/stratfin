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

Future fetchOrderedSublistData(
  String collectionName,
  String fieldName,
  String sublistName,
) async {
  final collection = FirebaseFirestore.instance.collection(collectionName);

  // Tentar ordenar usando o índice do Firestore.
  QuerySnapshot snapshot =
      await collection.orderBy('$fieldName.$sublistName').get();

  return snapshot.docs;
}
