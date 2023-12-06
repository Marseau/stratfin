import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ConvidadosRecord extends FirestoreRecord {
  ConvidadosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "nome_completo" field.
  String? _nomeCompleto;
  String get nomeCompleto => _nomeCompleto ?? '';
  bool hasNomeCompleto() => _nomeCompleto != null;

  // "cpf_cnpj" field.
  String? _cpfCnpj;
  String get cpfCnpj => _cpfCnpj ?? '';
  bool hasCpfCnpj() => _cpfCnpj != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "usuario_tipo" field.
  String? _usuarioTipo;
  String get usuarioTipo => _usuarioTipo ?? '';
  bool hasUsuarioTipo() => _usuarioTipo != null;

  // "data_envio" field.
  DateTime? _dataEnvio;
  DateTime? get dataEnvio => _dataEnvio;
  bool hasDataEnvio() => _dataEnvio != null;

  // "data_reenvio" field.
  DateTime? _dataReenvio;
  DateTime? get dataReenvio => _dataReenvio;
  bool hasDataReenvio() => _dataReenvio != null;

  // "data_login" field.
  DateTime? _dataLogin;
  DateTime? get dataLogin => _dataLogin;
  bool hasDataLogin() => _dataLogin != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "enviado" field.
  bool? _enviado;
  bool get enviado => _enviado ?? false;
  bool hasEnviado() => _enviado != null;

  // "email_emissor" field.
  String? _emailEmissor;
  String get emailEmissor => _emailEmissor ?? '';
  bool hasEmailEmissor() => _emailEmissor != null;

  // "user_convite" field.
  DocumentReference? _userConvite;
  DocumentReference? get userConvite => _userConvite;
  bool hasUserConvite() => _userConvite != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _nomeCompleto = snapshotData['nome_completo'] as String?;
    _cpfCnpj = snapshotData['cpf_cnpj'] as String?;
    _status = snapshotData['status'] as String?;
    _usuarioTipo = snapshotData['usuario_tipo'] as String?;
    _dataEnvio = snapshotData['data_envio'] as DateTime?;
    _dataReenvio = snapshotData['data_reenvio'] as DateTime?;
    _dataLogin = snapshotData['data_login'] as DateTime?;
    _link = snapshotData['link'] as String?;
    _enviado = snapshotData['enviado'] as bool?;
    _emailEmissor = snapshotData['email_emissor'] as String?;
    _userConvite = snapshotData['user_convite'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('convidados');

  static Stream<ConvidadosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConvidadosRecord.fromSnapshot(s));

  static Future<ConvidadosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConvidadosRecord.fromSnapshot(s));

  static ConvidadosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConvidadosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConvidadosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConvidadosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConvidadosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConvidadosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConvidadosRecordData({
  String? email,
  String? nomeCompleto,
  String? cpfCnpj,
  String? status,
  String? usuarioTipo,
  DateTime? dataEnvio,
  DateTime? dataReenvio,
  DateTime? dataLogin,
  String? link,
  bool? enviado,
  String? emailEmissor,
  DocumentReference? userConvite,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'nome_completo': nomeCompleto,
      'cpf_cnpj': cpfCnpj,
      'status': status,
      'usuario_tipo': usuarioTipo,
      'data_envio': dataEnvio,
      'data_reenvio': dataReenvio,
      'data_login': dataLogin,
      'link': link,
      'enviado': enviado,
      'email_emissor': emailEmissor,
      'user_convite': userConvite,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConvidadosRecordDocumentEquality implements Equality<ConvidadosRecord> {
  const ConvidadosRecordDocumentEquality();

  @override
  bool equals(ConvidadosRecord? e1, ConvidadosRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.nomeCompleto == e2?.nomeCompleto &&
        e1?.cpfCnpj == e2?.cpfCnpj &&
        e1?.status == e2?.status &&
        e1?.usuarioTipo == e2?.usuarioTipo &&
        e1?.dataEnvio == e2?.dataEnvio &&
        e1?.dataReenvio == e2?.dataReenvio &&
        e1?.dataLogin == e2?.dataLogin &&
        e1?.link == e2?.link &&
        e1?.enviado == e2?.enviado &&
        e1?.emailEmissor == e2?.emailEmissor &&
        e1?.userConvite == e2?.userConvite;
  }

  @override
  int hash(ConvidadosRecord? e) => const ListEquality().hash([
        e?.email,
        e?.nomeCompleto,
        e?.cpfCnpj,
        e?.status,
        e?.usuarioTipo,
        e?.dataEnvio,
        e?.dataReenvio,
        e?.dataLogin,
        e?.link,
        e?.enviado,
        e?.emailEmissor,
        e?.userConvite
      ]);

  @override
  bool isValidKey(Object? o) => o is ConvidadosRecord;
}
