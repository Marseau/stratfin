import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AtividadeRecord extends FirestoreRecord {
  AtividadeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "data_evento" field.
  DateTime? _dataEvento;
  DateTime? get dataEvento => _dataEvento;
  bool hasDataEvento() => _dataEvento != null;

  // "tipo_atividade" field.
  String? _tipoAtividade;
  String get tipoAtividade => _tipoAtividade ?? '';
  bool hasTipoAtividade() => _tipoAtividade != null;

  // "user_vinculado" field.
  List<DocumentReference>? _userVinculado;
  List<DocumentReference> get userVinculado => _userVinculado ?? const [];
  bool hasUserVinculado() => _userVinculado != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _dataEvento = snapshotData['data_evento'] as DateTime?;
    _tipoAtividade = snapshotData['tipo_atividade'] as String?;
    _userVinculado = getDataList(snapshotData['user_vinculado']);
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('atividade');

  static Stream<AtividadeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AtividadeRecord.fromSnapshot(s));

  static Future<AtividadeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AtividadeRecord.fromSnapshot(s));

  static AtividadeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AtividadeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AtividadeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AtividadeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AtividadeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AtividadeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAtividadeRecordData({
  DateTime? dataEvento,
  String? tipoAtividade,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'data_evento': dataEvento,
      'tipo_atividade': tipoAtividade,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class AtividadeRecordDocumentEquality implements Equality<AtividadeRecord> {
  const AtividadeRecordDocumentEquality();

  @override
  bool equals(AtividadeRecord? e1, AtividadeRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dataEvento == e2?.dataEvento &&
        e1?.tipoAtividade == e2?.tipoAtividade &&
        listEquality.equals(e1?.userVinculado, e2?.userVinculado) &&
        e1?.user == e2?.user;
  }

  @override
  int hash(AtividadeRecord? e) => const ListEquality()
      .hash([e?.dataEvento, e?.tipoAtividade, e?.userVinculado, e?.user]);

  @override
  bool isValidKey(Object? o) => o is AtividadeRecord;
}
