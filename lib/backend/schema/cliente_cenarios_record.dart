import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ClienteCenariosRecord extends FirestoreRecord {
  ClienteCenariosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "custo_vida_pos" field.
  double? _custoVidaPos;
  double get custoVidaPos => _custoVidaPos ?? 0.0;
  bool hasCustoVidaPos() => _custoVidaPos != null;

  // "user" field.
  List<DocumentReference>? _user;
  List<DocumentReference> get user => _user ?? const [];
  bool hasUser() => _user != null;

  // "consumo_patrimonio" field.
  String? _consumoPatrimonio;
  String get consumoPatrimonio => _consumoPatrimonio ?? '';
  bool hasConsumoPatrimonio() => _consumoPatrimonio != null;

  // "custo_vida_atual" field.
  double? _custoVidaAtual;
  double get custoVidaAtual => _custoVidaAtual ?? 0.0;
  bool hasCustoVidaAtual() => _custoVidaAtual != null;

  // "idade_aposentadoria" field.
  int? _idadeAposentadoria;
  int get idadeAposentadoria => _idadeAposentadoria ?? 0;
  bool hasIdadeAposentadoria() => _idadeAposentadoria != null;

  // "juro_real" field.
  double? _juroReal;
  double get juroReal => _juroReal ?? 0.0;
  bool hasJuroReal() => _juroReal != null;

  // "despesas_postumas" field.
  double? _despesasPostumas;
  double get despesasPostumas => _despesasPostumas ?? 0.0;
  bool hasDespesasPostumas() => _despesasPostumas != null;

  // "encargos_sucessorios" field.
  double? _encargosSucessorios;
  double get encargosSucessorios => _encargosSucessorios ?? 0.0;
  bool hasEncargosSucessorios() => _encargosSucessorios != null;

  // "reduca_padrao_vida" field.
  double? _reducaPadraoVida;
  double get reducaPadraoVida => _reducaPadraoVida ?? 0.0;
  bool hasReducaPadraoVida() => _reducaPadraoVida != null;

  // "meses_padrao_vida" field.
  int? _mesesPadraoVida;
  int get mesesPadraoVida => _mesesPadraoVida ?? 0;
  bool hasMesesPadraoVida() => _mesesPadraoVida != null;

  // "numero" field.
  int? _numero;
  int get numero => _numero ?? 0;
  bool hasNumero() => _numero != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _nome = snapshotData['nome'] as String?;
    _custoVidaPos = castToType<double>(snapshotData['custo_vida_pos']);
    _user = getDataList(snapshotData['user']);
    _consumoPatrimonio = snapshotData['consumo_patrimonio'] as String?;
    _custoVidaAtual = castToType<double>(snapshotData['custo_vida_atual']);
    _idadeAposentadoria = castToType<int>(snapshotData['idade_aposentadoria']);
    _juroReal = castToType<double>(snapshotData['juro_real']);
    _despesasPostumas = castToType<double>(snapshotData['despesas_postumas']);
    _encargosSucessorios =
        castToType<double>(snapshotData['encargos_sucessorios']);
    _reducaPadraoVida = castToType<double>(snapshotData['reduca_padrao_vida']);
    _mesesPadraoVida = castToType<int>(snapshotData['meses_padrao_vida']);
    _numero = castToType<int>(snapshotData['numero']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cliente_cenarios')
          : FirebaseFirestore.instance.collectionGroup('cliente_cenarios');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('cliente_cenarios').doc();

  static Stream<ClienteCenariosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClienteCenariosRecord.fromSnapshot(s));

  static Future<ClienteCenariosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClienteCenariosRecord.fromSnapshot(s));

  static ClienteCenariosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClienteCenariosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClienteCenariosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClienteCenariosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClienteCenariosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClienteCenariosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClienteCenariosRecordData({
  String? id,
  String? nome,
  double? custoVidaPos,
  String? consumoPatrimonio,
  double? custoVidaAtual,
  int? idadeAposentadoria,
  double? juroReal,
  double? despesasPostumas,
  double? encargosSucessorios,
  double? reducaPadraoVida,
  int? mesesPadraoVida,
  int? numero,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'nome': nome,
      'custo_vida_pos': custoVidaPos,
      'consumo_patrimonio': consumoPatrimonio,
      'custo_vida_atual': custoVidaAtual,
      'idade_aposentadoria': idadeAposentadoria,
      'juro_real': juroReal,
      'despesas_postumas': despesasPostumas,
      'encargos_sucessorios': encargosSucessorios,
      'reduca_padrao_vida': reducaPadraoVida,
      'meses_padrao_vida': mesesPadraoVida,
      'numero': numero,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClienteCenariosRecordDocumentEquality
    implements Equality<ClienteCenariosRecord> {
  const ClienteCenariosRecordDocumentEquality();

  @override
  bool equals(ClienteCenariosRecord? e1, ClienteCenariosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.nome == e2?.nome &&
        e1?.custoVidaPos == e2?.custoVidaPos &&
        listEquality.equals(e1?.user, e2?.user) &&
        e1?.consumoPatrimonio == e2?.consumoPatrimonio &&
        e1?.custoVidaAtual == e2?.custoVidaAtual &&
        e1?.idadeAposentadoria == e2?.idadeAposentadoria &&
        e1?.juroReal == e2?.juroReal &&
        e1?.despesasPostumas == e2?.despesasPostumas &&
        e1?.encargosSucessorios == e2?.encargosSucessorios &&
        e1?.reducaPadraoVida == e2?.reducaPadraoVida &&
        e1?.mesesPadraoVida == e2?.mesesPadraoVida &&
        e1?.numero == e2?.numero;
  }

  @override
  int hash(ClienteCenariosRecord? e) => const ListEquality().hash([
        e?.id,
        e?.nome,
        e?.custoVidaPos,
        e?.user,
        e?.consumoPatrimonio,
        e?.custoVidaAtual,
        e?.idadeAposentadoria,
        e?.juroReal,
        e?.despesasPostumas,
        e?.encargosSucessorios,
        e?.reducaPadraoVida,
        e?.mesesPadraoVida,
        e?.numero
      ]);

  @override
  bool isValidKey(Object? o) => o is ClienteCenariosRecord;
}
