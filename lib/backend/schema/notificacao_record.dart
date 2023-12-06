import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class NotificacaoRecord extends FirestoreRecord {
  NotificacaoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "data_notificacao" field.
  DateTime? _dataNotificacao;
  DateTime? get dataNotificacao => _dataNotificacao;
  bool hasDataNotificacao() => _dataNotificacao != null;

  // "tipo_notificacao" field.
  String? _tipoNotificacao;
  String get tipoNotificacao => _tipoNotificacao ?? '';
  bool hasTipoNotificacao() => _tipoNotificacao != null;

  // "lida" field.
  bool? _lida;
  bool get lida => _lida ?? false;
  bool hasLida() => _lida != null;

  // "user_vinculado" field.
  List<DocumentReference>? _userVinculado;
  List<DocumentReference> get userVinculado => _userVinculado ?? const [];
  bool hasUserVinculado() => _userVinculado != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _dataNotificacao = snapshotData['data_notificacao'] as DateTime?;
    _tipoNotificacao = snapshotData['tipo_notificacao'] as String?;
    _lida = snapshotData['lida'] as bool?;
    _userVinculado = getDataList(snapshotData['user_vinculado']);
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notificacao');

  static Stream<NotificacaoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificacaoRecord.fromSnapshot(s));

  static Future<NotificacaoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificacaoRecord.fromSnapshot(s));

  static NotificacaoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificacaoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificacaoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificacaoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificacaoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificacaoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificacaoRecordData({
  DateTime? dataNotificacao,
  String? tipoNotificacao,
  bool? lida,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'data_notificacao': dataNotificacao,
      'tipo_notificacao': tipoNotificacao,
      'lida': lida,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificacaoRecordDocumentEquality implements Equality<NotificacaoRecord> {
  const NotificacaoRecordDocumentEquality();

  @override
  bool equals(NotificacaoRecord? e1, NotificacaoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dataNotificacao == e2?.dataNotificacao &&
        e1?.tipoNotificacao == e2?.tipoNotificacao &&
        e1?.lida == e2?.lida &&
        listEquality.equals(e1?.userVinculado, e2?.userVinculado) &&
        e1?.user == e2?.user;
  }

  @override
  int hash(NotificacaoRecord? e) => const ListEquality().hash([
        e?.dataNotificacao,
        e?.tipoNotificacao,
        e?.lida,
        e?.userVinculado,
        e?.user
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificacaoRecord;
}
