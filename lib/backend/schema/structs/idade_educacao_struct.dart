// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IdadeEducacaoStruct extends FFFirebaseStruct {
  IdadeEducacaoStruct({
    int? idadeCreche,
    int? idadePreescola,
    int? idadeEnsinofundamental,
    int? idadeEnsinomedio,
    int? idadeEnsinosuperior,
    int? idadeEnsinograducao,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _idadeCreche = idadeCreche,
        _idadePreescola = idadePreescola,
        _idadeEnsinofundamental = idadeEnsinofundamental,
        _idadeEnsinomedio = idadeEnsinomedio,
        _idadeEnsinosuperior = idadeEnsinosuperior,
        _idadeEnsinograducao = idadeEnsinograducao,
        super(firestoreUtilData);

  // "idade_creche" field.
  int? _idadeCreche;
  int get idadeCreche => _idadeCreche ?? 0;
  set idadeCreche(int? val) => _idadeCreche = val;
  void incrementIdadeCreche(int amount) => _idadeCreche = idadeCreche + amount;
  bool hasIdadeCreche() => _idadeCreche != null;

  // "idade_preescola" field.
  int? _idadePreescola;
  int get idadePreescola => _idadePreescola ?? 0;
  set idadePreescola(int? val) => _idadePreescola = val;
  void incrementIdadePreescola(int amount) =>
      _idadePreescola = idadePreescola + amount;
  bool hasIdadePreescola() => _idadePreescola != null;

  // "idade_ensinofundamental" field.
  int? _idadeEnsinofundamental;
  int get idadeEnsinofundamental => _idadeEnsinofundamental ?? 0;
  set idadeEnsinofundamental(int? val) => _idadeEnsinofundamental = val;
  void incrementIdadeEnsinofundamental(int amount) =>
      _idadeEnsinofundamental = idadeEnsinofundamental + amount;
  bool hasIdadeEnsinofundamental() => _idadeEnsinofundamental != null;

  // "idade_ensinomedio" field.
  int? _idadeEnsinomedio;
  int get idadeEnsinomedio => _idadeEnsinomedio ?? 0;
  set idadeEnsinomedio(int? val) => _idadeEnsinomedio = val;
  void incrementIdadeEnsinomedio(int amount) =>
      _idadeEnsinomedio = idadeEnsinomedio + amount;
  bool hasIdadeEnsinomedio() => _idadeEnsinomedio != null;

  // "idade_ensinosuperior" field.
  int? _idadeEnsinosuperior;
  int get idadeEnsinosuperior => _idadeEnsinosuperior ?? 0;
  set idadeEnsinosuperior(int? val) => _idadeEnsinosuperior = val;
  void incrementIdadeEnsinosuperior(int amount) =>
      _idadeEnsinosuperior = idadeEnsinosuperior + amount;
  bool hasIdadeEnsinosuperior() => _idadeEnsinosuperior != null;

  // "idade_ensinograducao" field.
  int? _idadeEnsinograducao;
  int get idadeEnsinograducao => _idadeEnsinograducao ?? 0;
  set idadeEnsinograducao(int? val) => _idadeEnsinograducao = val;
  void incrementIdadeEnsinograducao(int amount) =>
      _idadeEnsinograducao = idadeEnsinograducao + amount;
  bool hasIdadeEnsinograducao() => _idadeEnsinograducao != null;

  static IdadeEducacaoStruct fromMap(Map<String, dynamic> data) =>
      IdadeEducacaoStruct(
        idadeCreche: castToType<int>(data['idade_creche']),
        idadePreescola: castToType<int>(data['idade_preescola']),
        idadeEnsinofundamental:
            castToType<int>(data['idade_ensinofundamental']),
        idadeEnsinomedio: castToType<int>(data['idade_ensinomedio']),
        idadeEnsinosuperior: castToType<int>(data['idade_ensinosuperior']),
        idadeEnsinograducao: castToType<int>(data['idade_ensinograducao']),
      );

  static IdadeEducacaoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? IdadeEducacaoStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'idade_creche': _idadeCreche,
        'idade_preescola': _idadePreescola,
        'idade_ensinofundamental': _idadeEnsinofundamental,
        'idade_ensinomedio': _idadeEnsinomedio,
        'idade_ensinosuperior': _idadeEnsinosuperior,
        'idade_ensinograducao': _idadeEnsinograducao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'idade_creche': serializeParam(
          _idadeCreche,
          ParamType.int,
        ),
        'idade_preescola': serializeParam(
          _idadePreescola,
          ParamType.int,
        ),
        'idade_ensinofundamental': serializeParam(
          _idadeEnsinofundamental,
          ParamType.int,
        ),
        'idade_ensinomedio': serializeParam(
          _idadeEnsinomedio,
          ParamType.int,
        ),
        'idade_ensinosuperior': serializeParam(
          _idadeEnsinosuperior,
          ParamType.int,
        ),
        'idade_ensinograducao': serializeParam(
          _idadeEnsinograducao,
          ParamType.int,
        ),
      }.withoutNulls;

  static IdadeEducacaoStruct fromSerializableMap(Map<String, dynamic> data) =>
      IdadeEducacaoStruct(
        idadeCreche: deserializeParam(
          data['idade_creche'],
          ParamType.int,
          false,
        ),
        idadePreescola: deserializeParam(
          data['idade_preescola'],
          ParamType.int,
          false,
        ),
        idadeEnsinofundamental: deserializeParam(
          data['idade_ensinofundamental'],
          ParamType.int,
          false,
        ),
        idadeEnsinomedio: deserializeParam(
          data['idade_ensinomedio'],
          ParamType.int,
          false,
        ),
        idadeEnsinosuperior: deserializeParam(
          data['idade_ensinosuperior'],
          ParamType.int,
          false,
        ),
        idadeEnsinograducao: deserializeParam(
          data['idade_ensinograducao'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'IdadeEducacaoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IdadeEducacaoStruct &&
        idadeCreche == other.idadeCreche &&
        idadePreescola == other.idadePreescola &&
        idadeEnsinofundamental == other.idadeEnsinofundamental &&
        idadeEnsinomedio == other.idadeEnsinomedio &&
        idadeEnsinosuperior == other.idadeEnsinosuperior &&
        idadeEnsinograducao == other.idadeEnsinograducao;
  }

  @override
  int get hashCode => const ListEquality().hash([
        idadeCreche,
        idadePreescola,
        idadeEnsinofundamental,
        idadeEnsinomedio,
        idadeEnsinosuperior,
        idadeEnsinograducao
      ]);
}

IdadeEducacaoStruct createIdadeEducacaoStruct({
  int? idadeCreche,
  int? idadePreescola,
  int? idadeEnsinofundamental,
  int? idadeEnsinomedio,
  int? idadeEnsinosuperior,
  int? idadeEnsinograducao,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IdadeEducacaoStruct(
      idadeCreche: idadeCreche,
      idadePreescola: idadePreescola,
      idadeEnsinofundamental: idadeEnsinofundamental,
      idadeEnsinomedio: idadeEnsinomedio,
      idadeEnsinosuperior: idadeEnsinosuperior,
      idadeEnsinograducao: idadeEnsinograducao,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IdadeEducacaoStruct? updateIdadeEducacaoStruct(
  IdadeEducacaoStruct? idadeEducacao, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    idadeEducacao
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIdadeEducacaoStructData(
  Map<String, dynamic> firestoreData,
  IdadeEducacaoStruct? idadeEducacao,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (idadeEducacao == null) {
    return;
  }
  if (idadeEducacao.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && idadeEducacao.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final idadeEducacaoData =
      getIdadeEducacaoFirestoreData(idadeEducacao, forFieldValue);
  final nestedData =
      idadeEducacaoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = idadeEducacao.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIdadeEducacaoFirestoreData(
  IdadeEducacaoStruct? idadeEducacao, [
  bool forFieldValue = false,
]) {
  if (idadeEducacao == null) {
    return {};
  }
  final firestoreData = mapToFirestore(idadeEducacao.toMap());

  // Add any Firestore field values
  idadeEducacao.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIdadeEducacaoListFirestoreData(
  List<IdadeEducacaoStruct>? idadeEducacaos,
) =>
    idadeEducacaos
        ?.map((e) => getIdadeEducacaoFirestoreData(e, true))
        .toList() ??
    [];
