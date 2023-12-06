import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ClienteProjetofuturoRecord extends FirestoreRecord {
  ClienteProjetofuturoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  // "check_custo" field.
  double? _checkCusto;
  double get checkCusto => _checkCusto ?? 0.0;
  bool hasCheckCusto() => _checkCusto != null;

  // "peridicidade" field.
  PeriodoStruct? _peridicidade;
  PeriodoStruct get peridicidade => _peridicidade ?? PeriodoStruct();
  bool hasPeridicidade() => _peridicidade != null;

  // "data_acontecimento_ano" field.
  int? _dataAcontecimentoAno;
  int get dataAcontecimentoAno => _dataAcontecimentoAno ?? 0;
  bool hasDataAcontecimentoAno() => _dataAcontecimentoAno != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _descricao = snapshotData['descricao'] as String?;
    _valor = castToType<double>(snapshotData['valor']);
    _checkCusto = castToType<double>(snapshotData['check_custo']);
    _peridicidade = PeriodoStruct.maybeFromMap(snapshotData['peridicidade']);
    _dataAcontecimentoAno =
        castToType<int>(snapshotData['data_acontecimento_ano']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cliente_projetofuturo')
          : FirebaseFirestore.instance.collectionGroup('cliente_projetofuturo');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('cliente_projetofuturo').doc();

  static Stream<ClienteProjetofuturoRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ClienteProjetofuturoRecord.fromSnapshot(s));

  static Future<ClienteProjetofuturoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ClienteProjetofuturoRecord.fromSnapshot(s));

  static ClienteProjetofuturoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClienteProjetofuturoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClienteProjetofuturoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClienteProjetofuturoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClienteProjetofuturoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClienteProjetofuturoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClienteProjetofuturoRecordData({
  String? descricao,
  double? valor,
  double? checkCusto,
  PeriodoStruct? peridicidade,
  int? dataAcontecimentoAno,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'descricao': descricao,
      'valor': valor,
      'check_custo': checkCusto,
      'peridicidade': PeriodoStruct().toMap(),
      'data_acontecimento_ano': dataAcontecimentoAno,
    }.withoutNulls,
  );

  // Handle nested data for "peridicidade" field.
  addPeriodoStructData(firestoreData, peridicidade, 'peridicidade');

  return firestoreData;
}

class ClienteProjetofuturoRecordDocumentEquality
    implements Equality<ClienteProjetofuturoRecord> {
  const ClienteProjetofuturoRecordDocumentEquality();

  @override
  bool equals(ClienteProjetofuturoRecord? e1, ClienteProjetofuturoRecord? e2) {
    return e1?.descricao == e2?.descricao &&
        e1?.valor == e2?.valor &&
        e1?.checkCusto == e2?.checkCusto &&
        e1?.peridicidade == e2?.peridicidade &&
        e1?.dataAcontecimentoAno == e2?.dataAcontecimentoAno;
  }

  @override
  int hash(ClienteProjetofuturoRecord? e) => const ListEquality().hash([
        e?.descricao,
        e?.valor,
        e?.checkCusto,
        e?.peridicidade,
        e?.dataAcontecimentoAno
      ]);

  @override
  bool isValidKey(Object? o) => o is ClienteProjetofuturoRecord;
}
