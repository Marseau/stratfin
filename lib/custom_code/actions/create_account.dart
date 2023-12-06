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

import 'package:firebase_auth/firebase_auth.dart';

Future<String> createAccount(
  String email,
  String password,
  String repeatPassword,
) async {
// Inicialize o FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Verifique se os campos de senha são iguais
  if (password != repeatPassword) {
    return "Senhas não são iguais";
  }

  try {
    // Tente criar uma conta com os valores fornecidos
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return "Usuário cadastrado";
  } catch (error) {
    if (error is FirebaseAuthException) {
      // Trate os erros específicos do Firebase Auth
      switch (error.code) {
        case 'email-already-in-use':
          return "Email já esteja cadastrado";
        case 'invalid-email':
          return "Email inválido";
        case 'weak-password':
          return "A senha é muito fraca";
        default:
          return "Erro desconhecido";
      }
    }
    return "Erro desconhecido";
  }
}
