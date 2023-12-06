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

//Cria automaticamente uma coleção users vinculada a outra coleção
// que pode ser de Consultor ou empresa. Serve para a vinculação automatica,
// não permitindo a criação de cada um deles sem um auth de user. Na coleção1
//User cria além do email, um campo cpf_cnpj e outro usuario_tipo que deve ser
// Empresa ou Consultor. O terceiro campo deve ser utilizado para a segunda coleção
// que ser for empresa o campo perfil_Empresa com False e com campo bio Null.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> createRelatedDocumentsV0(
  String email,
  String password,
  String confirmPassword,
  String collection2,
  String extraField1Name,
  String? extraField1Value,
  String extraField2Name,
  String? extraField2Value,
  String extraField3Name,
  String? extraField3Value,
  String collection1,
) async {
  try {
    // Verificar se a senha e a confirmação da senha são iguais
    if (password != confirmPassword) {
      return 'Senhas não são iguais, kkkk';
    }

    // Verificar se o email já existe
    var querySnapshot = await FirebaseFirestore.instance
        .collection(collection1)
        .where('email', isEqualTo: email)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      return 'Email já existe';
    }

    // Crie uma conta de usuário com o email e senha fornecidos
    UserCredential userCredential;
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      return 'Error creating user: $e';
    }

    // Obtenha o UID do usuário recém-criado
    String uid = userCredential.user!.uid;

    // Pegar a data e hora atual
    DateTime createdTime = DateTime.now();

    // Adicione um documento à primeira coleção com os campos especificados
    await FirebaseFirestore.instance.collection(collection1).doc(uid).set({
      'uid': uid,
      'email': email,
      'created_time': createdTime,
      if (extraField1Name.isNotEmpty) extraField1Name: extraField1Value,
      if (extraField2Name.isNotEmpty) extraField2Name: extraField2Value,
    });

    // Use o UID para adicionar um documento à segunda coleção
    await FirebaseFirestore.instance.collection(collection2).doc(uid).set({
      'uid': uid,
      'user': FirebaseFirestore.instance.collection(collection1).doc(uid),
      if (extraField3Name.isNotEmpty) extraField3Name: extraField3Value,
      // outros dados da segunda coleção aqui, se necessário
    });

    // Adicionar uma referência do documento criado na coleção 2 à entrada do usuário na coleção 1
    await FirebaseFirestore.instance.collection(collection1).doc(uid).update({
      collection2: FirebaseFirestore.instance.collection(collection2).doc(uid)
    });

    return 'User criado com sucesso';
  } catch (e) {
    return 'Erro inesperado: $e';
  }
}
