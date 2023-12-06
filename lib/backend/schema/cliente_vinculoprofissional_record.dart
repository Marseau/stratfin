import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ClienteVinculoprofissionalRecord extends FirestoreRecord {
  ClienteVinculoprofissionalRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "vinculo_profissional" field.
  String? _vinculoProfissional;
  String get vinculoProfissional => _vinculoProfissional ?? '';
  bool hasVinculoProfissional() => _vinculoProfissional != null;

  // "remuneracao_fixa_bruta" field.
  double? _remuneracaoFixaBruta;
  double get remuneracaoFixaBruta => _remuneracaoFixaBruta ?? 0.0;
  bool hasRemuneracaoFixaBruta() => _remuneracaoFixaBruta != null;

  // "remuneracao_fixa_liquida" field.
  double? _remuneracaoFixaLiquida;
  double get remuneracaoFixaLiquida => _remuneracaoFixaLiquida ?? 0.0;
  bool hasRemuneracaoFixaLiquida() => _remuneracaoFixaLiquida != null;

  // "remuneracao_variavel" field.
  double? _remuneracaoVariavel;
  double get remuneracaoVariavel => _remuneracaoVariavel ?? 0.0;
  bool hasRemuneracaoVariavel() => _remuneracaoVariavel != null;

  // "ocupacao" field.
  String? _ocupacao;
  String get ocupacao => _ocupacao ?? '';
  bool hasOcupacao() => _ocupacao != null;

  // "saldo_fgts" field.
  double? _saldoFgts;
  double get saldoFgts => _saldoFgts ?? 0.0;
  bool hasSaldoFgts() => _saldoFgts != null;

  // "contribuicao_inss" field.
  double? _contribuicaoInss;
  double get contribuicaoInss => _contribuicaoInss ?? 0.0;
  bool hasContribuicaoInss() => _contribuicaoInss != null;

  // "check_custo" field.
  bool? _checkCusto;
  bool get checkCusto => _checkCusto ?? false;
  bool hasCheckCusto() => _checkCusto != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _vinculoProfissional = snapshotData['vinculo_profissional'] as String?;
    _remuneracaoFixaBruta =
        castToType<double>(snapshotData['remuneracao_fixa_bruta']);
    _remuneracaoFixaLiquida =
        castToType<double>(snapshotData['remuneracao_fixa_liquida']);
    _remuneracaoVariavel =
        castToType<double>(snapshotData['remuneracao_variavel']);
    _ocupacao = snapshotData['ocupacao'] as String?;
    _saldoFgts = castToType<double>(snapshotData['saldo_fgts']);
    _contribuicaoInss = castToType<double>(snapshotData['contribuicao_inss']);
    _checkCusto = snapshotData['check_custo'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cliente_vinculoprofissional')
          : FirebaseFirestore.instance
              .collectionGroup('cliente_vinculoprofissional');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('cliente_vinculoprofissional').doc();

  static Stream<ClienteVinculoprofissionalRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => ClienteVinculoprofissionalRecord.fromSnapshot(s));

  static Future<ClienteVinculoprofissionalRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ClienteVinculoprofissionalRecord.fromSnapshot(s));

  static ClienteVinculoprofissionalRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ClienteVinculoprofissionalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClienteVinculoprofissionalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClienteVinculoprofissionalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClienteVinculoprofissionalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClienteVinculoprofissionalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClienteVinculoprofissionalRecordData({
  String? vinculoProfissional,
  double? remuneracaoFixaBruta,
  double? remuneracaoFixaLiquida,
  double? remuneracaoVariavel,
  String? ocupacao,
  double? saldoFgts,
  double? contribuicaoInss,
  bool? checkCusto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'vinculo_profissional': vinculoProfissional,
      'remuneracao_fixa_bruta': remuneracaoFixaBruta,
      'remuneracao_fixa_liquida': remuneracaoFixaLiquida,
      'remuneracao_variavel': remuneracaoVariavel,
      'ocupacao': ocupacao,
      'saldo_fgts': saldoFgts,
      'contribuicao_inss': contribuicaoInss,
      'check_custo': checkCusto,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClienteVinculoprofissionalRecordDocumentEquality
    implements Equality<ClienteVinculoprofissionalRecord> {
  const ClienteVinculoprofissionalRecordDocumentEquality();

  @override
  bool equals(ClienteVinculoprofissionalRecord? e1,
      ClienteVinculoprofissionalRecord? e2) {
    return e1?.vinculoProfissional == e2?.vinculoProfissional &&
        e1?.remuneracaoFixaBruta == e2?.remuneracaoFixaBruta &&
        e1?.remuneracaoFixaLiquida == e2?.remuneracaoFixaLiquida &&
        e1?.remuneracaoVariavel == e2?.remuneracaoVariavel &&
        e1?.ocupacao == e2?.ocupacao &&
        e1?.saldoFgts == e2?.saldoFgts &&
        e1?.contribuicaoInss == e2?.contribuicaoInss &&
        e1?.checkCusto == e2?.checkCusto;
  }

  @override
  int hash(ClienteVinculoprofissionalRecord? e) => const ListEquality().hash([
        e?.vinculoProfissional,
        e?.remuneracaoFixaBruta,
        e?.remuneracaoFixaLiquida,
        e?.remuneracaoVariavel,
        e?.ocupacao,
        e?.saldoFgts,
        e?.contribuicaoInss,
        e?.checkCusto
      ]);

  @override
  bool isValidKey(Object? o) => o is ClienteVinculoprofissionalRecord;
}
