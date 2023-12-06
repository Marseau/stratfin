import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class RelacionamentoRecord extends FirestoreRecord {
  RelacionamentoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "data_evento" field.
  DateTime? _dataEvento;
  DateTime? get dataEvento => _dataEvento;
  bool hasDataEvento() => _dataEvento != null;

  // "tipo_evento_rel" field.
  String? _tipoEventoRel;
  String get tipoEventoRel => _tipoEventoRel ?? '';
  bool hasTipoEventoRel() => _tipoEventoRel != null;

  // "relacionamento_numero" field.
  int? _relacionamentoNumero;
  int get relacionamentoNumero => _relacionamentoNumero ?? 0;
  bool hasRelacionamentoNumero() => _relacionamentoNumero != null;

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
    _tipoEventoRel = snapshotData['tipo_evento_rel'] as String?;
    _relacionamentoNumero =
        castToType<int>(snapshotData['relacionamento_numero']);
    _userVinculado = getDataList(snapshotData['user_vinculado']);
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('relacionamento');

  static Stream<RelacionamentoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RelacionamentoRecord.fromSnapshot(s));

  static Future<RelacionamentoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RelacionamentoRecord.fromSnapshot(s));

  static RelacionamentoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RelacionamentoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RelacionamentoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RelacionamentoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RelacionamentoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RelacionamentoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRelacionamentoRecordData({
  DateTime? dataEvento,
  String? tipoEventoRel,
  int? relacionamentoNumero,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'data_evento': dataEvento,
      'tipo_evento_rel': tipoEventoRel,
      'relacionamento_numero': relacionamentoNumero,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class RelacionamentoRecordDocumentEquality
    implements Equality<RelacionamentoRecord> {
  const RelacionamentoRecordDocumentEquality();

  @override
  bool equals(RelacionamentoRecord? e1, RelacionamentoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dataEvento == e2?.dataEvento &&
        e1?.tipoEventoRel == e2?.tipoEventoRel &&
        e1?.relacionamentoNumero == e2?.relacionamentoNumero &&
        listEquality.equals(e1?.userVinculado, e2?.userVinculado) &&
        e1?.user == e2?.user;
  }

  @override
  int hash(RelacionamentoRecord? e) => const ListEquality().hash([
        e?.dataEvento,
        e?.tipoEventoRel,
        e?.relacionamentoNumero,
        e?.userVinculado,
        e?.user
      ]);

  @override
  bool isValidKey(Object? o) => o is RelacionamentoRecord;
}
