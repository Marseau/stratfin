import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ClienteRecord extends FirestoreRecord {
  ClienteRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "data_nascimento" field.
  DateTime? _dataNascimento;
  DateTime? get dataNascimento => _dataNascimento;
  bool hasDataNascimento() => _dataNascimento != null;

  // "idade" field.
  int? _idade;
  int get idade => _idade ?? 0;
  bool hasIdade() => _idade != null;

  // "suitability" field.
  String? _suitability;
  String get suitability => _suitability ?? '';
  bool hasSuitability() => _suitability != null;

  // "declaracaoIR" field.
  String? _declaracaoIR;
  String get declaracaoIR => _declaracaoIR ?? '';
  bool hasDeclaracaoIR() => _declaracaoIR != null;

  // "qualificacao" field.
  String? _qualificacao;
  String get qualificacao => _qualificacao ?? '';
  bool hasQualificacao() => _qualificacao != null;

  // "informacoes_adicionais" field.
  String? _informacoesAdicionais;
  String get informacoesAdicionais => _informacoesAdicionais ?? '';
  bool hasInformacoesAdicionais() => _informacoesAdicionais != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "estadocivil" field.
  String? _estadocivil;
  String get estadocivil => _estadocivil ?? '';
  bool hasEstadocivil() => _estadocivil != null;

  // "usuario_externo" field.
  bool? _usuarioExterno;
  bool get usuarioExterno => _usuarioExterno ?? false;
  bool hasUsuarioExterno() => _usuarioExterno != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "user_vinculado" field.
  List<DocumentReference>? _userVinculado;
  List<DocumentReference> get userVinculado => _userVinculado ?? const [];
  bool hasUserVinculado() => _userVinculado != null;

  // "custo_mensal" field.
  double? _custoMensal;
  double get custoMensal => _custoMensal ?? 0.0;
  bool hasCustoMensal() => _custoMensal != null;

  void _initializeFields() {
    _dataNascimento = snapshotData['data_nascimento'] as DateTime?;
    _idade = castToType<int>(snapshotData['idade']);
    _suitability = snapshotData['suitability'] as String?;
    _declaracaoIR = snapshotData['declaracaoIR'] as String?;
    _qualificacao = snapshotData['qualificacao'] as String?;
    _informacoesAdicionais = snapshotData['informacoes_adicionais'] as String?;
    _bio = snapshotData['bio'] as String?;
    _uid = snapshotData['uid'] as String?;
    _estadocivil = snapshotData['estadocivil'] as String?;
    _usuarioExterno = snapshotData['usuario_externo'] as bool?;
    _user = snapshotData['user'] as DocumentReference?;
    _displayName = snapshotData['display_name'] as String?;
    _email = snapshotData['email'] as String?;
    _userVinculado = getDataList(snapshotData['user_vinculado']);
    _custoMensal = castToType<double>(snapshotData['custo_mensal']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cliente');

  static Stream<ClienteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClienteRecord.fromSnapshot(s));

  static Future<ClienteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClienteRecord.fromSnapshot(s));

  static ClienteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClienteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClienteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClienteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClienteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClienteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClienteRecordData({
  DateTime? dataNascimento,
  int? idade,
  String? suitability,
  String? declaracaoIR,
  String? qualificacao,
  String? informacoesAdicionais,
  String? bio,
  String? uid,
  String? estadocivil,
  bool? usuarioExterno,
  DocumentReference? user,
  String? displayName,
  String? email,
  double? custoMensal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'data_nascimento': dataNascimento,
      'idade': idade,
      'suitability': suitability,
      'declaracaoIR': declaracaoIR,
      'qualificacao': qualificacao,
      'informacoes_adicionais': informacoesAdicionais,
      'bio': bio,
      'uid': uid,
      'estadocivil': estadocivil,
      'usuario_externo': usuarioExterno,
      'user': user,
      'display_name': displayName,
      'email': email,
      'custo_mensal': custoMensal,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClienteRecordDocumentEquality implements Equality<ClienteRecord> {
  const ClienteRecordDocumentEquality();

  @override
  bool equals(ClienteRecord? e1, ClienteRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dataNascimento == e2?.dataNascimento &&
        e1?.idade == e2?.idade &&
        e1?.suitability == e2?.suitability &&
        e1?.declaracaoIR == e2?.declaracaoIR &&
        e1?.qualificacao == e2?.qualificacao &&
        e1?.informacoesAdicionais == e2?.informacoesAdicionais &&
        e1?.bio == e2?.bio &&
        e1?.uid == e2?.uid &&
        e1?.estadocivil == e2?.estadocivil &&
        e1?.usuarioExterno == e2?.usuarioExterno &&
        e1?.user == e2?.user &&
        e1?.displayName == e2?.displayName &&
        e1?.email == e2?.email &&
        listEquality.equals(e1?.userVinculado, e2?.userVinculado) &&
        e1?.custoMensal == e2?.custoMensal;
  }

  @override
  int hash(ClienteRecord? e) => const ListEquality().hash([
        e?.dataNascimento,
        e?.idade,
        e?.suitability,
        e?.declaracaoIR,
        e?.qualificacao,
        e?.informacoesAdicionais,
        e?.bio,
        e?.uid,
        e?.estadocivil,
        e?.usuarioExterno,
        e?.user,
        e?.displayName,
        e?.email,
        e?.userVinculado,
        e?.custoMensal
      ]);

  @override
  bool isValidKey(Object? o) => o is ClienteRecord;
}
