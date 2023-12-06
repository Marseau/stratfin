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

Future<bool> checkDocumentExists2fields(
  String? collectionName,
  String? firstField,
  String? firstValue,
  String? secondField,
  String? secondValue,
  String? userDocRefField,
  DocumentReference? userDocRefValue,
  String? isActiveField,
  bool? isActiveValue,
) async {
  try {
    // Cria a consulta inicial com base nos campos fornecidos.
    Query query = FirebaseFirestore.instance.collection(collectionName!);

    // Adiciona condições à consulta com base nos campos e valores fornecidos.
    if (firstField != null && firstValue != null) {
      query = query.where(firstField, isEqualTo: firstValue);
    }
    if (secondField != null && secondValue != null) {
      query = query.where(secondField, isEqualTo: secondValue);
    }

    // Adiciona condições para os novos campos DocumentReference e booleano, se fornecidos.
    if (userDocRefField != null && userDocRefValue != null) {
      query = query.where(userDocRefField, isEqualTo: userDocRefValue);
    }
    if (isActiveField != null && isActiveValue != null) {
      query = query.where(isActiveField, isEqualTo: isActiveValue);
    }

    // Executa a consulta e retorna o resultado.
    QuerySnapshot querySnapshot = await query.get();
    return querySnapshot.docs.isNotEmpty;
  } catch (e) {
    // Se ocorrer um erro, imprima-o no console e retorne falso.
    print(e);
    return false;
  }
}
