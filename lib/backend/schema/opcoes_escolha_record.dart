import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class OpcoesEscolhaRecord extends FirestoreRecord {
  OpcoesEscolhaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "produto" field.
  List<String>? _produto;
  List<String> get produto => _produto ?? const [];
  bool hasProduto() => _produto != null;

  // "adm_relacionamento" field.
  List<String>? _admRelacionamento;
  List<String> get admRelacionamento => _admRelacionamento ?? const [];
  bool hasAdmRelacionamento() => _admRelacionamento != null;

  // "adm_notificacao" field.
  List<String>? _admNotificacao;
  List<String> get admNotificacao => _admNotificacao ?? const [];
  bool hasAdmNotificacao() => _admNotificacao != null;

  // "adm_atividade" field.
  List<String>? _admAtividade;
  List<String> get admAtividade => _admAtividade ?? const [];
  bool hasAdmAtividade() => _admAtividade != null;

  // "escolha" field.
  OpcoesVariaveisStruct? _escolha;
  OpcoesVariaveisStruct get escolha => _escolha ?? OpcoesVariaveisStruct();
  bool hasEscolha() => _escolha != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "cor" field.
  CoresDefinicaoStruct? _cor;
  CoresDefinicaoStruct get cor => _cor ?? CoresDefinicaoStruct();
  bool hasCor() => _cor != null;

  void _initializeFields() {
    _produto = getDataList(snapshotData['produto']);
    _admRelacionamento = getDataList(snapshotData['adm_relacionamento']);
    _admNotificacao = getDataList(snapshotData['adm_notificacao']);
    _admAtividade = getDataList(snapshotData['adm_atividade']);
    _escolha = OpcoesVariaveisStruct.maybeFromMap(snapshotData['escolha']);
    _uid = snapshotData['uid'] as String?;
    _cor = CoresDefinicaoStruct.maybeFromMap(snapshotData['cor']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('opcoes_escolha');

  static Stream<OpcoesEscolhaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OpcoesEscolhaRecord.fromSnapshot(s));

  static Future<OpcoesEscolhaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OpcoesEscolhaRecord.fromSnapshot(s));

  static OpcoesEscolhaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OpcoesEscolhaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OpcoesEscolhaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OpcoesEscolhaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OpcoesEscolhaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OpcoesEscolhaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOpcoesEscolhaRecordData({
  OpcoesVariaveisStruct? escolha,
  String? uid,
  CoresDefinicaoStruct? cor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'escolha': OpcoesVariaveisStruct().toMap(),
      'uid': uid,
      'cor': CoresDefinicaoStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "escolha" field.
  addOpcoesVariaveisStructData(firestoreData, escolha, 'escolha');

  // Handle nested data for "cor" field.
  addCoresDefinicaoStructData(firestoreData, cor, 'cor');

  return firestoreData;
}

class OpcoesEscolhaRecordDocumentEquality
    implements Equality<OpcoesEscolhaRecord> {
  const OpcoesEscolhaRecordDocumentEquality();

  @override
  bool equals(OpcoesEscolhaRecord? e1, OpcoesEscolhaRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.produto, e2?.produto) &&
        listEquality.equals(e1?.admRelacionamento, e2?.admRelacionamento) &&
        listEquality.equals(e1?.admNotificacao, e2?.admNotificacao) &&
        listEquality.equals(e1?.admAtividade, e2?.admAtividade) &&
        e1?.escolha == e2?.escolha &&
        e1?.uid == e2?.uid &&
        e1?.cor == e2?.cor;
  }

  @override
  int hash(OpcoesEscolhaRecord? e) => const ListEquality().hash([
        e?.produto,
        e?.admRelacionamento,
        e?.admNotificacao,
        e?.admAtividade,
        e?.escolha,
        e?.uid,
        e?.cor
      ]);

  @override
  bool isValidKey(Object? o) => o is OpcoesEscolhaRecord;
}
