import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class VIACEPGetenderecoCall {
  static Future<ApiCallResponse> call({
    String? cep = '05654030',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'VIACEP getendereco',
      apiUrl: 'https://viacep.com.br/ws/$cep/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class VIACEPGetcepCall {
  static Future<ApiCallResponse> call({
    String? uf = 'SP',
    String? city = 'SÃO PAULO',
    String? adress = 'Rua General Euclides Figueiredo',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'VIACEP getcep',
      apiUrl: 'https://viacep.com.br/ws/$uf/$city/$adress/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
