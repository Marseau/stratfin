import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ClienteAtivoFinanceiroRecord extends FirestoreRecord {
  ClienteAtivoFinanceiroRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tipo_ativo" field.
  String? _tipoAtivo;
  String get tipoAtivo => _tipoAtivo ?? '';
  bool hasTipoAtivo() => _tipoAtivo != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "data_aquisicao" field.
  DateTime? _dataAquisicao;
  DateTime? get dataAquisicao => _dataAquisicao;
  bool hasDataAquisicao() => _dataAquisicao != null;

  // "objetivo" field.
  String? _objetivo;
  String get objetivo => _objetivo ?? '';
  bool hasObjetivo() => _objetivo != null;

  // "observacoes" field.
  String? _observacoes;
  String get observacoes => _observacoes ?? '';
  bool hasObservacoes() => _observacoes != null;

  // "check_custo" field.
  bool? _checkCusto;
  bool get checkCusto => _checkCusto ?? false;
  bool hasCheckCusto() => _checkCusto != null;

  // "instituicao_custodiante" field.
  String? _instituicaoCustodiante;
  String get instituicaoCustodiante => _instituicaoCustodiante ?? '';
  bool hasInstituicaoCustodiante() => _instituicaoCustodiante != null;

  // "valor_mercado" field.
  double? _valorMercado;
  double get valorMercado => _valorMercado ?? 0.0;
  bool hasValorMercado() => _valorMercado != null;

  // "rendimento_anual" field.
  double? _rendimentoAnual;
  double get rendimentoAnual => _rendimentoAnual ?? 0.0;
  bool hasRendimentoAnual() => _rendimentoAnual != null;

  // "liquidez" field.
  String? _liquidez;
  String get liquidez => _liquidez ?? '';
  bool hasLiquidez() => _liquidez != null;

  // "custo_aquisicao" field.
  double? _custoAquisicao;
  double get custoAquisicao => _custoAquisicao ?? 0.0;
  bool hasCustoAquisicao() => _custoAquisicao != null;

  // "valorizacao_depreciacao" field.
  double? _valorizacaoDepreciacao;
  double get valorizacaoDepreciacao => _valorizacaoDepreciacao ?? 0.0;
  bool hasValorizacaoDepreciacao() => _valorizacaoDepreciacao != null;

  // "impostos_taxas" field.
  String? _impostosTaxas;
  String get impostosTaxas => _impostosTaxas ?? '';
  bool hasImpostosTaxas() => _impostosTaxas != null;

  // "riscos_associados" field.
  String? _riscosAssociados;
  String get riscosAssociados => _riscosAssociados ?? '';
  bool hasRiscosAssociados() => _riscosAssociados != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tipoAtivo = snapshotData['tipo_ativo'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _dataAquisicao = snapshotData['data_aquisicao'] as DateTime?;
    _objetivo = snapshotData['objetivo'] as String?;
    _observacoes = snapshotData['observacoes'] as String?;
    _checkCusto = snapshotData['check_custo'] as bool?;
    _instituicaoCustodiante =
        snapshotData['instituicao_custodiante'] as String?;
    _valorMercado = castToType<double>(snapshotData['valor_mercado']);
    _rendimentoAnual = castToType<double>(snapshotData['rendimento_anual']);
    _liquidez = snapshotData['liquidez'] as String?;
    _custoAquisicao = castToType<double>(snapshotData['custo_aquisicao']);
    _valorizacaoDepreciacao =
        castToType<double>(snapshotData['valorizacao_depreciacao']);
    _impostosTaxas = snapshotData['impostos_taxas'] as String?;
    _riscosAssociados = snapshotData['riscos_associados'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cliente_ativo_financeiro')
          : FirebaseFirestore.instance
              .collectionGroup('cliente_ativo_financeiro');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('cliente_ativo_financeiro').doc();

  static Stream<ClienteAtivoFinanceiroRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ClienteAtivoFinanceiroRecord.fromSnapshot(s));

  static Future<ClienteAtivoFinanceiroRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ClienteAtivoFinanceiroRecord.fromSnapshot(s));

  static ClienteAtivoFinanceiroRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClienteAtivoFinanceiroRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClienteAtivoFinanceiroRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClienteAtivoFinanceiroRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClienteAtivoFinanceiroRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClienteAtivoFinanceiroRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClienteAtivoFinanceiroRecordData({
  String? tipoAtivo,
  String? descricao,
  DateTime? dataAquisicao,
  String? objetivo,
  String? observacoes,
  bool? checkCusto,
  String? instituicaoCustodiante,
  double? valorMercado,
  double? rendimentoAnual,
  String? liquidez,
  double? custoAquisicao,
  double? valorizacaoDepreciacao,
  String? impostosTaxas,
  String? riscosAssociados,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipo_ativo': tipoAtivo,
      'descricao': descricao,
      'data_aquisicao': dataAquisicao,
      'objetivo': objetivo,
      'observacoes': observacoes,
      'check_custo': checkCusto,
      'instituicao_custodiante': instituicaoCustodiante,
      'valor_mercado': valorMercado,
      'rendimento_anual': rendimentoAnual,
      'liquidez': liquidez,
      'custo_aquisicao': custoAquisicao,
      'valorizacao_depreciacao': valorizacaoDepreciacao,
      'impostos_taxas': impostosTaxas,
      'riscos_associados': riscosAssociados,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClienteAtivoFinanceiroRecordDocumentEquality
    implements Equality<ClienteAtivoFinanceiroRecord> {
  const ClienteAtivoFinanceiroRecordDocumentEquality();

  @override
  bool equals(
      ClienteAtivoFinanceiroRecord? e1, ClienteAtivoFinanceiroRecord? e2) {
    return e1?.tipoAtivo == e2?.tipoAtivo &&
        e1?.descricao == e2?.descricao &&
        e1?.dataAquisicao == e2?.dataAquisicao &&
        e1?.objetivo == e2?.objetivo &&
        e1?.observacoes == e2?.observacoes &&
        e1?.checkCusto == e2?.checkCusto &&
        e1?.instituicaoCustodiante == e2?.instituicaoCustodiante &&
        e1?.valorMercado == e2?.valorMercado &&
        e1?.rendimentoAnual == e2?.rendimentoAnual &&
        e1?.liquidez == e2?.liquidez &&
        e1?.custoAquisicao == e2?.custoAquisicao &&
        e1?.valorizacaoDepreciacao == e2?.valorizacaoDepreciacao &&
        e1?.impostosTaxas == e2?.impostosTaxas &&
        e1?.riscosAssociados == e2?.riscosAssociados;
  }

  @override
  int hash(ClienteAtivoFinanceiroRecord? e) => const ListEquality().hash([
        e?.tipoAtivo,
        e?.descricao,
        e?.dataAquisicao,
        e?.objetivo,
        e?.observacoes,
        e?.checkCusto,
        e?.instituicaoCustodiante,
        e?.valorMercado,
        e?.rendimentoAnual,
        e?.liquidez,
        e?.custoAquisicao,
        e?.valorizacaoDepreciacao,
        e?.impostosTaxas,
        e?.riscosAssociados
      ]);

  @override
  bool isValidKey(Object? o) => o is ClienteAtivoFinanceiroRecord;
}
