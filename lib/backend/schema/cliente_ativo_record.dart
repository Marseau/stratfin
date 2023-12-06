import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ClienteAtivoRecord extends FirestoreRecord {
  ClienteAtivoRecord._(
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

  // "numero_iptu" field.
  String? _numeroIptu;
  String get numeroIptu => _numeroIptu ?? '';
  bool hasNumeroIptu() => _numeroIptu != null;

  // "cartorio" field.
  String? _cartorio;
  String get cartorio => _cartorio ?? '';
  bool hasCartorio() => _cartorio != null;

  // "data_liquidacao" field.
  DateTime? _dataLiquidacao;
  DateTime? get dataLiquidacao => _dataLiquidacao;
  bool hasDataLiquidacao() => _dataLiquidacao != null;

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

  // "previdencia_privada_incricao" field.
  String? _previdenciaPrivadaIncricao;
  String get previdenciaPrivadaIncricao => _previdenciaPrivadaIncricao ?? '';
  bool hasPrevidenciaPrivadaIncricao() => _previdenciaPrivadaIncricao != null;

  // "previdencia_privada_instituicao" field.
  String? _previdenciaPrivadaInstituicao;
  String get previdenciaPrivadaInstituicao =>
      _previdenciaPrivadaInstituicao ?? '';
  bool hasPrevidenciaPrivadaInstituicao() =>
      _previdenciaPrivadaInstituicao != null;

  // "incorporado" field.
  bool? _incorporado;
  bool get incorporado => _incorporado ?? false;
  bool hasIncorporado() => _incorporado != null;

  // "disponibilidade_aplicacao" field.
  double? _disponibilidadeAplicacao;
  double get disponibilidadeAplicacao => _disponibilidadeAplicacao ?? 0.0;
  bool hasDisponibilidadeAplicacao() => _disponibilidadeAplicacao != null;

  // "disponibilidade_data" field.
  DateTime? _disponibilidadeData;
  DateTime? get disponibilidadeData => _disponibilidadeData;
  bool hasDisponibilidadeData() => _disponibilidadeData != null;

  // "check_custo" field.
  bool? _checkCusto;
  bool get checkCusto => _checkCusto ?? false;
  bool hasCheckCusto() => _checkCusto != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tipoAtivo = snapshotData['tipo_ativo'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _dataAquisicao = snapshotData['data_aquisicao'] as DateTime?;
    _valorAtualEstimado =
        castToType<double>(snapshotData['valor_atual_estimado']);
    _objetivo = snapshotData['objetivo'] as String?;
    _localImovel = snapshotData['local_imovel'] as String?;
    _numeroIptu = snapshotData['numero_iptu'] as String?;
    _cartorio = snapshotData['cartorio'] as String?;
    _dataLiquidacao = snapshotData['data_liquidacao'] as DateTime?;
    _observacoes = snapshotData['observacoes'] as String?;
    _geraRenda = snapshotData['gera_renda'] as bool?;
    _dataInicio = snapshotData['data_inicio'] as DateTime?;
    _dataFim = snapshotData['data_fim'] as DateTime?;
    _rendaMensal = castToType<double>(snapshotData['renda_mensal']);
    _paticipacaoSocietaria =
        castToType<double>(snapshotData['paticipacao_societaria']);
    _previdenciaPrivadaIncricao =
        snapshotData['previdencia_privada_incricao'] as String?;
    _previdenciaPrivadaInstituicao =
        snapshotData['previdencia_privada_instituicao'] as String?;
    _incorporado = snapshotData['incorporado'] as bool?;
    _disponibilidadeAplicacao =
        castToType<double>(snapshotData['disponibilidade_aplicacao']);
    _disponibilidadeData = snapshotData['disponibilidade_data'] as DateTime?;
    _checkCusto = snapshotData['check_custo'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cliente_ativo')
          : FirebaseFirestore.instance.collectionGroup('cliente_ativo');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('cliente_ativo').doc();

  static Stream<ClienteAtivoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClienteAtivoRecord.fromSnapshot(s));

  static Future<ClienteAtivoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClienteAtivoRecord.fromSnapshot(s));

  static ClienteAtivoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClienteAtivoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClienteAtivoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClienteAtivoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClienteAtivoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClienteAtivoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClienteAtivoRecordData({
  String? tipoAtivo,
  String? descricao,
  DateTime? dataAquisicao,
  double? valorAtualEstimado,
  String? objetivo,
  String? localImovel,
  String? numeroIptu,
  String? cartorio,
  DateTime? dataLiquidacao,
  String? observacoes,
  bool? geraRenda,
  DateTime? dataInicio,
  DateTime? dataFim,
  double? rendaMensal,
  double? paticipacaoSocietaria,
  String? previdenciaPrivadaIncricao,
  String? previdenciaPrivadaInstituicao,
  bool? incorporado,
  double? disponibilidadeAplicacao,
  DateTime? disponibilidadeData,
  bool? checkCusto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipo_ativo': tipoAtivo,
      'descricao': descricao,
      'data_aquisicao': dataAquisicao,
      'valor_atual_estimado': valorAtualEstimado,
      'objetivo': objetivo,
      'local_imovel': localImovel,
      'numero_iptu': numeroIptu,
      'cartorio': cartorio,
      'data_liquidacao': dataLiquidacao,
      'observacoes': observacoes,
      'gera_renda': geraRenda,
      'data_inicio': dataInicio,
      'data_fim': dataFim,
      'renda_mensal': rendaMensal,
      'paticipacao_societaria': paticipacaoSocietaria,
      'previdencia_privada_incricao': previdenciaPrivadaIncricao,
      'previdencia_privada_instituicao': previdenciaPrivadaInstituicao,
      'incorporado': incorporado,
      'disponibilidade_aplicacao': disponibilidadeAplicacao,
      'disponibilidade_data': disponibilidadeData,
      'check_custo': checkCusto,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClienteAtivoRecordDocumentEquality
    implements Equality<ClienteAtivoRecord> {
  const ClienteAtivoRecordDocumentEquality();

  @override
  bool equals(ClienteAtivoRecord? e1, ClienteAtivoRecord? e2) {
    return e1?.tipoAtivo == e2?.tipoAtivo &&
        e1?.descricao == e2?.descricao &&
        e1?.dataAquisicao == e2?.dataAquisicao &&
        e1?.valorAtualEstimado == e2?.valorAtualEstimado &&
        e1?.objetivo == e2?.objetivo &&
        e1?.localImovel == e2?.localImovel &&
        e1?.numeroIptu == e2?.numeroIptu &&
        e1?.cartorio == e2?.cartorio &&
        e1?.dataLiquidacao == e2?.dataLiquidacao &&
        e1?.observacoes == e2?.observacoes &&
        e1?.geraRenda == e2?.geraRenda &&
        e1?.dataInicio == e2?.dataInicio &&
        e1?.dataFim == e2?.dataFim &&
        e1?.rendaMensal == e2?.rendaMensal &&
        e1?.paticipacaoSocietaria == e2?.paticipacaoSocietaria &&
        e1?.previdenciaPrivadaIncricao == e2?.previdenciaPrivadaIncricao &&
        e1?.previdenciaPrivadaInstituicao ==
            e2?.previdenciaPrivadaInstituicao &&
        e1?.incorporado == e2?.incorporado &&
        e1?.disponibilidadeAplicacao == e2?.disponibilidadeAplicacao &&
        e1?.disponibilidadeData == e2?.disponibilidadeData &&
        e1?.checkCusto == e2?.checkCusto;
  }

  @override
  int hash(ClienteAtivoRecord? e) => const ListEquality().hash([
        e?.tipoAtivo,
        e?.descricao,
        e?.dataAquisicao,
        e?.valorAtualEstimado,
        e?.objetivo,
        e?.localImovel,
        e?.numeroIptu,
        e?.cartorio,
        e?.dataLiquidacao,
        e?.observacoes,
        e?.geraRenda,
        e?.dataInicio,
        e?.dataFim,
        e?.rendaMensal,
        e?.paticipacaoSocietaria,
        e?.previdenciaPrivadaIncricao,
        e?.previdenciaPrivadaInstituicao,
        e?.incorporado,
        e?.disponibilidadeAplicacao,
        e?.disponibilidadeData,
        e?.checkCusto
      ]);

  @override
  bool isValidKey(Object? o) => o is ClienteAtivoRecord;
}
