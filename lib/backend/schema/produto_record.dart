import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ProdutoRecord extends FirestoreRecord {
  ProdutoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tipo_produto" field.
  String? _tipoProduto;
  String get tipoProduto => _tipoProduto ?? '';
  bool hasTipoProduto() => _tipoProduto != null;

  // "Nome_produto" field.
  String? _nomeProduto;
  String get nomeProduto => _nomeProduto ?? '';
  bool hasNomeProduto() => _nomeProduto != null;

  // "data_inclusao" field.
  DateTime? _dataInclusao;
  DateTime? get dataInclusao => _dataInclusao;
  bool hasDataInclusao() => _dataInclusao != null;

  // "caracteristicas" field.
  String? _caracteristicas;
  String get caracteristicas => _caracteristicas ?? '';
  bool hasCaracteristicas() => _caracteristicas != null;

  // "restricoes_elegibilidade" field.
  String? _restricoesElegibilidade;
  String get restricoesElegibilidade => _restricoesElegibilidade ?? '';
  bool hasRestricoesElegibilidade() => _restricoesElegibilidade != null;

  // "tarifas_custosadicionais" field.
  String? _tarifasCustosadicionais;
  String get tarifasCustosadicionais => _tarifasCustosadicionais ?? '';
  bool hasTarifasCustosadicionais() => _tarifasCustosadicionais != null;

  // "cenario" field.
  List<DocumentReference>? _cenario;
  List<DocumentReference> get cenario => _cenario ?? const [];
  bool hasCenario() => _cenario != null;

  // "user_produto" field.
  DocumentReference? _userProduto;
  DocumentReference? get userProduto => _userProduto;
  bool hasUserProduto() => _userProduto != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "riscos_associados" field.
  String? _riscosAssociados;
  String get riscosAssociados => _riscosAssociados ?? '';
  bool hasRiscosAssociados() => _riscosAssociados != null;

  // "produto" field.
  String? _produto;
  String get produto => _produto ?? '';
  bool hasProduto() => _produto != null;

  // "beneficios_fiscais" field.
  String? _beneficiosFiscais;
  String get beneficiosFiscais => _beneficiosFiscais ?? '';
  bool hasBeneficiosFiscais() => _beneficiosFiscais != null;

  // "nivel_protecao_capital" field.
  String? _nivelProtecaoCapital;
  String get nivelProtecaoCapital => _nivelProtecaoCapital ?? '';
  bool hasNivelProtecaoCapital() => _nivelProtecaoCapital != null;

  // "rating" field.
  String? _rating;
  String get rating => _rating ?? '';
  bool hasRating() => _rating != null;

  // "volatilidade" field.
  String? _volatilidade;
  String get volatilidade => _volatilidade ?? '';
  bool hasVolatilidade() => _volatilidade != null;

  // "regulamentacao" field.
  String? _regulamentacao;
  String get regulamentacao => _regulamentacao ?? '';
  bool hasRegulamentacao() => _regulamentacao != null;

  // "impostos_taxas" field.
  String? _impostosTaxas;
  String get impostosTaxas => _impostosTaxas ?? '';
  bool hasImpostosTaxas() => _impostosTaxas != null;

  void _initializeFields() {
    _tipoProduto = snapshotData['tipo_produto'] as String?;
    _nomeProduto = snapshotData['Nome_produto'] as String?;
    _dataInclusao = snapshotData['data_inclusao'] as DateTime?;
    _caracteristicas = snapshotData['caracteristicas'] as String?;
    _restricoesElegibilidade =
        snapshotData['restricoes_elegibilidade'] as String?;
    _tarifasCustosadicionais =
        snapshotData['tarifas_custosadicionais'] as String?;
    _cenario = getDataList(snapshotData['cenario']);
    _userProduto = snapshotData['user_produto'] as DocumentReference?;
    _status = snapshotData['status'] as bool?;
    _uid = snapshotData['uid'] as String?;
    _riscosAssociados = snapshotData['riscos_associados'] as String?;
    _produto = snapshotData['produto'] as String?;
    _beneficiosFiscais = snapshotData['beneficios_fiscais'] as String?;
    _nivelProtecaoCapital = snapshotData['nivel_protecao_capital'] as String?;
    _rating = snapshotData['rating'] as String?;
    _volatilidade = snapshotData['volatilidade'] as String?;
    _regulamentacao = snapshotData['regulamentacao'] as String?;
    _impostosTaxas = snapshotData['impostos_taxas'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Produto');

  static Stream<ProdutoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProdutoRecord.fromSnapshot(s));

  static Future<ProdutoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProdutoRecord.fromSnapshot(s));

  static ProdutoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProdutoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProdutoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProdutoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProdutoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProdutoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProdutoRecordData({
  String? tipoProduto,
  String? nomeProduto,
  DateTime? dataInclusao,
  String? caracteristicas,
  String? restricoesElegibilidade,
  String? tarifasCustosadicionais,
  DocumentReference? userProduto,
  bool? status,
  String? uid,
  String? riscosAssociados,
  String? produto,
  String? beneficiosFiscais,
  String? nivelProtecaoCapital,
  String? rating,
  String? volatilidade,
  String? regulamentacao,
  String? impostosTaxas,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipo_produto': tipoProduto,
      'Nome_produto': nomeProduto,
      'data_inclusao': dataInclusao,
      'caracteristicas': caracteristicas,
      'restricoes_elegibilidade': restricoesElegibilidade,
      'tarifas_custosadicionais': tarifasCustosadicionais,
      'user_produto': userProduto,
      'status': status,
      'uid': uid,
      'riscos_associados': riscosAssociados,
      'produto': produto,
      'beneficios_fiscais': beneficiosFiscais,
      'nivel_protecao_capital': nivelProtecaoCapital,
      'rating': rating,
      'volatilidade': volatilidade,
      'regulamentacao': regulamentacao,
      'impostos_taxas': impostosTaxas,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProdutoRecordDocumentEquality implements Equality<ProdutoRecord> {
  const ProdutoRecordDocumentEquality();

  @override
  bool equals(ProdutoRecord? e1, ProdutoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tipoProduto == e2?.tipoProduto &&
        e1?.nomeProduto == e2?.nomeProduto &&
        e1?.dataInclusao == e2?.dataInclusao &&
        e1?.caracteristicas == e2?.caracteristicas &&
        e1?.restricoesElegibilidade == e2?.restricoesElegibilidade &&
        e1?.tarifasCustosadicionais == e2?.tarifasCustosadicionais &&
        listEquality.equals(e1?.cenario, e2?.cenario) &&
        e1?.userProduto == e2?.userProduto &&
        e1?.status == e2?.status &&
        e1?.uid == e2?.uid &&
        e1?.riscosAssociados == e2?.riscosAssociados &&
        e1?.produto == e2?.produto &&
        e1?.beneficiosFiscais == e2?.beneficiosFiscais &&
        e1?.nivelProtecaoCapital == e2?.nivelProtecaoCapital &&
        e1?.rating == e2?.rating &&
        e1?.volatilidade == e2?.volatilidade &&
        e1?.regulamentacao == e2?.regulamentacao &&
        e1?.impostosTaxas == e2?.impostosTaxas;
  }

  @override
  int hash(ProdutoRecord? e) => const ListEquality().hash([
        e?.tipoProduto,
        e?.nomeProduto,
        e?.dataInclusao,
        e?.caracteristicas,
        e?.restricoesElegibilidade,
        e?.tarifasCustosadicionais,
        e?.cenario,
        e?.userProduto,
        e?.status,
        e?.uid,
        e?.riscosAssociados,
        e?.produto,
        e?.beneficiosFiscais,
        e?.nivelProtecaoCapital,
        e?.rating,
        e?.volatilidade,
        e?.regulamentacao,
        e?.impostosTaxas
      ]);

  @override
  bool isValidKey(Object? o) => o is ProdutoRecord;
}
