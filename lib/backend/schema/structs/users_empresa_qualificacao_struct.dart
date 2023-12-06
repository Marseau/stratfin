// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersEmpresaQualificacaoStruct extends FFFirebaseStruct {
  UsersEmpresaQualificacaoStruct({
    List<String>? tipo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tipo = tipo,
        super(firestoreUtilData);

  // "tipo" field.
  List<String>? _tipo;
  List<String> get tipo => _tipo ?? const [];
  set tipo(List<String>? val) => _tipo = val;
  void updateTipo(Function(List<String>) updateFn) => updateFn(_tipo ??= []);
  bool hasTipo() => _tipo != null;

  static UsersEmpresaQualificacaoStruct fromMap(Map<String, dynamic> data) =>
      UsersEmpresaQualificacaoStruct(
        tipo: getDataList(data['tipo']),
      );

  static UsersEmpresaQualificacaoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? UsersEmpresaQualificacaoStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'tipo': _tipo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tipo': serializeParam(
          _tipo,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static UsersEmpresaQualificacaoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UsersEmpresaQualificacaoStruct(
        tipo: deserializeParam<String>(
          data['tipo'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'UsersEmpresaQualificacaoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UsersEmpresaQualificacaoStruct &&
        listEquality.equals(tipo, other.tipo);
  }

  @override
  int get hashCode => const ListEquality().hash([tipo]);
}

UsersEmpresaQualificacaoStruct createUsersEmpresaQualificacaoStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UsersEmpresaQualificacaoStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UsersEmpresaQualificacaoStruct? updateUsersEmpresaQualificacaoStruct(
  UsersEmpresaQualificacaoStruct? usersEmpresaQualificacao, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    usersEmpresaQualificacao
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUsersEmpresaQualificacaoStructData(
  Map<String, dynamic> firestoreData,
  UsersEmpresaQualificacaoStruct? usersEmpresaQualificacao,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (usersEmpresaQualificacao == null) {
    return;
  }
  if (usersEmpresaQualificacao.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      usersEmpresaQualificacao.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final usersEmpresaQualificacaoData = getUsersEmpresaQualificacaoFirestoreData(
      usersEmpresaQualificacao, forFieldValue);
  final nestedData =
      usersEmpresaQualificacaoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      usersEmpresaQualificacao.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUsersEmpresaQualificacaoFirestoreData(
  UsersEmpresaQualificacaoStruct? usersEmpresaQualificacao, [
  bool forFieldValue = false,
]) {
  if (usersEmpresaQualificacao == null) {
    return {};
  }
  final firestoreData = mapToFirestore(usersEmpresaQualificacao.toMap());

  // Add any Firestore field values
  usersEmpresaQualificacao.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUsersEmpresaQualificacaoListFirestoreData(
  List<UsersEmpresaQualificacaoStruct>? usersEmpresaQualificacaos,
) =>
    usersEmpresaQualificacaos
        ?.map((e) => getUsersEmpresaQualificacaoFirestoreData(e, true))
        .toList() ??
    [];
