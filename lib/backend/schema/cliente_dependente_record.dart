import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ClienteDependenteRecord extends FirestoreRecord {
  ClienteDependenteRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "parentesco" field.
  String? _parentesco;
  String get parentesco => _parentesco ?? '';
  bool hasParentesco() => _parentesco != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "idade" field.
  int? _idade;
  int get idade => _idade ?? 0;
  bool hasIdade() => _idade != null;

  // "data_nascimento" field.
  DateTime? _dataNascimento;
  DateTime? get dataNascimento => _dataNascimento;
  bool hasDataNascimento() => _dataNascimento != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  // "valor_creche" field.
  double? _valorCreche;
  double get valorCreche => _valorCreche ?? 0.0;
  bool hasValorCreche() => _valorCreche != null;

  // "valor_preescola" field.
  double? _valorPreescola;
  double get valorPreescola => _valorPreescola ?? 0.0;
  bool hasValorPreescola() => _valorPreescola != null;

  // "valor_fundamental" field.
  double? _valorFundamental;
  double get valorFundamental => _valorFundamental ?? 0.0;
  bool hasValorFundamental() => _valorFundamental != null;

  // "valor_medio" field.
  double? _valorMedio;
  double get valorMedio => _valorMedio ?? 0.0;
  bool hasValorMedio() => _valorMedio != null;

  // "valor_superior" field.
  double? _valorSuperior;
  double get valorSuperior => _valorSuperior ?? 0.0;
  bool hasValorSuperior() => _valorSuperior != null;

  // "valor_graduacao" field.
  double? _valorGraduacao;
  double get valorGraduacao => _valorGraduacao ?? 0.0;
  bool hasValorGraduacao() => _valorGraduacao != null;

  // "sexo" field.
  String? _sexo;
  String get sexo => _sexo ?? '';
  bool hasSexo() => _sexo != null;

  // "perpetuo" field.
  bool? _perpetuo;
  bool get perpetuo => _perpetuo ?? false;
  bool hasPerpetuo() => _perpetuo != null;

  // "check_custo" field.
  bool? _checkCusto;
  bool get checkCusto => _checkCusto ?? false;
  bool hasCheckCusto() => _checkCusto != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _parentesco = snapshotData['parentesco'] as String?;
    _nome = snapshotData['nome'] as String?;
    _idade = castToType<int>(snapshotData['idade']);
    _dataNascimento = snapshotData['data_nascimento'] as DateTime?;
    _valor = castToType<double>(snapshotData['valor']);
    _valorCreche = castToType<double>(snapshotData['valor_creche']);
    _valorPreescola = castToType<double>(snapshotData['valor_preescola']);
    _valorFundamental = castToType<double>(snapshotData['valor_fundamental']);
    _valorMedio = castToType<double>(snapshotData['valor_medio']);
    _valorSuperior = castToType<double>(snapshotData['valor_superior']);
    _valorGraduacao = castToType<double>(snapshotData['valor_graduacao']);
    _sexo = snapshotData['sexo'] as String?;
    _perpetuo = snapshotData['perpetuo'] as bool?;
    _checkCusto = snapshotData['check_custo'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cliente_dependente')
          : FirebaseFirestore.instance.collectionGroup('cliente_dependente');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('cliente_dependente').doc();

  static Stream<ClienteDependenteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClienteDependenteRecord.fromSnapshot(s));

  static Future<ClienteDependenteRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ClienteDependenteRecord.fromSnapshot(s));

  static ClienteDependenteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClienteDependenteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClienteDependenteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClienteDependenteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClienteDependenteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClienteDependenteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClienteDependenteRecordData({
  String? parentesco,
  String? nome,
  int? idade,
  DateTime? dataNascimento,
  double? valor,
  double? valorCreche,
  double? valorPreescola,
  double? valorFundamental,
  double? valorMedio,
  double? valorSuperior,
  double? valorGraduacao,
  String? sexo,
  bool? perpetuo,
  bool? checkCusto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'parentesco': parentesco,
      'nome': nome,
      'idade': idade,
      'data_nascimento': dataNascimento,
      'valor': valor,
      'valor_creche': valorCreche,
      'valor_preescola': valorPreescola,
      'valor_fundamental': valorFundamental,
      'valor_medio': valorMedio,
      'valor_superior': valorSuperior,
      'valor_graduacao': valorGraduacao,
      'sexo': sexo,
      'perpetuo': perpetuo,
      'check_custo': checkCusto,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClienteDependenteRecordDocumentEquality
    implements Equality<ClienteDependenteRecord> {
  const ClienteDependenteRecordDocumentEquality();

  @override
  bool equals(ClienteDependenteRecord? e1, ClienteDependenteRecord? e2) {
    return e1?.parentesco == e2?.parentesco &&
        e1?.nome == e2?.nome &&
        e1?.idade == e2?.idade &&
        e1?.dataNascimento == e2?.dataNascimento &&
        e1?.valor == e2?.valor &&
        e1?.valorCreche == e2?.valorCreche &&
        e1?.valorPreescola == e2?.valorPreescola &&
        e1?.valorFundamental == e2?.valorFundamental &&
        e1?.valorMedio == e2?.valorMedio &&
        e1?.valorSuperior == e2?.valorSuperior &&
        e1?.valorGraduacao == e2?.valorGraduacao &&
        e1?.sexo == e2?.sexo &&
        e1?.perpetuo == e2?.perpetuo &&
        e1?.checkCusto == e2?.checkCusto;
  }

  @override
  int hash(ClienteDependenteRecord? e) => const ListEquality().hash([
        e?.parentesco,
        e?.nome,
        e?.idade,
        e?.dataNascimento,
        e?.valor,
        e?.valorCreche,
        e?.valorPreescola,
        e?.valorFundamental,
        e?.valorMedio,
        e?.valorSuperior,
        e?.valorGraduacao,
        e?.sexo,
        e?.perpetuo,
        e?.checkCusto
      ]);

  @override
  bool isValidKey(Object? o) => o is ClienteDependenteRecord;
}
