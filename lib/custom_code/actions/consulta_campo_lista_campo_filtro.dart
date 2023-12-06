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

Future<List<String>> consultaCampoListaCampoFiltro(
  String colecao,
  String campoLista,
  String campoFiltro,
  String valorFiltro,
) async {
  // Criar uma referência para a coleção especificada
  CollectionReference refColecao =
      FirebaseFirestore.instance.collection(colecao);

  // Criar uma consulta filtrada pelo valor do campo de filtro
  Query query = refColecao.where(campoFiltro, isEqualTo: valorFiltro);

  // Executar a consulta e obter os documentos
  QuerySnapshot querySnapshot = await query.get();

  // Criar uma lista para armazenar os resultados
  List<String> resultados = [];

  // Iterar pelos documentos encontrados
  for (QueryDocumentSnapshot doc in querySnapshot.docs) {
    // Obter o campo de lista especificado
    List<dynamic> lista = doc[campoLista] ?? [];

    // Converter os elementos da lista em strings e adicioná-los aos resultados
    for (var elemento in lista) {
      resultados.add(elemento.toString());
    }
  }

  return resultados;
}
