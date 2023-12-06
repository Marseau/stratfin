import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ClientePassivoRecord extends FirestoreRecord {
  ClientePassivoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "passivo_tipo" field.
  String? _passivoTipo;
  String get passivoTipo => _passivoTipo ?? '';
  bool hasPassivoTipo() => _passivoTipo != null;

  // "forma_pagamento" field.
  String? _formaPagamento;
  String get formaPagamento => _formaPagamento ?? '';
  bool hasFormaPagamento() => _formaPagamento != null;

  // "data_inicio" field.
  DateTime? _dataInicio;
  DateTime? get dataInicio => _dataInicio;
  bool hasDataInicio() => _dataInicio != null;

  // "data_fim" field.
  DateTime? _dataFim;
  DateTime? get dataFim => _dataFim;
  bool hasDataFim() => _dataFim != null;

  // "data_inicio_prevista" field.
  DateTime? _dataInicioPrevista;
  DateTime? get dataInicioPrevista => _dataInicioPrevista;
  bool hasDataInicioPrevista() => _dataInicioPrevista != null;

  // "check_custo" field.
  bool? _checkCusto;
  bool get checkCusto => _checkCusto ?? false;
  bool hasCheckCusto() => _checkCusto != null;

  // "credor_instituicao" field.
  String? _credorInstituicao;
  String get credorInstituicao => _credorInstituicao ?? '';
  bool hasCredorInstituicao() => _credorInstituicao != null;

  // "saldo_devedor" field.
  double? _saldoDevedor;
  double get saldoDevedor => _saldoDevedor ?? 0.0;
  bool hasSaldoDevedor() => _saldoDevedor != null;

  // "pagamento_mensal" field.
  double? _pagamentoMensal;
  double get pagamentoMensal => _pagamentoMensal ?? 0.0;
  bool hasPagamentoMensal() => _pagamentoMensal != null;

  // "garantias" field.
  String? _garantias;
  String get garantias => _garantias ?? '';
  bool hasGarantias() => _garantias != null;

  // "taxa_juros" field.
  double? _taxaJuros;
  double get taxaJuros => _taxaJuros ?? 0.0;
  bool hasTaxaJuros() => _taxaJuros != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _passivoTipo = snapshotData['passivo_tipo'] as String?;
    _formaPagamento = snapshotData['forma_pagamento'] as String?;
    _dataInicio = snapshotData['data_inicio'] as DateTime?;
    _dataFim = snapshotData['data_fim'] as DateTime?;
    _dataInicioPrevista = snapshotData['data_inicio_prevista'] as DateTime?;
    _checkCusto = snapshotData['check_custo'] as bool?;
    _credorInstituicao = snapshotData['credor_instituicao'] as String?;
    _saldoDevedor = castToType<double>(snapshotData['saldo_devedor']);
    _pagamentoMensal = castToType<double>(snapshotData['pagamento_mensal']);
    _garantias = snapshotData['garantias'] as String?;
    _taxaJuros = castToType<double>(snapshotData['taxa_juros']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cliente_passivo')
          : FirebaseFirestore.instance.collectionGroup('cliente_passivo');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('cliente_passivo').doc();

  static Stream<ClientePassivoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientePassivoRecord.fromSnapshot(s));

  static Future<ClientePassivoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientePassivoRecord.fromSnapshot(s));

  static ClientePassivoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClientePassivoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientePassivoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientePassivoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientePassivoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientePassivoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientePassivoRecordData({
  String? passivoTipo,
  String? formaPagamento,
  DateTime? dataInicio,
  DateTime? dataFim,
  DateTime? dataInicioPrevista,
  bool? checkCusto,
  String? credorInstituicao,
  double? saldoDevedor,
  double? pagamentoMensal,
  String? garantias,
  double? taxaJuros,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'passivo_tipo': passivoTipo,
      'forma_pagamento': formaPagamento,
      'data_inicio': dataInicio,
      'data_fim': dataFim,
      'data_inicio_prevista': dataInicioPrevista,
      'check_custo': checkCusto,
      'credor_instituicao': credorInstituicao,
      'saldo_devedor': saldoDevedor,
      'pagamento_mensal': pagamentoMensal,
      'garantias': garantias,
      'taxa_juros': taxaJuros,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientePassivoRecordDocumentEquality
    implements Equality<ClientePassivoRecord> {
  const ClientePassivoRecordDocumentEquality();

  @override
  bool equals(ClientePassivoRecord? e1, ClientePassivoRecord? e2) {
    return e1?.passivoTipo == e2?.passivoTipo &&
        e1?.formaPagamento == e2?.formaPagamento &&
        e1?.dataInicio == e2?.dataInicio &&
        e1?.dataFim == e2?.dataFim &&
        e1?.dataInicioPrevista == e2?.dataInicioPrevista &&
        e1?.checkCusto == e2?.checkCusto &&
        e1?.credorInstituicao == e2?.credorInstituicao &&
        e1?.saldoDevedor == e2?.saldoDevedor &&
        e1?.pagamentoMensal == e2?.pagamentoMensal &&
        e1?.garantias == e2?.garantias &&
        e1?.taxaJuros == e2?.taxaJuros;
  }

  @override
  int hash(ClientePassivoRecord? e) => const ListEquality().hash([
        e?.passivoTipo,
        e?.formaPagamento,
        e?.dataInicio,
        e?.dataFim,
        e?.dataInicioPrevista,
        e?.checkCusto,
        e?.credorInstituicao,
        e?.saldoDevedor,
        e?.pagamentoMensal,
        e?.garantias,
        e?.taxaJuros
      ]);

  @override
  bool isValidKey(Object? o) => o is ClientePassivoRecord;
}
