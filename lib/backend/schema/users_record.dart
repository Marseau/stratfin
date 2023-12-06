import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "usuario_tipo" field.
  String? _usuarioTipo;
  String get usuarioTipo => _usuarioTipo ?? '';
  bool hasUsuarioTipo() => _usuarioTipo != null;

  // "cpf_cnpj" field.
  String? _cpfCnpj;
  String get cpfCnpj => _cpfCnpj ?? '';
  bool hasCpfCnpj() => _cpfCnpj != null;

  // "ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? false;
  bool hasAtivo() => _ativo != null;

  // "user_tipo" field.
  String? _userTipo;
  String get userTipo => _userTipo ?? '';
  bool hasUserTipo() => _userTipo != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "apelido" field.
  String? _apelido;
  String get apelido => _apelido ?? '';
  bool hasApelido() => _apelido != null;

  // "perfil_empresa" field.
  bool? _perfilEmpresa;
  bool get perfilEmpresa => _perfilEmpresa ?? false;
  bool hasPerfilEmpresa() => _perfilEmpresa != null;

  // "nome_responsavel" field.
  String? _nomeResponsavel;
  String get nomeResponsavel => _nomeResponsavel ?? '';
  bool hasNomeResponsavel() => _nomeResponsavel != null;

  // "user_vinculante" field.
  List<DocumentReference>? _userVinculante;
  List<DocumentReference> get userVinculante => _userVinculante ?? const [];
  bool hasUserVinculante() => _userVinculante != null;

  // "user_vinculado" field.
  DocumentReference? _userVinculado;
  DocumentReference? get userVinculado => _userVinculado;
  bool hasUserVinculado() => _userVinculado != null;

  // "valor_ativos" field.
  double? _valorAtivos;
  double get valorAtivos => _valorAtivos ?? 0.0;
  bool hasValorAtivos() => _valorAtivos != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _usuarioTipo = snapshotData['usuario_tipo'] as String?;
    _cpfCnpj = snapshotData['cpf_cnpj'] as String?;
    _ativo = snapshotData['ativo'] as bool?;
    _userTipo = snapshotData['user_tipo'] as String?;
    _bio = snapshotData['bio'] as String?;
    _apelido = snapshotData['apelido'] as String?;
    _perfilEmpresa = snapshotData['perfil_empresa'] as bool?;
    _nomeResponsavel = snapshotData['nome_responsavel'] as String?;
    _userVinculante = getDataList(snapshotData['user_vinculante']);
    _userVinculado = snapshotData['user_vinculado'] as DocumentReference?;
    _valorAtivos = castToType<double>(snapshotData['valor_ativos']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? usuarioTipo,
  String? cpfCnpj,
  bool? ativo,
  String? userTipo,
  String? bio,
  String? apelido,
  bool? perfilEmpresa,
  String? nomeResponsavel,
  DocumentReference? userVinculado,
  double? valorAtivos,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'usuario_tipo': usuarioTipo,
      'cpf_cnpj': cpfCnpj,
      'ativo': ativo,
      'user_tipo': userTipo,
      'bio': bio,
      'apelido': apelido,
      'perfil_empresa': perfilEmpresa,
      'nome_responsavel': nomeResponsavel,
      'user_vinculado': userVinculado,
      'valor_ativos': valorAtivos,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.usuarioTipo == e2?.usuarioTipo &&
        e1?.cpfCnpj == e2?.cpfCnpj &&
        e1?.ativo == e2?.ativo &&
        e1?.userTipo == e2?.userTipo &&
        e1?.bio == e2?.bio &&
        e1?.apelido == e2?.apelido &&
        e1?.perfilEmpresa == e2?.perfilEmpresa &&
        e1?.nomeResponsavel == e2?.nomeResponsavel &&
        listEquality.equals(e1?.userVinculante, e2?.userVinculante) &&
        e1?.userVinculado == e2?.userVinculado &&
        e1?.valorAtivos == e2?.valorAtivos;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.usuarioTipo,
        e?.cpfCnpj,
        e?.ativo,
        e?.userTipo,
        e?.bio,
        e?.apelido,
        e?.perfilEmpresa,
        e?.nomeResponsavel,
        e?.userVinculante,
        e?.userVinculado,
        e?.valorAtivos
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
