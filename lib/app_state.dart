import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _ColorPreferencePrimary = _colorFromIntValue(
              await secureStorage.getInt('ff_ColorPreferencePrimary')) ??
          _ColorPreferencePrimary;
    });
    await _safeInitAsync(() async {
      _ColorPrefereceSecondary = _colorFromIntValue(
              await secureStorage.getInt('ff_ColorPrefereceSecondary')) ??
          _ColorPrefereceSecondary;
    });
    await _safeInitAsync(() async {
      _ColorAccent1 =
          _colorFromIntValue(await secureStorage.getInt('ff_ColorAccent1')) ??
              _ColorAccent1;
    });
    await _safeInitAsync(() async {
      _QuemNavega =
          await secureStorage.getString('ff_QuemNavega') ?? _QuemNavega;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_UserOptions') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_UserOptions') ?? '{}';
          _UserOptions = OpcoesVariaveisStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _docRefUsers = (await secureStorage.getString('ff_docRefUsers'))?.ref ??
          _docRefUsers;
    });
    await _safeInitAsync(() async {
      _docRefProduto =
          (await secureStorage.getString('ff_docRefProduto'))?.ref ??
              _docRefProduto;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  dynamic _apiVIACEPend;
  dynamic get apiVIACEPend => _apiVIACEPend;
  set apiVIACEPend(dynamic value) {
    _apiVIACEPend = value;
  }

  List<dynamic> _apiVIACEPcep = [];
  List<dynamic> get apiVIACEPcep => _apiVIACEPcep;
  set apiVIACEPcep(List<dynamic> value) {
    _apiVIACEPcep = value;
  }

  void addToApiVIACEPcep(dynamic value) {
    _apiVIACEPcep.add(value);
  }

  void removeFromApiVIACEPcep(dynamic value) {
    _apiVIACEPcep.remove(value);
  }

  void removeAtIndexFromApiVIACEPcep(int index) {
    _apiVIACEPcep.removeAt(index);
  }

  void updateApiVIACEPcepAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _apiVIACEPcep[index] = updateFn(_apiVIACEPcep[index]);
  }

  void insertAtIndexInApiVIACEPcep(int index, dynamic value) {
    _apiVIACEPcep.insert(index, value);
  }

  Color _ColorPreferencePrimary = const Color(0xff000080);
  Color get ColorPreferencePrimary => _ColorPreferencePrimary;
  set ColorPreferencePrimary(Color value) {
    _ColorPreferencePrimary = value;
    secureStorage.setInt('ff_ColorPreferencePrimary', value.value);
  }

  void deleteColorPreferencePrimary() {
    secureStorage.delete(key: 'ff_ColorPreferencePrimary');
  }

  Color _ColorPrefereceSecondary = const Color(0xff5f9845);
  Color get ColorPrefereceSecondary => _ColorPrefereceSecondary;
  set ColorPrefereceSecondary(Color value) {
    _ColorPrefereceSecondary = value;
    secureStorage.setInt('ff_ColorPrefereceSecondary', value.value);
  }

  void deleteColorPrefereceSecondary() {
    secureStorage.delete(key: 'ff_ColorPrefereceSecondary');
  }

  Color _ColorAccent1 = const Color(0xff323b45);
  Color get ColorAccent1 => _ColorAccent1;
  set ColorAccent1(Color value) {
    _ColorAccent1 = value;
    secureStorage.setInt('ff_ColorAccent1', value.value);
  }

  void deleteColorAccent1() {
    secureStorage.delete(key: 'ff_ColorAccent1');
  }

  bool _resultadoEmailCpf = false;
  bool get resultadoEmailCpf => _resultadoEmailCpf;
  set resultadoEmailCpf(bool value) {
    _resultadoEmailCpf = value;
  }

  bool _resultadoEmailCnpj = false;
  bool get resultadoEmailCnpj => _resultadoEmailCnpj;
  set resultadoEmailCnpj(bool value) {
    _resultadoEmailCnpj = value;
  }

  bool _verificacaoDadoExistente = false;
  bool get verificacaoDadoExistente => _verificacaoDadoExistente;
  set verificacaoDadoExistente(bool value) {
    _verificacaoDadoExistente = value;
  }

  bool _visualizar = true;
  bool get visualizar => _visualizar;
  set visualizar(bool value) {
    _visualizar = value;
  }

  bool _InputPreenchido = false;
  bool get InputPreenchido => _InputPreenchido;
  set InputPreenchido(bool value) {
    _InputPreenchido = value;
  }

  Color _ColorPrimaryText = const Color(0xff76808b);
  Color get ColorPrimaryText => _ColorPrimaryText;
  set ColorPrimaryText(Color value) {
    _ColorPrimaryText = value;
  }

  Color _ColorTertiary = const Color(0xffffffff);
  Color get ColorTertiary => _ColorTertiary;
  set ColorTertiary(Color value) {
    _ColorTertiary = value;
  }

  Color _ColorSecondaryText = const Color(0xffefefef);
  Color get ColorSecondaryText => _ColorSecondaryText;
  set ColorSecondaryText(Color value) {
    _ColorSecondaryText = value;
  }

  bool _emailstate = false;
  bool get emailstate => _emailstate;
  set emailstate(bool value) {
    _emailstate = value;
  }

  bool _passworstate = false;
  bool get passworstate => _passworstate;
  set passworstate(bool value) {
    _passworstate = value;
  }

  bool _cpfcnpjstate = false;
  bool get cpfcnpjstate => _cpfcnpjstate;
  set cpfcnpjstate(bool value) {
    _cpfcnpjstate = value;
  }

  String _QuemNavega = '';
  String get QuemNavega => _QuemNavega;
  set QuemNavega(String value) {
    _QuemNavega = value;
    secureStorage.setString('ff_QuemNavega', value);
  }

  void deleteQuemNavega() {
    secureStorage.delete(key: 'ff_QuemNavega');
  }

  bool _usuariologado = false;
  bool get usuariologado => _usuariologado;
  set usuariologado(bool value) {
    _usuariologado = value;
  }

  OpcoesVariaveisStruct _UserOptions =
      OpcoesVariaveisStruct.fromSerializableMap(jsonDecode(
          '{"estado_civil":"[\\"Casado(a)\\",\\"Solteiro(a)\\",\\"Divorciado(a)\\",\\"Viúvo(a)\\",\\"União Estável\\"]","dependentes":"[\\"Pai/Mãe\\",\\"Filho(a)\\",\\"Sobrinho(a)\\",\\"Neto(a)\\",\\"Enteado(a)\\",\\"Cônjuge\\",\\"Outros\\"]","vinculoprofissional":"[\\"Autônomo\\",\\"CLT Privado\\",\\"CLT Público\\",\\"Funcionário  Público\\",\\"Estatutário\\",\\"Empresário\\"]","segurotipo":"[\\"Invalidez Permanente por Acidente\\",\\"Seguro de Vida\\",\\"Seguro Patrimonial\\",\\"Plano de Saúde\\",\\"Invalidez Funcional por Doença\\",\\"Seguro Elementar\\",\\"Seguro DIT\\",\\"Responsabilidade Civil\\",\\"Invalidez por Acidente\\",\\"Morte Acidental\\"]","ativotipo":"[\\"Imóvel\\",\\"Terreno\\",\\"Investimento Internacional\\",\\"Invetimento Doméstico\\",\\"Previdência Privada\\",\\"Participação Societária\\",\\"Mútuo\\",\\"Assessor Responsável\\",\\"Outros\\",\\"Consórcio\\"]","passivotipo":"[\\"Consórcio\\",\\"Crédito Pessoal\\",\\"Crédito Imobiliário\\",\\"Cartão de Crédito\\",\\"Finaciamento Veículo\\",\\"Financiamento Imóvel\\"]","projetosvida":"[\\"Qualidade de Vida\\",\\"Independência Financeira\\"]","generos":"[\\"Mulher\\",\\"Homem\\"]","suitabilities":"[\\"Conservador\\",\\"Moderado\\",\\"Agressivo\\"]","IRPF":"[\\"Simples\\",\\"Completa\\"]","regimeuniao":"[\\"Comunhão Universal de Bens\\",\\"Comunhão Parcial de Bens\\",\\"Separação Total de Bens\\",\\"Participação Final nos Aquestos\\"]","seguroempresa":"[\\"Itaú\\",\\"Bradesco\\",\\"Metlife\\",\\"Mafre\\",\\"Mongeral\\",\\"Porto Seguro\\",\\"HDI Seguros\\",\\"Icatu\\",\\"Unimed\\",\\"Outros\\"]","statuspatrimonio":"[\\"Incorporado\\",\\"A Incorporar\\"]","recebimento":"[\\"Prestações\\",\\"Paecela Única\\"]","pagamento":"[\\"Prestações\\",\\"Parcela Única\\"]","consumopatrimonio":"[\\"Sem Consumo Patrimonial\\",\\"Total\\",\\"Parcial\\"]","produtostipo":"[\\"Consórcio\\",\\"Seguro\\",\\"Crédito Imobiliário\\",\\"Home Equity\\",\\"Câmbio\\",\\"Crédito Corporativo\\",\\"Ação\\",\\"Investimento Doméstico\\",\\"Investimento Internacional\\",\\"Sucessão\\"]","dia":"[]","mes":"[]","ano":"[]","Renda_Fixa":"[\\"Tesouro Direto\\",\\"Certificados de Depósito Bancário (CDB)\\",\\"Letras de Crédito (LCI) ou (LCA)\\",\\"Debêntures\\",\\"Fundos de Renda Fixa\\",\\"Letras Financeiras\\",\\"Letras Hipotecárias (LH) ou (LCI)\\",\\"Poupança\\",\\"Notas do Tesouro Nacional (NTN) ou (LTN):\\",\\"CRI ou CRA \\",\\"Outro\\"]","Renda_Variavel":"[\\"Ações\\",\\"Fundos de Ações\\",\\"Exchange-Traded Funds (ETFs)\\",\\"Mercado Futuro\\",\\"Opções\\",\\"BDRs (Brazilian Depositary Receipts)\\",\\"Outro\\"]","Previdencia_Privada":"[\\"Plano Gerador de Benefício Livre (PGBL)\\",\\"Vida Gerador de Benefício Livre (VGBL)\\",\\"Outro\\"]","Fundos_Investimento":"[\\"Fundos de Renda Fixa:\\",\\"Fundos de Ações\\",\\"Fundos Multimercado\\",\\"Fundos de Investimento Imobiliário (FII)\\",\\"Fundos de Dívida Externa\\",\\"Fundos Cambiais\\",\\"Fundos Referenciados\\",\\"Fundos de Curto Prazo\\",\\"Fundos de Crédito Privado\\",\\"Fundos de Índice (ETFs)\\",\\"Outro\\"]","Derivativos":"[\\"Futuros\\",\\"Opções\\",\\"Swaps\\",\\"Contratos por Diferença (CFDs)\\",\\"Forwards\\",\\"Opções Exóticas\\",\\"Outro\\"]","Cambio":"[\\"Compra Direta de Moeda Estrangeira\\",\\"Investimento em Fundos Cambiais\\",\\"Operações em Forex \\",\\"Contratos Futuros de Moeda\\",\\"Opções de Moeda\\",\\"ETFs Cambiais (Exchange-Traded Funds)\\",\\"Contas Multimoeda\\",\\"Swaps Cambiais\\",\\"Outro\\"]","Consorcio":"[\\"Veículo\\",\\"Imóvel\\",\\"Serviço\\",\\"Máquinas e Equipamentos\\",\\"Eletrônicos e Eletrodomésticos\\",\\"Outro\\"]","Titulos_Capitalizacao":"[\\"Tradicional\\",\\"Popular\\",\\"Compra Programada\\",\\"Incentivo\\",\\"Instrumento de Garantia\\",\\"Outro\\"]","ContaEmergencia_Poupanca":"[\\"Conta Corrente\\",\\"Conta Poupança\\",\\"Fundos de Renda Fixa de Baixa Volatilidade\\",\\"CDB liquidez diária\\",\\"Tesouro Selic (LFT)\\",\\"Títulos de Capitalização\\",\\"Contas de Mercado Monetário\\",\\"Outro\\"]","Criptomoeda":"[\\"Bitcoin (BTC)\\",\\"Ethereum (ETH)\\",\\"Binance Coin (BNB)\\",\\"Cardano (ADA)\\",\\"Ripple (XRP)\\",\\"Litecoin (LTC)\\",\\"Polkadot (DOT)\\",\\"Outro\\"]","Investimentos_Alternativos":"[\\"Imóveis\\",\\"Commodities\\",\\"Hedge Funds\\",\\"Capital de Risco (Venture Capital)\\",\\"Private Equity\\",\\"Moedas e Criptomoedas\\",\\"Arte e Itens Colecionáveis\\",\\"Dívida Distressed:\\",\\"Investimentos Florestais e Agrícolas:\\",\\"Infraestrutura\\",\\"Fundos de Fundos (FoFs)\\",\\"Outro\\"]","Crowdfunding_Investimento":"[\\"Crowdfunding de Doações\\",\\"Crowdfunding de Recompensas\\",\\"Crowdfunding de Ações \\",\\"Crowdfunding de Dívida (Peer-to-Peer ou P2P)\\",\\"Crowdfunding de Patrocínio\\",\\"Crowdfunding Imobiliário\\",\\"Crowdfunding Baseado em Royalties\\",\\"Outro\\"]","Fundo_Pensao":"[\\"Fundos de Pensão (BD)\\",\\"Fundos de Pensão (CD):\\",\\"Fundos de Pensão Híbridos\\",\\"Fundos Multiempregadores\\",\\"Fundos de Pensão Profissionais ou Classe\\",\\"Fundos de Pensão Fechados\\",\\"Fundos de Pensão Abertos\\",\\"Outro\\"]","Risco_Associado":"[\\"Baixo\\",\\"Médio\\",\\"Alto\\"]","Horizonte_Investimento":"[\\"Curto\\",\\"Médio\\",\\"Longo\\"]","Liquidez":"[\\"Alta \\",\\"Média\\",\\"Baixa\\"]","Impostos_Taxas":"[\\"Variável\\",\\"Isento\\",\\"Fixo\\"]","Regulamentacao":"[\\"CVM\\",\\"Banco Central\\",\\"SUSEP\\",\\"Outro\\"]","Objetivo_Investimento":"[\\"Preservação do Capital\\",\\"Crescimento\\",\\"Geração de Renda\\",\\"Outros\\"]","Volatilidade":"[\\"Baixa\\",\\"Média\\",\\"Alta\\"]","Rating":"[\\"AAA\\",\\"AA\\",\\"A\\",\\"BBB\\",\\"BB\\",\\"B\\",\\"C\\",\\"D\\"]","Nivel_Protecao_Capital":"[\\"Garantido\\",\\"Parcialmente Garantido\\",\\"Não Garantido\\"]","Beneficios_Fiscais":"[\\"Com \\",\\"Sem\\",\\"Outros\\"]","PrivateEquity":"[\\"Buyout ou Aquisição Alavancada:\\",\\"Capital de Crescimento\\",\\"Turnaround ou Distressed Investing\\",\\"Mezanino\\",\\"Fundos de Fundos (FoF)\\",\\"Outros\\"]","venture_capital":"[\\"Seed Capital\\",\\"Start-up Capital\\",\\"Early-Stage Capital\\",\\"Late-Stage Capital\\",\\"Capital de Expansão\\",\\"Outros\\"]","ativo_nao_financeiro":"[\\"Imóvel\\",\\"Terreno\\",\\"Veículo\\",\\"Outros\\"]","ativo_nao_financeiro_finalidade":"[\\"Uso Pessoal\\",\\"Geração Renda\\",\\"Investimento para Valorização\\",\\"Negócio ou Atividade Profissional\\",\\"Proteção e Segurança\\",\\"Desenvolvimento Pessoal e Educação\\",\\"Conservação e Sustentabilidade\\",\\"Herança ou Legado Familiar\\"]","ativo_financeiro_objetivos":"[\\"Acumulação de Capital\\",\\"Geração de Renda\\",\\"Preservação de Capital\\",\\"Diversificação\\",\\"Planejamento para Aposentadoria\\",\\"Proteção ou Hedge\\",\\"Especulação\\",\\"Objetivos Específicos de Curto Prazo\\",\\"Benefícios Fiscais\\",\\"Outros\\"]"}'));
  OpcoesVariaveisStruct get UserOptions => _UserOptions;
  set UserOptions(OpcoesVariaveisStruct value) {
    _UserOptions = value;
    secureStorage.setString('ff_UserOptions', value.serialize());
  }

  void deleteUserOptions() {
    secureStorage.delete(key: 'ff_UserOptions');
  }

  void updateUserOptionsStruct(Function(OpcoesVariaveisStruct) updateFn) {
    updateFn(_UserOptions);
    secureStorage.setString('ff_UserOptions', _UserOptions.serialize());
  }

  bool _perfilEmpresa = false;
  bool get perfilEmpresa => _perfilEmpresa;
  set perfilEmpresa(bool value) {
    _perfilEmpresa = value;
  }

  CoresDefinicaoStruct _ColorOptions = CoresDefinicaoStruct.fromSerializableMap(
      jsonDecode(
          '{"primarycolor":"#000080","secondarycolor":"#5f9845","tertiarycolor":"#fff","alternatecolor":"#fff","primarytext":"#323b45","secondarytext":"#efefef","primarybackground":"#fff","secondarybackground":"#000080","CustomBottom":"#ffffffbe","CustomStarPrimary":"#000080","CustomStarSecondary":"#2f4c63","CustomAlternateSecondary":"#182672"}'));
  CoresDefinicaoStruct get ColorOptions => _ColorOptions;
  set ColorOptions(CoresDefinicaoStruct value) {
    _ColorOptions = value;
  }

  void updateColorOptionsStruct(Function(CoresDefinicaoStruct) updateFn) {
    updateFn(_ColorOptions);
  }

  List<String> _UsersTipo = ['Advisor', 'Principal', 'Administartivo'];
  List<String> get UsersTipo => _UsersTipo;
  set UsersTipo(List<String> value) {
    _UsersTipo = value;
  }

  void addToUsersTipo(String value) {
    _UsersTipo.add(value);
  }

  void removeFromUsersTipo(String value) {
    _UsersTipo.remove(value);
  }

  void removeAtIndexFromUsersTipo(int index) {
    _UsersTipo.removeAt(index);
  }

  void updateUsersTipoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _UsersTipo[index] = updateFn(_UsersTipo[index]);
  }

  void insertAtIndexInUsersTipo(int index, String value) {
    _UsersTipo.insert(index, value);
  }

  UserDataStruct _UserBirthayDate = UserDataStruct();
  UserDataStruct get UserBirthayDate => _UserBirthayDate;
  set UserBirthayDate(UserDataStruct value) {
    _UserBirthayDate = value;
  }

  void updateUserBirthayDateStruct(Function(UserDataStruct) updateFn) {
    updateFn(_UserBirthayDate);
  }

  DocumentReference? _docRefUsers;
  DocumentReference? get docRefUsers => _docRefUsers;
  set docRefUsers(DocumentReference? value) {
    _docRefUsers = value;
    value != null
        ? secureStorage.setString('ff_docRefUsers', value.path)
        : secureStorage.remove('ff_docRefUsers');
  }

  void deleteDocRefUsers() {
    secureStorage.delete(key: 'ff_docRefUsers');
  }

  DocumentReference? _docRefProduto;
  DocumentReference? get docRefProduto => _docRefProduto;
  set docRefProduto(DocumentReference? value) {
    _docRefProduto = value;
    value != null
        ? secureStorage.setString('ff_docRefProduto', value.path)
        : secureStorage.remove('ff_docRefProduto');
  }

  void deleteDocRefProduto() {
    secureStorage.delete(key: 'ff_docRefProduto');
  }

  IdadeEducacaoStruct _iadadeEducacao = IdadeEducacaoStruct.fromSerializableMap(
      jsonDecode(
          '{"idade_creche":"2","idade_preescola":"5","idade_ensinofundamental":"10","idade_ensinomedio":"15","idade_ensinosuperior":"18","idade_ensinograducao":"23"}'));
  IdadeEducacaoStruct get iadadeEducacao => _iadadeEducacao;
  set iadadeEducacao(IdadeEducacaoStruct value) {
    _iadadeEducacao = value;
  }

  void updateIadadeEducacaoStruct(Function(IdadeEducacaoStruct) updateFn) {
    updateFn(_iadadeEducacao);
  }

  PeriodoStruct _periodicidade = PeriodoStruct.fromSerializableMap(jsonDecode(
      '{"anual":"1","bianual":"2","quinquenal":"5","decenio":"10"}'));
  PeriodoStruct get periodicidade => _periodicidade;
  set periodicidade(PeriodoStruct value) {
    _periodicidade = value;
  }

  void updatePeriodicidadeStruct(Function(PeriodoStruct) updateFn) {
    updateFn(_periodicidade);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
