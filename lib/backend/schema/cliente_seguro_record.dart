import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ClienteSeguroRecord extends FirestoreRecord {
  ClienteSeguroRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tipo_seguro" field.
  String? _tipoSeguro;
  String get tipoSeguro => _tipoSeguro ?? '';
  bool hasTipoSeguro() => _tipoSeguro != null;

  // "nome_seguradora" field.
  String? _nomeSeguradora;
  String get nomeSeguradora => _nomeSeguradora ?? '';
  bool hasNomeSeguradora() => _nomeSeguradora != null;

  // "plano" field.
  String? _plano;
  String get plano => _plano ?? '';
  bool hasPlano() => _plano != null;

  // "prazo_aa" field.
  int? _prazoAa;
  int get prazoAa => _prazoAa ?? 0;
  bool hasPrazoAa() => _prazoAa != null;

  // "valor_premio_mensal" field.
  double? _valorPremioMensal;
  double get valorPremioMensal => _valorPremioMensal ?? 0.0;
  bool hasValorPremioMensal() => _valorPremioMensal != null;

  // "valor_resgate" field.
  double? _valorResgate;
  double get valorResgate => _valorResgate ?? 0.0;
  bool hasValorResgate() => _valorResgate != null;

  // "valor_cobertura" field.
  double? _valorCobertura;
  double get valorCobertura => _valorCobertura ?? 0.0;
  bool hasValorCobertura() => _valorCobertura != null;

  // "data_resgate" field.
  DateTime? _dataResgate;
  DateTime? get dataResgate => _dataResgate;
  bool hasDataResgate() => _dataResgate != null;

  // "check_custo" field.
  bool? _checkCusto;
  bool get checkCusto => _checkCusto ?? false;
  bool hasCheckCusto() => _checkCusto != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tipoSeguro = snapshotData['tipo_seguro'] as String?;
    _nomeSeguradora = snapshotData['nome_seguradora'] as String?;
    _plano = snapshotData['plano'] as String?;
    _prazoAa = castToType<int>(snapshotData['prazo_aa']);
    _valorPremioMensal =
        castToType<double>(snapshotData['valor_premio_mensal']);
    _valorResgate = castToType<double>(snapshotData['valor_resgate']);
    _valorCobertura = castToType<double>(snapshotData['valor_cobertura']);
    _dataResgate = snapshotData['data_resgate'] as DateTime?;
    _checkCusto = snapshotData['check_custo'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cliente_seguro')
          : FirebaseFirestore.instance.collectionGroup('cliente_seguro');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('cliente_seguro').doc();

  static Stream<ClienteSeguroRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClienteSeguroRecord.fromSnapshot(s));

  static Future<ClienteSeguroRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClienteSeguroRecord.fromSnapshot(s));

  static ClienteSeguroRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClienteSeguroRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClienteSeguroRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClienteSeguroRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClienteSeguroRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClienteSeguroRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClienteSeguroRecordData({
  String? tipoSeguro,
  String? nomeSeguradora,
  String? plano,
  int? prazoAa,
  double? valorPremioMensal,
  double? valorResgate,
  double? valorCobertura,
  DateTime? dataResgate,
  bool? checkCusto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipo_seguro': tipoSeguro,
      'nome_seguradora': nomeSeguradora,
      'plano': plano,
      'prazo_aa': prazoAa,
      'valor_premio_mensal': valorPremioMensal,
      'valor_resgate': valorResgate,
      'valor_cobertura': valorCobertura,
      'data_resgate': dataResgate,
      'check_custo': checkCusto,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClienteSeguroRecordDocumentEquality
    implements Equality<ClienteSeguroRecord> {
  const ClienteSeguroRecordDocumentEquality();

  @override
  bool equals(ClienteSeguroRecord? e1, ClienteSeguroRecord? e2) {
    return e1?.tipoSeguro == e2?.tipoSeguro &&
        e1?.nomeSeguradora == e2?.nomeSeguradora &&
        e1?.plano == e2?.plano &&
        e1?.prazoAa == e2?.prazoAa &&
        e1?.valorPremioMensal == e2?.valorPremioMensal &&
        e1?.valorResgate == e2?.valorResgate &&
        e1?.valorCobertura == e2?.valorCobertura &&
        e1?.dataResgate == e2?.dataResgate &&
        e1?.checkCusto == e2?.checkCusto;
  }

  @override
  int hash(ClienteSeguroRecord? e) => const ListEquality().hash([
        e?.tipoSeguro,
        e?.nomeSeguradora,
        e?.plano,
        e?.prazoAa,
        e?.valorPremioMensal,
        e?.valorResgate,
        e?.valorCobertura,
        e?.dataResgate,
        e?.checkCusto
      ]);

  @override
  bool isValidKey(Object? o) => o is ClienteSeguroRecord;
}
