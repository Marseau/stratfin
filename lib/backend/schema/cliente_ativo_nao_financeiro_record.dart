import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ClienteAtivoNaoFinanceiroRecord extends FirestoreRecord {
  ClienteAtivoNaoFinanceiroRecord._(
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

  // "valor_atual_estimado" field.
  double? _valorAtualEstimado;
  double get valorAtualEstimado => _valorAtualEstimado ?? 0.0;
  bool hasValorAtualEstimado() => _valorAtualEstimado != null;

  // "objetivo" field.
  String? _objetivo;
  String get objetivo => _objetivo ?? '';
  bool hasObjetivo() => _objetivo != null;

  // "local_imovel" field.
  String? _localImovel;
  String get localImovel => _localImovel ?? '';
  bool hasLocalImovel() => _localImovel != null;

  // "observacoes" field.
  String? _observacoes;
  String get observacoes => _observacoes ?? '';
  bool hasObservacoes() => _observacoes != null;

  // "gera_renda" field.
  bool? _geraRenda;
  bool get geraRenda => _geraRenda ?? false;
  bool hasGeraRenda() => _geraRenda != null;

  // "data_inicio" field.
  DateTime? _dataInicio;
  DateTime? get dataInicio => _dataInicio;
  bool hasDataInicio() => _dataInicio != null;

  // "data_fim" field.
  DateTime? _dataFim;
  DateTime? get dataFim => _dataFim;
  bool hasDataFim() => _dataFim != null;

  // "renda_mensal" field.
  double? _rendaMensal;
  double get rendaMensal => _rendaMensal ?? 0.0;
  bool hasRendaMensal() => _rendaMensal != null;

  // "paticipacao_societaria" field.
  double? _paticipacaoSocietaria;
  double get paticipacaoSocietaria => _paticipacaoSocietaria ?? 0.0;
  bool hasPaticipacaoSocietaria() => _paticipacaoSocietaria != null;

  // "incorporado" field.
  bool? _incorporado;
  bool get incorporado => _incorporado ?? false;
  bool hasIncorporado() => _incorporado != null;

  // "check_custo" field.
  bool? _checkCusto;
  bool get checkCusto => _checkCusto ?? false;
  bool hasCheckCusto() => _checkCusto != null;

  // "custo_aquisicao" field.
  double? _custoAquisicao;
  double get custoAquisicao => _custoAquisicao ?? 0.0;
  bool hasCustoAquisicao() => _custoAquisicao != null;

  // "uso_finalidade" field.
  String? _usoFinalidade;
  String get usoFinalidade => _usoFinalidade ?? '';
  bool hasUsoFinalidade() => _usoFinalidade != null;

  // "impostos_taxas" field.
  double? _impostosTaxas;
  double get impostosTaxas => _impostosTaxas ?? 0.0;
  bool hasImpostosTaxas() => _impostosTaxas != null;

  // "valorizacao_depreciacao" field.
  double? _valorizacaoDepreciacao;
  double get valorizacaoDepreciacao => _valorizacaoDepreciacao ?? 0.0;
  bool hasValorizacaoDepreciacao() => _valorizacaoDepreciacao != null;

  // "liquidez" field.
  String? _liquidez;
  String get liquidez => _liquidez ?? '';
  bool hasLiquidez() => _liquidez != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tipoAtivo = snapshotData['tipo_ativo'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _dataAquisicao = snapshotData['data_aquisicao'] as DateTime?;
    _valorAtualEstimado =
        castToType<double>(snapshotData['valor_atual_estimado']);
    _objetivo = snapshotData['objetivo'] as String?;
    _localImovel = snapshotData['local_imovel'] as String?;
    _observacoes = snapshotData['observacoes'] as String?;
    _geraRenda = snapshotData['gera_renda'] as bool?;
    _dataInicio = snapshotData['data_inicio'] as DateTime?;
    _dataFim = snapshotData['data_fim'] as DateTime?;
    _rendaMensal = castToType<double>(snapshotData['renda_mensal']);
    _paticipacaoSocietaria =
        castToType<double>(snapshotData['paticipacao_societaria']);
    _incorporado = snapshotData['incorporado'] as bool?;
    _checkCusto = snapshotData['check_custo'] as bool?;
    _custoAquisicao = castToType<double>(snapshotData['custo_aquisicao']);
    _usoFinalidade = snapshotData['uso_finalidade'] as String?;
    _impostosTaxas = castToType<double>(snapshotData['impostos_taxas']);
    _valorizacaoDepreciacao =
        castToType<double>(snapshotData['valorizacao_depreciacao']);
    _liquidez = snapshotData['liquidez'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cliente_ativo_nao_financeiro')
          : FirebaseFirestore.instance
              .collectionGroup('cliente_ativo_nao_financeiro');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('cliente_ativo_nao_financeiro').doc();

  static Stream<ClienteAtivoNaoFinanceiroRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => ClienteAtivoNaoFinanceiroRecord.fromSnapshot(s));

  static Future<ClienteAtivoNaoFinanceiroRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ClienteAtivoNaoFinanceiroRecord.fromSnapshot(s));

  static ClienteAtivoNaoFinanceiroRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ClienteAtivoNaoFinanceiroRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClienteAtivoNaoFinanceiroRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClienteAtivoNaoFinanceiroRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClienteAtivoNaoFinanceiroRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClienteAtivoNaoFinanceiroRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClienteAtivoNaoFinanceiroRecordData({
  String? tipoAtivo,
  String? descricao,
  DateTime? dataAquisicao,
  double? valorAtualEstimado,
  String? objetivo,
  String? localImovel,
  String? observacoes,
  bool? geraRenda,
  DateTime? dataInicio,
  DateTime? dataFim,
  double? rendaMensal,
  double? paticipacaoSocietaria,
  bool? incorporado,
  bool? checkCusto,
  double? custoAquisicao,
  String? usoFinalidade,
  double? impostosTaxas,
  double? valorizacaoDepreciacao,
  String? liquidez,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipo_ativo': tipoAtivo,
      'descricao': descricao,
      'data_aquisicao': dataAquisicao,
      'valor_atual_estimado': valorAtualEstimado,
      'objetivo': objetivo,
      'local_imovel': localImovel,
      'observacoes': observacoes,
      'gera_renda': geraRenda,
      'data_inicio': dataInicio,
      'data_fim': dataFim,
      'renda_mensal': rendaMensal,
      'paticipacao_societaria': paticipacaoSocietaria,
      'incorporado': incorporado,
      'check_custo': checkCusto,
      'custo_aquisicao': custoAquisicao,
      'uso_finalidade': usoFinalidade,
      'impostos_taxas': impostosTaxas,
      'valorizacao_depreciacao': valorizacaoDepreciacao,
      'liquidez': liquidez,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClienteAtivoNaoFinanceiroRecordDocumentEquality
    implements Equality<ClienteAtivoNaoFinanceiroRecord> {
  const ClienteAtivoNaoFinanceiroRecordDocumentEquality();

  @override
  bool equals(ClienteAtivoNaoFinanceiroRecord? e1,
      ClienteAtivoNaoFinanceiroRecord? e2) {
    return e1?.tipoAtivo == e2?.tipoAtivo &&
        e1?.descricao == e2?.descricao &&
        e1?.dataAquisicao == e2?.dataAquisicao &&
        e1?.valorAtualEstimado == e2?.valorAtualEstimado &&
        e1?.objetivo == e2?.objetivo &&
        e1?.localImovel == e2?.localImovel &&
        e1?.observacoes == e2?.observacoes &&
        e1?.geraRenda == e2?.geraRenda &&
        e1?.dataInicio == e2?.dataInicio &&
        e1?.dataFim == e2?.dataFim &&
        e1?.rendaMensal == e2?.rendaMensal &&
        e1?.paticipacaoSocietaria == e2?.paticipacaoSocietaria &&
        e1?.incorporado == e2?.incorporado &&
        e1?.checkCusto == e2?.checkCusto &&
        e1?.custoAquisicao == e2?.custoAquisicao &&
        e1?.usoFinalidade == e2?.usoFinalidade &&
        e1?.impostosTaxas == e2?.impostosTaxas &&
        e1?.valorizacaoDepreciacao == e2?.valorizacaoDepreciacao &&
        e1?.liquidez == e2?.liquidez;
  }

  @override
  int hash(ClienteAtivoNaoFinanceiroRecord? e) => const ListEquality().hash([
        e?.tipoAtivo,
        e?.descricao,
        e?.dataAquisicao,
        e?.valorAtualEstimado,
        e?.objetivo,
        e?.localImovel,
        e?.observacoes,
        e?.geraRenda,
        e?.dataInicio,
        e?.dataFim,
        e?.rendaMensal,
        e?.paticipacaoSocietaria,
        e?.incorporado,
        e?.checkCusto,
        e?.custoAquisicao,
        e?.usoFinalidade,
        e?.impostosTaxas,
        e?.valorizacaoDepreciacao,
        e?.liquidez
      ]);

  @override
  bool isValidKey(Object? o) => o is ClienteAtivoNaoFinanceiroRecord;
}
