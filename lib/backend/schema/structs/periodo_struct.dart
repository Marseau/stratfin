// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PeriodoStruct extends FFFirebaseStruct {
  PeriodoStruct({
    int? anual,
    int? bianual,
    int? quinquenal,
    int? decenio,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _anual = anual,
        _bianual = bianual,
        _quinquenal = quinquenal,
        _decenio = decenio,
        super(firestoreUtilData);

  // "anual" field.
  int? _anual;
  int get anual => _anual ?? 0;
  set anual(int? val) => _anual = val;
  void incrementAnual(int amount) => _anual = anual + amount;
  bool hasAnual() => _anual != null;

  // "bianual" field.
  int? _bianual;
  int get bianual => _bianual ?? 0;
  set bianual(int? val) => _bianual = val;
  void incrementBianual(int amount) => _bianual = bianual + amount;
  bool hasBianual() => _bianual != null;

  // "quinquenal" field.
  int? _quinquenal;
  int get quinquenal => _quinquenal ?? 0;
  set quinquenal(int? val) => _quinquenal = val;
  void incrementQuinquenal(int amount) => _quinquenal = quinquenal + amount;
  bool hasQuinquenal() => _quinquenal != null;

  // "decenio" field.
  int? _decenio;
  int get decenio => _decenio ?? 0;
  set decenio(int? val) => _decenio = val;
  void incrementDecenio(int amount) => _decenio = decenio + amount;
  bool hasDecenio() => _decenio != null;

  static PeriodoStruct fromMap(Map<String, dynamic> data) => PeriodoStruct(
        anual: castToType<int>(data['anual']),
        bianual: castToType<int>(data['bianual']),
        quinquenal: castToType<int>(data['quinquenal']),
        decenio: castToType<int>(data['decenio']),
      );

  static PeriodoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PeriodoStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'anual': _anual,
        'bianual': _bianual,
        'quinquenal': _quinquenal,
        'decenio': _decenio,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'anual': serializeParam(
          _anual,
          ParamType.int,
        ),
        'bianual': serializeParam(
          _bianual,
          ParamType.int,
        ),
        'quinquenal': serializeParam(
          _quinquenal,
          ParamType.int,
        ),
        'decenio': serializeParam(
          _decenio,
          ParamType.int,
        ),
      }.withoutNulls;

  static PeriodoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PeriodoStruct(
        anual: deserializeParam(
          data['anual'],
          ParamType.int,
          false,
        ),
        bianual: deserializeParam(
          data['bianual'],
          ParamType.int,
          false,
        ),
        quinquenal: deserializeParam(
          data['quinquenal'],
          ParamType.int,
          false,
        ),
        decenio: deserializeParam(
          data['decenio'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PeriodoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PeriodoStruct &&
        anual == other.anual &&
        bianual == other.bianual &&
        quinquenal == other.quinquenal &&
        decenio == other.decenio;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([anual, bianual, quinquenal, decenio]);
}

PeriodoStruct createPeriodoStruct({
  int? anual,
  int? bianual,
  int? quinquenal,
  int? decenio,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PeriodoStruct(
      anual: anual,
      bianual: bianual,
      quinquenal: quinquenal,
      decenio: decenio,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PeriodoStruct? updatePeriodoStruct(
  PeriodoStruct? periodo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    periodo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPeriodoStructData(
  Map<String, dynamic> firestoreData,
  PeriodoStruct? periodo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (periodo == null) {
    return;
  }
  if (periodo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && periodo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final periodoData = getPeriodoFirestoreData(periodo, forFieldValue);
  final nestedData = periodoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = periodo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPeriodoFirestoreData(
  PeriodoStruct? periodo, [
  bool forFieldValue = false,
]) {
  if (periodo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(periodo.toMap());

  // Add any Firestore field values
  periodo.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPeriodoListFirestoreData(
  List<PeriodoStruct>? periodos,
) =>
    periodos?.map((e) => getPeriodoFirestoreData(e, true)).toList() ?? [];
