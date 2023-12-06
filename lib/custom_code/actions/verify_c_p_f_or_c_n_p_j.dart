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

Future<String> verifyCPFOrCNPJ(String? value) async {
  if (value == null || value.isEmpty) {
    return 'Campo obrigatório';
  }

  String numbersOnly = value.replaceAll(RegExp(r'\D'), '');

  // Validação de CPF
  if (numbersOnly.length == 11) {
    if (numbersOnly == '00000000000' ||
        numbersOnly == '11111111111' ||
        numbersOnly == '22222222222' ||
        numbersOnly == '33333333333' ||
        numbersOnly == '44444444444' ||
        numbersOnly == '55555555555' ||
        numbersOnly == '66666666666' ||
        numbersOnly == '77777777777' ||
        numbersOnly == '88888888888' ||
        numbersOnly == '99999999999') {
      return 'CPF/CNPJ não existente';
    }

    for (int i = 9; i < 11; i++) {
      int sum = 0;
      for (int j = 0; j < i; j++) {
        sum += int.parse(numbersOnly[j]) * (i + 1 - j);
      }
      int verifyingDigit = sum % 11 < 2 ? 0 : 11 - sum % 11;
      if (verifyingDigit != int.parse(numbersOnly[i]))
        return 'CPF/CNPJ não existente';
    }

    return 'CPF/CNPJ verificado'; // CPF válido
  }
  // Validação de CNPJ
  else if (numbersOnly.length == 14) {
    if (numbersOnly == '00000000000000' ||
        numbersOnly == '11111111111111' ||
        numbersOnly == '22222222222222' ||
        numbersOnly == '33333333333333' ||
        numbersOnly == '44444444444444' ||
        numbersOnly == '55555555555555' ||
        numbersOnly == '66666666666666' ||
        numbersOnly == '77777777777777' ||
        numbersOnly == '88888888888888' ||
        numbersOnly == '99999999999999') {
      return 'CPF/CNPJ não existente';
    }

    List<int> numbers = numbersOnly.split('').map((e) => int.parse(e)).toList();

    const factorsFirstDigit = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
    const factorsSecondDigit = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];

    int calculateDigit(List<int> factors) {
      int sum = 0;
      for (int i = 0; i < factors.length; i++) {
        sum += numbers[i] * factors[i];
      }
      return sum % 11 < 2 ? 0 : 11 - sum % 11;
    }

    if (numbers[12] != calculateDigit(factorsFirstDigit) ||
        numbers[13] != calculateDigit(factorsSecondDigit)) {
      return 'CPF/CNPJ não existente';
    }
    return 'CPF/CNPJ verificado'; // CNPJ válido
  }

  return 'Entrada inválida';
}
