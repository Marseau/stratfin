// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OpcoesVariaveisStruct extends FFFirebaseStruct {
  OpcoesVariaveisStruct({
    List<String>? estadoCivil,
    List<String>? dependentes,
    List<String>? vinculoprofissional,
    List<String>? segurotipo,
    List<String>? ativotipo,
    List<String>? passivotipo,
    List<String>? projetosvida,
    List<String>? generos,
    List<String>? suitabilities,
    List<String>? irpf,
    List<String>? regimeuniao,
    List<String>? seguroempresa,
    List<String>? statuspatrimonio,
    List<String>? recebimento,
    List<String>? pagamento,
    List<String>? consumopatrimonio,
    List<String>? produtostipo,
    List<int>? dia,
    List<int>? mes,
    List<int>? ano,
    List<String>? rendaFixa,
    List<String>? rendaVariavel,
    List<String>? previdenciaPrivada,
    List<String>? fundosInvestimento,
    List<String>? derivativos,
    List<String>? cambio,
    List<String>? consorcio,
    List<String>? titulosCapitalizacao,
    List<String>? contaEmergenciaPoupanca,
    List<String>? criptomoeda,
    List<String>? investimentosAlternativos,
    List<String>? crowdfundingInvestimento,
    List<String>? fundoPensao,
    List<String>? riscoAssociado,
    List<String>? horizonteInvestimento,
    List<String>? liquidez,
    List<String>? impostosTaxas,
    List<String>? regulamentacao,
    List<String>? objetivoInvestimento,
    List<String>? volatilidade,
    List<String>? rating,
    List<String>? nivelProtecaoCapital,
    List<String>? beneficiosFiscais,
    List<String>? privateEquity,
    List<String>? ventureCapital,
    List<String>? ativoNaoFinanceiro,
    List<String>? ativoNaoFinanceiroFinalidade,
    List<String>? ativoFinanceiroObjetivos,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _estadoCivil = estadoCivil,
        _dependentes = dependentes,
        _vinculoprofissional = vinculoprofissional,
        _segurotipo = segurotipo,
        _ativotipo = ativotipo,
        _passivotipo = passivotipo,
        _projetosvida = projetosvida,
        _generos = generos,
        _suitabilities = suitabilities,
        _irpf = irpf,
        _regimeuniao = regimeuniao,
        _seguroempresa = seguroempresa,
        _statuspatrimonio = statuspatrimonio,
        _recebimento = recebimento,
        _pagamento = pagamento,
        _consumopatrimonio = consumopatrimonio,
        _produtostipo = produtostipo,
        _dia = dia,
        _mes = mes,
        _ano = ano,
        _rendaFixa = rendaFixa,
        _rendaVariavel = rendaVariavel,
        _previdenciaPrivada = previdenciaPrivada,
        _fundosInvestimento = fundosInvestimento,
        _derivativos = derivativos,
        _cambio = cambio,
        _consorcio = consorcio,
        _titulosCapitalizacao = titulosCapitalizacao,
        _contaEmergenciaPoupanca = contaEmergenciaPoupanca,
        _criptomoeda = criptomoeda,
        _investimentosAlternativos = investimentosAlternativos,
        _crowdfundingInvestimento = crowdfundingInvestimento,
        _fundoPensao = fundoPensao,
        _riscoAssociado = riscoAssociado,
        _horizonteInvestimento = horizonteInvestimento,
        _liquidez = liquidez,
        _impostosTaxas = impostosTaxas,
        _regulamentacao = regulamentacao,
        _objetivoInvestimento = objetivoInvestimento,
        _volatilidade = volatilidade,
        _rating = rating,
        _nivelProtecaoCapital = nivelProtecaoCapital,
        _beneficiosFiscais = beneficiosFiscais,
        _privateEquity = privateEquity,
        _ventureCapital = ventureCapital,
        _ativoNaoFinanceiro = ativoNaoFinanceiro,
        _ativoNaoFinanceiroFinalidade = ativoNaoFinanceiroFinalidade,
        _ativoFinanceiroObjetivos = ativoFinanceiroObjetivos,
        super(firestoreUtilData);

  // "estado_civil" field.
  List<String>? _estadoCivil;
  List<String> get estadoCivil => _estadoCivil ?? const [];
  set estadoCivil(List<String>? val) => _estadoCivil = val;
  void updateEstadoCivil(Function(List<String>) updateFn) =>
      updateFn(_estadoCivil ??= []);
  bool hasEstadoCivil() => _estadoCivil != null;

  // "dependentes" field.
  List<String>? _dependentes;
  List<String> get dependentes => _dependentes ?? const [];
  set dependentes(List<String>? val) => _dependentes = val;
  void updateDependentes(Function(List<String>) updateFn) =>
      updateFn(_dependentes ??= []);
  bool hasDependentes() => _dependentes != null;

  // "vinculoprofissional" field.
  List<String>? _vinculoprofissional;
  List<String> get vinculoprofissional => _vinculoprofissional ?? const [];
  set vinculoprofissional(List<String>? val) => _vinculoprofissional = val;
  void updateVinculoprofissional(Function(List<String>) updateFn) =>
      updateFn(_vinculoprofissional ??= []);
  bool hasVinculoprofissional() => _vinculoprofissional != null;

  // "segurotipo" field.
  List<String>? _segurotipo;
  List<String> get segurotipo => _segurotipo ?? const [];
  set segurotipo(List<String>? val) => _segurotipo = val;
  void updateSegurotipo(Function(List<String>) updateFn) =>
      updateFn(_segurotipo ??= []);
  bool hasSegurotipo() => _segurotipo != null;

  // "ativotipo" field.
  List<String>? _ativotipo;
  List<String> get ativotipo => _ativotipo ?? const [];
  set ativotipo(List<String>? val) => _ativotipo = val;
  void updateAtivotipo(Function(List<String>) updateFn) =>
      updateFn(_ativotipo ??= []);
  bool hasAtivotipo() => _ativotipo != null;

  // "passivotipo" field.
  List<String>? _passivotipo;
  List<String> get passivotipo => _passivotipo ?? const [];
  set passivotipo(List<String>? val) => _passivotipo = val;
  void updatePassivotipo(Function(List<String>) updateFn) =>
      updateFn(_passivotipo ??= []);
  bool hasPassivotipo() => _passivotipo != null;

  // "projetosvida" field.
  List<String>? _projetosvida;
  List<String> get projetosvida => _projetosvida ?? const [];
  set projetosvida(List<String>? val) => _projetosvida = val;
  void updateProjetosvida(Function(List<String>) updateFn) =>
      updateFn(_projetosvida ??= []);
  bool hasProjetosvida() => _projetosvida != null;

  // "generos" field.
  List<String>? _generos;
  List<String> get generos => _generos ?? const [];
  set generos(List<String>? val) => _generos = val;
  void updateGeneros(Function(List<String>) updateFn) =>
      updateFn(_generos ??= []);
  bool hasGeneros() => _generos != null;

  // "suitabilities" field.
  List<String>? _suitabilities;
  List<String> get suitabilities => _suitabilities ?? const [];
  set suitabilities(List<String>? val) => _suitabilities = val;
  void updateSuitabilities(Function(List<String>) updateFn) =>
      updateFn(_suitabilities ??= []);
  bool hasSuitabilities() => _suitabilities != null;

  // "IRPF" field.
  List<String>? _irpf;
  List<String> get irpf => _irpf ?? const [];
  set irpf(List<String>? val) => _irpf = val;
  void updateIrpf(Function(List<String>) updateFn) => updateFn(_irpf ??= []);
  bool hasIrpf() => _irpf != null;

  // "regimeuniao" field.
  List<String>? _regimeuniao;
  List<String> get regimeuniao => _regimeuniao ?? const [];
  set regimeuniao(List<String>? val) => _regimeuniao = val;
  void updateRegimeuniao(Function(List<String>) updateFn) =>
      updateFn(_regimeuniao ??= []);
  bool hasRegimeuniao() => _regimeuniao != null;

  // "seguroempresa" field.
  List<String>? _seguroempresa;
  List<String> get seguroempresa => _seguroempresa ?? const [];
  set seguroempresa(List<String>? val) => _seguroempresa = val;
  void updateSeguroempresa(Function(List<String>) updateFn) =>
      updateFn(_seguroempresa ??= []);
  bool hasSeguroempresa() => _seguroempresa != null;

  // "statuspatrimonio" field.
  List<String>? _statuspatrimonio;
  List<String> get statuspatrimonio => _statuspatrimonio ?? const [];
  set statuspatrimonio(List<String>? val) => _statuspatrimonio = val;
  void updateStatuspatrimonio(Function(List<String>) updateFn) =>
      updateFn(_statuspatrimonio ??= []);
  bool hasStatuspatrimonio() => _statuspatrimonio != null;

  // "recebimento" field.
  List<String>? _recebimento;
  List<String> get recebimento => _recebimento ?? const [];
  set recebimento(List<String>? val) => _recebimento = val;
  void updateRecebimento(Function(List<String>) updateFn) =>
      updateFn(_recebimento ??= []);
  bool hasRecebimento() => _recebimento != null;

  // "pagamento" field.
  List<String>? _pagamento;
  List<String> get pagamento => _pagamento ?? const [];
  set pagamento(List<String>? val) => _pagamento = val;
  void updatePagamento(Function(List<String>) updateFn) =>
      updateFn(_pagamento ??= []);
  bool hasPagamento() => _pagamento != null;

  // "consumopatrimonio" field.
  List<String>? _consumopatrimonio;
  List<String> get consumopatrimonio => _consumopatrimonio ?? const [];
  set consumopatrimonio(List<String>? val) => _consumopatrimonio = val;
  void updateConsumopatrimonio(Function(List<String>) updateFn) =>
      updateFn(_consumopatrimonio ??= []);
  bool hasConsumopatrimonio() => _consumopatrimonio != null;

  // "produtostipo" field.
  List<String>? _produtostipo;
  List<String> get produtostipo => _produtostipo ?? const [];
  set produtostipo(List<String>? val) => _produtostipo = val;
  void updateProdutostipo(Function(List<String>) updateFn) =>
      updateFn(_produtostipo ??= []);
  bool hasProdutostipo() => _produtostipo != null;

  // "dia" field.
  List<int>? _dia;
  List<int> get dia => _dia ?? const [];
  set dia(List<int>? val) => _dia = val;
  void updateDia(Function(List<int>) updateFn) => updateFn(_dia ??= []);
  bool hasDia() => _dia != null;

  // "mes" field.
  List<int>? _mes;
  List<int> get mes => _mes ?? const [];
  set mes(List<int>? val) => _mes = val;
  void updateMes(Function(List<int>) updateFn) => updateFn(_mes ??= []);
  bool hasMes() => _mes != null;

  // "ano" field.
  List<int>? _ano;
  List<int> get ano => _ano ?? const [];
  set ano(List<int>? val) => _ano = val;
  void updateAno(Function(List<int>) updateFn) => updateFn(_ano ??= []);
  bool hasAno() => _ano != null;

  // "Renda_Fixa" field.
  List<String>? _rendaFixa;
  List<String> get rendaFixa => _rendaFixa ?? const [];
  set rendaFixa(List<String>? val) => _rendaFixa = val;
  void updateRendaFixa(Function(List<String>) updateFn) =>
      updateFn(_rendaFixa ??= []);
  bool hasRendaFixa() => _rendaFixa != null;

  // "Renda_Variavel" field.
  List<String>? _rendaVariavel;
  List<String> get rendaVariavel => _rendaVariavel ?? const [];
  set rendaVariavel(List<String>? val) => _rendaVariavel = val;
  void updateRendaVariavel(Function(List<String>) updateFn) =>
      updateFn(_rendaVariavel ??= []);
  bool hasRendaVariavel() => _rendaVariavel != null;

  // "Previdencia_Privada" field.
  List<String>? _previdenciaPrivada;
  List<String> get previdenciaPrivada => _previdenciaPrivada ?? const [];
  set previdenciaPrivada(List<String>? val) => _previdenciaPrivada = val;
  void updatePrevidenciaPrivada(Function(List<String>) updateFn) =>
      updateFn(_previdenciaPrivada ??= []);
  bool hasPrevidenciaPrivada() => _previdenciaPrivada != null;

  // "Fundos_Investimento" field.
  List<String>? _fundosInvestimento;
  List<String> get fundosInvestimento => _fundosInvestimento ?? const [];
  set fundosInvestimento(List<String>? val) => _fundosInvestimento = val;
  void updateFundosInvestimento(Function(List<String>) updateFn) =>
      updateFn(_fundosInvestimento ??= []);
  bool hasFundosInvestimento() => _fundosInvestimento != null;

  // "Derivativos" field.
  List<String>? _derivativos;
  List<String> get derivativos => _derivativos ?? const [];
  set derivativos(List<String>? val) => _derivativos = val;
  void updateDerivativos(Function(List<String>) updateFn) =>
      updateFn(_derivativos ??= []);
  bool hasDerivativos() => _derivativos != null;

  // "Cambio" field.
  List<String>? _cambio;
  List<String> get cambio => _cambio ?? const [];
  set cambio(List<String>? val) => _cambio = val;
  void updateCambio(Function(List<String>) updateFn) =>
      updateFn(_cambio ??= []);
  bool hasCambio() => _cambio != null;

  // "Consorcio" field.
  List<String>? _consorcio;
  List<String> get consorcio => _consorcio ?? const [];
  set consorcio(List<String>? val) => _consorcio = val;
  void updateConsorcio(Function(List<String>) updateFn) =>
      updateFn(_consorcio ??= []);
  bool hasConsorcio() => _consorcio != null;

  // "Titulos_Capitalizacao" field.
  List<String>? _titulosCapitalizacao;
  List<String> get titulosCapitalizacao => _titulosCapitalizacao ?? const [];
  set titulosCapitalizacao(List<String>? val) => _titulosCapitalizacao = val;
  void updateTitulosCapitalizacao(Function(List<String>) updateFn) =>
      updateFn(_titulosCapitalizacao ??= []);
  bool hasTitulosCapitalizacao() => _titulosCapitalizacao != null;

  // "ContaEmergencia_Poupanca" field.
  List<String>? _contaEmergenciaPoupanca;
  List<String> get contaEmergenciaPoupanca =>
      _contaEmergenciaPoupanca ?? const [];
  set contaEmergenciaPoupanca(List<String>? val) =>
      _contaEmergenciaPoupanca = val;
  void updateContaEmergenciaPoupanca(Function(List<String>) updateFn) =>
      updateFn(_contaEmergenciaPoupanca ??= []);
  bool hasContaEmergenciaPoupanca() => _contaEmergenciaPoupanca != null;

  // "Criptomoeda" field.
  List<String>? _criptomoeda;
  List<String> get criptomoeda => _criptomoeda ?? const [];
  set criptomoeda(List<String>? val) => _criptomoeda = val;
  void updateCriptomoeda(Function(List<String>) updateFn) =>
      updateFn(_criptomoeda ??= []);
  bool hasCriptomoeda() => _criptomoeda != null;

  // "Investimentos_Alternativos" field.
  List<String>? _investimentosAlternativos;
  List<String> get investimentosAlternativos =>
      _investimentosAlternativos ?? const [];
  set investimentosAlternativos(List<String>? val) =>
      _investimentosAlternativos = val;
  void updateInvestimentosAlternativos(Function(List<String>) updateFn) =>
      updateFn(_investimentosAlternativos ??= []);
  bool hasInvestimentosAlternativos() => _investimentosAlternativos != null;

  // "Crowdfunding_Investimento" field.
  List<String>? _crowdfundingInvestimento;
  List<String> get crowdfundingInvestimento =>
      _crowdfundingInvestimento ?? const [];
  set crowdfundingInvestimento(List<String>? val) =>
      _crowdfundingInvestimento = val;
  void updateCrowdfundingInvestimento(Function(List<String>) updateFn) =>
      updateFn(_crowdfundingInvestimento ??= []);
  bool hasCrowdfundingInvestimento() => _crowdfundingInvestimento != null;

  // "Fundo_Pensao" field.
  List<String>? _fundoPensao;
  List<String> get fundoPensao => _fundoPensao ?? const [];
  set fundoPensao(List<String>? val) => _fundoPensao = val;
  void updateFundoPensao(Function(List<String>) updateFn) =>
      updateFn(_fundoPensao ??= []);
  bool hasFundoPensao() => _fundoPensao != null;

  // "Risco_Associado" field.
  List<String>? _riscoAssociado;
  List<String> get riscoAssociado => _riscoAssociado ?? const [];
  set riscoAssociado(List<String>? val) => _riscoAssociado = val;
  void updateRiscoAssociado(Function(List<String>) updateFn) =>
      updateFn(_riscoAssociado ??= []);
  bool hasRiscoAssociado() => _riscoAssociado != null;

  // "Horizonte_Investimento" field.
  List<String>? _horizonteInvestimento;
  List<String> get horizonteInvestimento => _horizonteInvestimento ?? const [];
  set horizonteInvestimento(List<String>? val) => _horizonteInvestimento = val;
  void updateHorizonteInvestimento(Function(List<String>) updateFn) =>
      updateFn(_horizonteInvestimento ??= []);
  bool hasHorizonteInvestimento() => _horizonteInvestimento != null;

  // "Liquidez" field.
  List<String>? _liquidez;
  List<String> get liquidez => _liquidez ?? const [];
  set liquidez(List<String>? val) => _liquidez = val;
  void updateLiquidez(Function(List<String>) updateFn) =>
      updateFn(_liquidez ??= []);
  bool hasLiquidez() => _liquidez != null;

  // "Impostos_Taxas" field.
  List<String>? _impostosTaxas;
  List<String> get impostosTaxas => _impostosTaxas ?? const [];
  set impostosTaxas(List<String>? val) => _impostosTaxas = val;
  void updateImpostosTaxas(Function(List<String>) updateFn) =>
      updateFn(_impostosTaxas ??= []);
  bool hasImpostosTaxas() => _impostosTaxas != null;

  // "Regulamentacao" field.
  List<String>? _regulamentacao;
  List<String> get regulamentacao => _regulamentacao ?? const [];
  set regulamentacao(List<String>? val) => _regulamentacao = val;
  void updateRegulamentacao(Function(List<String>) updateFn) =>
      updateFn(_regulamentacao ??= []);
  bool hasRegulamentacao() => _regulamentacao != null;

  // "Objetivo_Investimento" field.
  List<String>? _objetivoInvestimento;
  List<String> get objetivoInvestimento => _objetivoInvestimento ?? const [];
  set objetivoInvestimento(List<String>? val) => _objetivoInvestimento = val;
  void updateObjetivoInvestimento(Function(List<String>) updateFn) =>
      updateFn(_objetivoInvestimento ??= []);
  bool hasObjetivoInvestimento() => _objetivoInvestimento != null;

  // "Volatilidade" field.
  List<String>? _volatilidade;
  List<String> get volatilidade => _volatilidade ?? const [];
  set volatilidade(List<String>? val) => _volatilidade = val;
  void updateVolatilidade(Function(List<String>) updateFn) =>
      updateFn(_volatilidade ??= []);
  bool hasVolatilidade() => _volatilidade != null;

  // "Rating" field.
  List<String>? _rating;
  List<String> get rating => _rating ?? const [];
  set rating(List<String>? val) => _rating = val;
  void updateRating(Function(List<String>) updateFn) =>
      updateFn(_rating ??= []);
  bool hasRating() => _rating != null;

  // "Nivel_Protecao_Capital" field.
  List<String>? _nivelProtecaoCapital;
  List<String> get nivelProtecaoCapital => _nivelProtecaoCapital ?? const [];
  set nivelProtecaoCapital(List<String>? val) => _nivelProtecaoCapital = val;
  void updateNivelProtecaoCapital(Function(List<String>) updateFn) =>
      updateFn(_nivelProtecaoCapital ??= []);
  bool hasNivelProtecaoCapital() => _nivelProtecaoCapital != null;

  // "Beneficios_Fiscais" field.
  List<String>? _beneficiosFiscais;
  List<String> get beneficiosFiscais => _beneficiosFiscais ?? const [];
  set beneficiosFiscais(List<String>? val) => _beneficiosFiscais = val;
  void updateBeneficiosFiscais(Function(List<String>) updateFn) =>
      updateFn(_beneficiosFiscais ??= []);
  bool hasBeneficiosFiscais() => _beneficiosFiscais != null;

  // "PrivateEquity" field.
  List<String>? _privateEquity;
  List<String> get privateEquity => _privateEquity ?? const [];
  set privateEquity(List<String>? val) => _privateEquity = val;
  void updatePrivateEquity(Function(List<String>) updateFn) =>
      updateFn(_privateEquity ??= []);
  bool hasPrivateEquity() => _privateEquity != null;

  // "venture_capital" field.
  List<String>? _ventureCapital;
  List<String> get ventureCapital => _ventureCapital ?? const [];
  set ventureCapital(List<String>? val) => _ventureCapital = val;
  void updateVentureCapital(Function(List<String>) updateFn) =>
      updateFn(_ventureCapital ??= []);
  bool hasVentureCapital() => _ventureCapital != null;

  // "ativo_nao_financeiro" field.
  List<String>? _ativoNaoFinanceiro;
  List<String> get ativoNaoFinanceiro => _ativoNaoFinanceiro ?? const [];
  set ativoNaoFinanceiro(List<String>? val) => _ativoNaoFinanceiro = val;
  void updateAtivoNaoFinanceiro(Function(List<String>) updateFn) =>
      updateFn(_ativoNaoFinanceiro ??= []);
  bool hasAtivoNaoFinanceiro() => _ativoNaoFinanceiro != null;

  // "ativo_nao_financeiro_finalidade" field.
  List<String>? _ativoNaoFinanceiroFinalidade;
  List<String> get ativoNaoFinanceiroFinalidade =>
      _ativoNaoFinanceiroFinalidade ?? const [];
  set ativoNaoFinanceiroFinalidade(List<String>? val) =>
      _ativoNaoFinanceiroFinalidade = val;
  void updateAtivoNaoFinanceiroFinalidade(Function(List<String>) updateFn) =>
      updateFn(_ativoNaoFinanceiroFinalidade ??= []);
  bool hasAtivoNaoFinanceiroFinalidade() =>
      _ativoNaoFinanceiroFinalidade != null;

  // "ativo_financeiro_objetivos" field.
  List<String>? _ativoFinanceiroObjetivos;
  List<String> get ativoFinanceiroObjetivos =>
      _ativoFinanceiroObjetivos ?? const [];
  set ativoFinanceiroObjetivos(List<String>? val) =>
      _ativoFinanceiroObjetivos = val;
  void updateAtivoFinanceiroObjetivos(Function(List<String>) updateFn) =>
      updateFn(_ativoFinanceiroObjetivos ??= []);
  bool hasAtivoFinanceiroObjetivos() => _ativoFinanceiroObjetivos != null;

  static OpcoesVariaveisStruct fromMap(Map<String, dynamic> data) =>
      OpcoesVariaveisStruct(
        estadoCivil: getDataList(data['estado_civil']),
        dependentes: getDataList(data['dependentes']),
        vinculoprofissional: getDataList(data['vinculoprofissional']),
        segurotipo: getDataList(data['segurotipo']),
        ativotipo: getDataList(data['ativotipo']),
        passivotipo: getDataList(data['passivotipo']),
        projetosvida: getDataList(data['projetosvida']),
        generos: getDataList(data['generos']),
        suitabilities: getDataList(data['suitabilities']),
        irpf: getDataList(data['IRPF']),
        regimeuniao: getDataList(data['regimeuniao']),
        seguroempresa: getDataList(data['seguroempresa']),
        statuspatrimonio: getDataList(data['statuspatrimonio']),
        recebimento: getDataList(data['recebimento']),
        pagamento: getDataList(data['pagamento']),
        consumopatrimonio: getDataList(data['consumopatrimonio']),
        produtostipo: getDataList(data['produtostipo']),
        dia: getDataList(data['dia']),
        mes: getDataList(data['mes']),
        ano: getDataList(data['ano']),
        rendaFixa: getDataList(data['Renda_Fixa']),
        rendaVariavel: getDataList(data['Renda_Variavel']),
        previdenciaPrivada: getDataList(data['Previdencia_Privada']),
        fundosInvestimento: getDataList(data['Fundos_Investimento']),
        derivativos: getDataList(data['Derivativos']),
        cambio: getDataList(data['Cambio']),
        consorcio: getDataList(data['Consorcio']),
        titulosCapitalizacao: getDataList(data['Titulos_Capitalizacao']),
        contaEmergenciaPoupanca: getDataList(data['ContaEmergencia_Poupanca']),
        criptomoeda: getDataList(data['Criptomoeda']),
        investimentosAlternativos:
            getDataList(data['Investimentos_Alternativos']),
        crowdfundingInvestimento:
            getDataList(data['Crowdfunding_Investimento']),
        fundoPensao: getDataList(data['Fundo_Pensao']),
        riscoAssociado: getDataList(data['Risco_Associado']),
        horizonteInvestimento: getDataList(data['Horizonte_Investimento']),
        liquidez: getDataList(data['Liquidez']),
        impostosTaxas: getDataList(data['Impostos_Taxas']),
        regulamentacao: getDataList(data['Regulamentacao']),
        objetivoInvestimento: getDataList(data['Objetivo_Investimento']),
        volatilidade: getDataList(data['Volatilidade']),
        rating: getDataList(data['Rating']),
        nivelProtecaoCapital: getDataList(data['Nivel_Protecao_Capital']),
        beneficiosFiscais: getDataList(data['Beneficios_Fiscais']),
        privateEquity: getDataList(data['PrivateEquity']),
        ventureCapital: getDataList(data['venture_capital']),
        ativoNaoFinanceiro: getDataList(data['ativo_nao_financeiro']),
        ativoNaoFinanceiroFinalidade:
            getDataList(data['ativo_nao_financeiro_finalidade']),
        ativoFinanceiroObjetivos:
            getDataList(data['ativo_financeiro_objetivos']),
      );

  static OpcoesVariaveisStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? OpcoesVariaveisStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'estado_civil': _estadoCivil,
        'dependentes': _dependentes,
        'vinculoprofissional': _vinculoprofissional,
        'segurotipo': _segurotipo,
        'ativotipo': _ativotipo,
        'passivotipo': _passivotipo,
        'projetosvida': _projetosvida,
        'generos': _generos,
        'suitabilities': _suitabilities,
        'IRPF': _irpf,
        'regimeuniao': _regimeuniao,
        'seguroempresa': _seguroempresa,
        'statuspatrimonio': _statuspatrimonio,
        'recebimento': _recebimento,
        'pagamento': _pagamento,
        'consumopatrimonio': _consumopatrimonio,
        'produtostipo': _produtostipo,
        'dia': _dia,
        'mes': _mes,
        'ano': _ano,
        'Renda_Fixa': _rendaFixa,
        'Renda_Variavel': _rendaVariavel,
        'Previdencia_Privada': _previdenciaPrivada,
        'Fundos_Investimento': _fundosInvestimento,
        'Derivativos': _derivativos,
        'Cambio': _cambio,
        'Consorcio': _consorcio,
        'Titulos_Capitalizacao': _titulosCapitalizacao,
        'ContaEmergencia_Poupanca': _contaEmergenciaPoupanca,
        'Criptomoeda': _criptomoeda,
        'Investimentos_Alternativos': _investimentosAlternativos,
        'Crowdfunding_Investimento': _crowdfundingInvestimento,
        'Fundo_Pensao': _fundoPensao,
        'Risco_Associado': _riscoAssociado,
        'Horizonte_Investimento': _horizonteInvestimento,
        'Liquidez': _liquidez,
        'Impostos_Taxas': _impostosTaxas,
        'Regulamentacao': _regulamentacao,
        'Objetivo_Investimento': _objetivoInvestimento,
        'Volatilidade': _volatilidade,
        'Rating': _rating,
        'Nivel_Protecao_Capital': _nivelProtecaoCapital,
        'Beneficios_Fiscais': _beneficiosFiscais,
        'PrivateEquity': _privateEquity,
        'venture_capital': _ventureCapital,
        'ativo_nao_financeiro': _ativoNaoFinanceiro,
        'ativo_nao_financeiro_finalidade': _ativoNaoFinanceiroFinalidade,
        'ativo_financeiro_objetivos': _ativoFinanceiroObjetivos,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'estado_civil': serializeParam(
          _estadoCivil,
          ParamType.String,
          true,
        ),
        'dependentes': serializeParam(
          _dependentes,
          ParamType.String,
          true,
        ),
        'vinculoprofissional': serializeParam(
          _vinculoprofissional,
          ParamType.String,
          true,
        ),
        'segurotipo': serializeParam(
          _segurotipo,
          ParamType.String,
          true,
        ),
        'ativotipo': serializeParam(
          _ativotipo,
          ParamType.String,
          true,
        ),
        'passivotipo': serializeParam(
          _passivotipo,
          ParamType.String,
          true,
        ),
        'projetosvida': serializeParam(
          _projetosvida,
          ParamType.String,
          true,
        ),
        'generos': serializeParam(
          _generos,
          ParamType.String,
          true,
        ),
        'suitabilities': serializeParam(
          _suitabilities,
          ParamType.String,
          true,
        ),
        'IRPF': serializeParam(
          _irpf,
          ParamType.String,
          true,
        ),
        'regimeuniao': serializeParam(
          _regimeuniao,
          ParamType.String,
          true,
        ),
        'seguroempresa': serializeParam(
          _seguroempresa,
          ParamType.String,
          true,
        ),
        'statuspatrimonio': serializeParam(
          _statuspatrimonio,
          ParamType.String,
          true,
        ),
        'recebimento': serializeParam(
          _recebimento,
          ParamType.String,
          true,
        ),
        'pagamento': serializeParam(
          _pagamento,
          ParamType.String,
          true,
        ),
        'consumopatrimonio': serializeParam(
          _consumopatrimonio,
          ParamType.String,
          true,
        ),
        'produtostipo': serializeParam(
          _produtostipo,
          ParamType.String,
          true,
        ),
        'dia': serializeParam(
          _dia,
          ParamType.int,
          true,
        ),
        'mes': serializeParam(
          _mes,
          ParamType.int,
          true,
        ),
        'ano': serializeParam(
          _ano,
          ParamType.int,
          true,
        ),
        'Renda_Fixa': serializeParam(
          _rendaFixa,
          ParamType.String,
          true,
        ),
        'Renda_Variavel': serializeParam(
          _rendaVariavel,
          ParamType.String,
          true,
        ),
        'Previdencia_Privada': serializeParam(
          _previdenciaPrivada,
          ParamType.String,
          true,
        ),
        'Fundos_Investimento': serializeParam(
          _fundosInvestimento,
          ParamType.String,
          true,
        ),
        'Derivativos': serializeParam(
          _derivativos,
          ParamType.String,
          true,
        ),
        'Cambio': serializeParam(
          _cambio,
          ParamType.String,
          true,
        ),
        'Consorcio': serializeParam(
          _consorcio,
          ParamType.String,
          true,
        ),
        'Titulos_Capitalizacao': serializeParam(
          _titulosCapitalizacao,
          ParamType.String,
          true,
        ),
        'ContaEmergencia_Poupanca': serializeParam(
          _contaEmergenciaPoupanca,
          ParamType.String,
          true,
        ),
        'Criptomoeda': serializeParam(
          _criptomoeda,
          ParamType.String,
          true,
        ),
        'Investimentos_Alternativos': serializeParam(
          _investimentosAlternativos,
          ParamType.String,
          true,
        ),
        'Crowdfunding_Investimento': serializeParam(
          _crowdfundingInvestimento,
          ParamType.String,
          true,
        ),
        'Fundo_Pensao': serializeParam(
          _fundoPensao,
          ParamType.String,
          true,
        ),
        'Risco_Associado': serializeParam(
          _riscoAssociado,
          ParamType.String,
          true,
        ),
        'Horizonte_Investimento': serializeParam(
          _horizonteInvestimento,
          ParamType.String,
          true,
        ),
        'Liquidez': serializeParam(
          _liquidez,
          ParamType.String,
          true,
        ),
        'Impostos_Taxas': serializeParam(
          _impostosTaxas,
          ParamType.String,
          true,
        ),
        'Regulamentacao': serializeParam(
          _regulamentacao,
          ParamType.String,
          true,
        ),
        'Objetivo_Investimento': serializeParam(
          _objetivoInvestimento,
          ParamType.String,
          true,
        ),
        'Volatilidade': serializeParam(
          _volatilidade,
          ParamType.String,
          true,
        ),
        'Rating': serializeParam(
          _rating,
          ParamType.String,
          true,
        ),
        'Nivel_Protecao_Capital': serializeParam(
          _nivelProtecaoCapital,
          ParamType.String,
          true,
        ),
        'Beneficios_Fiscais': serializeParam(
          _beneficiosFiscais,
          ParamType.String,
          true,
        ),
        'PrivateEquity': serializeParam(
          _privateEquity,
          ParamType.String,
          true,
        ),
        'venture_capital': serializeParam(
          _ventureCapital,
          ParamType.String,
          true,
        ),
        'ativo_nao_financeiro': serializeParam(
          _ativoNaoFinanceiro,
          ParamType.String,
          true,
        ),
        'ativo_nao_financeiro_finalidade': serializeParam(
          _ativoNaoFinanceiroFinalidade,
          ParamType.String,
          true,
        ),
        'ativo_financeiro_objetivos': serializeParam(
          _ativoFinanceiroObjetivos,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static OpcoesVariaveisStruct fromSerializableMap(Map<String, dynamic> data) =>
      OpcoesVariaveisStruct(
        estadoCivil: deserializeParam<String>(
          data['estado_civil'],
          ParamType.String,
          true,
        ),
        dependentes: deserializeParam<String>(
          data['dependentes'],
          ParamType.String,
          true,
        ),
        vinculoprofissional: deserializeParam<String>(
          data['vinculoprofissional'],
          ParamType.String,
          true,
        ),
        segurotipo: deserializeParam<String>(
          data['segurotipo'],
          ParamType.String,
          true,
        ),
        ativotipo: deserializeParam<String>(
          data['ativotipo'],
          ParamType.String,
          true,
        ),
        passivotipo: deserializeParam<String>(
          data['passivotipo'],
          ParamType.String,
          true,
        ),
        projetosvida: deserializeParam<String>(
          data['projetosvida'],
          ParamType.String,
          true,
        ),
        generos: deserializeParam<String>(
          data['generos'],
          ParamType.String,
          true,
        ),
        suitabilities: deserializeParam<String>(
          data['suitabilities'],
          ParamType.String,
          true,
        ),
        irpf: deserializeParam<String>(
          data['IRPF'],
          ParamType.String,
          true,
        ),
        regimeuniao: deserializeParam<String>(
          data['regimeuniao'],
          ParamType.String,
          true,
        ),
        seguroempresa: deserializeParam<String>(
          data['seguroempresa'],
          ParamType.String,
          true,
        ),
        statuspatrimonio: deserializeParam<String>(
          data['statuspatrimonio'],
          ParamType.String,
          true,
        ),
        recebimento: deserializeParam<String>(
          data['recebimento'],
          ParamType.String,
          true,
        ),
        pagamento: deserializeParam<String>(
          data['pagamento'],
          ParamType.String,
          true,
        ),
        consumopatrimonio: deserializeParam<String>(
          data['consumopatrimonio'],
          ParamType.String,
          true,
        ),
        produtostipo: deserializeParam<String>(
          data['produtostipo'],
          ParamType.String,
          true,
        ),
        dia: deserializeParam<int>(
          data['dia'],
          ParamType.int,
          true,
        ),
        mes: deserializeParam<int>(
          data['mes'],
          ParamType.int,
          true,
        ),
        ano: deserializeParam<int>(
          data['ano'],
          ParamType.int,
          true,
        ),
        rendaFixa: deserializeParam<String>(
          data['Renda_Fixa'],
          ParamType.String,
          true,
        ),
        rendaVariavel: deserializeParam<String>(
          data['Renda_Variavel'],
          ParamType.String,
          true,
        ),
        previdenciaPrivada: deserializeParam<String>(
          data['Previdencia_Privada'],
          ParamType.String,
          true,
        ),
        fundosInvestimento: deserializeParam<String>(
          data['Fundos_Investimento'],
          ParamType.String,
          true,
        ),
        derivativos: deserializeParam<String>(
          data['Derivativos'],
          ParamType.String,
          true,
        ),
        cambio: deserializeParam<String>(
          data['Cambio'],
          ParamType.String,
          true,
        ),
        consorcio: deserializeParam<String>(
          data['Consorcio'],
          ParamType.String,
          true,
        ),
        titulosCapitalizacao: deserializeParam<String>(
          data['Titulos_Capitalizacao'],
          ParamType.String,
          true,
        ),
        contaEmergenciaPoupanca: deserializeParam<String>(
          data['ContaEmergencia_Poupanca'],
          ParamType.String,
          true,
        ),
        criptomoeda: deserializeParam<String>(
          data['Criptomoeda'],
          ParamType.String,
          true,
        ),
        investimentosAlternativos: deserializeParam<String>(
          data['Investimentos_Alternativos'],
          ParamType.String,
          true,
        ),
        crowdfundingInvestimento: deserializeParam<String>(
          data['Crowdfunding_Investimento'],
          ParamType.String,
          true,
        ),
        fundoPensao: deserializeParam<String>(
          data['Fundo_Pensao'],
          ParamType.String,
          true,
        ),
        riscoAssociado: deserializeParam<String>(
          data['Risco_Associado'],
          ParamType.String,
          true,
        ),
        horizonteInvestimento: deserializeParam<String>(
          data['Horizonte_Investimento'],
          ParamType.String,
          true,
        ),
        liquidez: deserializeParam<String>(
          data['Liquidez'],
          ParamType.String,
          true,
        ),
        impostosTaxas: deserializeParam<String>(
          data['Impostos_Taxas'],
          ParamType.String,
          true,
        ),
        regulamentacao: deserializeParam<String>(
          data['Regulamentacao'],
          ParamType.String,
          true,
        ),
        objetivoInvestimento: deserializeParam<String>(
          data['Objetivo_Investimento'],
          ParamType.String,
          true,
        ),
        volatilidade: deserializeParam<String>(
          data['Volatilidade'],
          ParamType.String,
          true,
        ),
        rating: deserializeParam<String>(
          data['Rating'],
          ParamType.String,
          true,
        ),
        nivelProtecaoCapital: deserializeParam<String>(
          data['Nivel_Protecao_Capital'],
          ParamType.String,
          true,
        ),
        beneficiosFiscais: deserializeParam<String>(
          data['Beneficios_Fiscais'],
          ParamType.String,
          true,
        ),
        privateEquity: deserializeParam<String>(
          data['PrivateEquity'],
          ParamType.String,
          true,
        ),
        ventureCapital: deserializeParam<String>(
          data['venture_capital'],
          ParamType.String,
          true,
        ),
        ativoNaoFinanceiro: deserializeParam<String>(
          data['ativo_nao_financeiro'],
          ParamType.String,
          true,
        ),
        ativoNaoFinanceiroFinalidade: deserializeParam<String>(
          data['ativo_nao_financeiro_finalidade'],
          ParamType.String,
          true,
        ),
        ativoFinanceiroObjetivos: deserializeParam<String>(
          data['ativo_financeiro_objetivos'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'OpcoesVariaveisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OpcoesVariaveisStruct &&
        listEquality.equals(estadoCivil, other.estadoCivil) &&
        listEquality.equals(dependentes, other.dependentes) &&
        listEquality.equals(vinculoprofissional, other.vinculoprofissional) &&
        listEquality.equals(segurotipo, other.segurotipo) &&
        listEquality.equals(ativotipo, other.ativotipo) &&
        listEquality.equals(passivotipo, other.passivotipo) &&
        listEquality.equals(projetosvida, other.projetosvida) &&
        listEquality.equals(generos, other.generos) &&
        listEquality.equals(suitabilities, other.suitabilities) &&
        listEquality.equals(irpf, other.irpf) &&
        listEquality.equals(regimeuniao, other.regimeuniao) &&
        listEquality.equals(seguroempresa, other.seguroempresa) &&
        listEquality.equals(statuspatrimonio, other.statuspatrimonio) &&
        listEquality.equals(recebimento, other.recebimento) &&
        listEquality.equals(pagamento, other.pagamento) &&
        listEquality.equals(consumopatrimonio, other.consumopatrimonio) &&
        listEquality.equals(produtostipo, other.produtostipo) &&
        listEquality.equals(dia, other.dia) &&
        listEquality.equals(mes, other.mes) &&
        listEquality.equals(ano, other.ano) &&
        listEquality.equals(rendaFixa, other.rendaFixa) &&
        listEquality.equals(rendaVariavel, other.rendaVariavel) &&
        listEquality.equals(previdenciaPrivada, other.previdenciaPrivada) &&
        listEquality.equals(fundosInvestimento, other.fundosInvestimento) &&
        listEquality.equals(derivativos, other.derivativos) &&
        listEquality.equals(cambio, other.cambio) &&
        listEquality.equals(consorcio, other.consorcio) &&
        listEquality.equals(titulosCapitalizacao, other.titulosCapitalizacao) &&
        listEquality.equals(
            contaEmergenciaPoupanca, other.contaEmergenciaPoupanca) &&
        listEquality.equals(criptomoeda, other.criptomoeda) &&
        listEquality.equals(
            investimentosAlternativos, other.investimentosAlternativos) &&
        listEquality.equals(
            crowdfundingInvestimento, other.crowdfundingInvestimento) &&
        listEquality.equals(fundoPensao, other.fundoPensao) &&
        listEquality.equals(riscoAssociado, other.riscoAssociado) &&
        listEquality.equals(
            horizonteInvestimento, other.horizonteInvestimento) &&
        listEquality.equals(liquidez, other.liquidez) &&
        listEquality.equals(impostosTaxas, other.impostosTaxas) &&
        listEquality.equals(regulamentacao, other.regulamentacao) &&
        listEquality.equals(objetivoInvestimento, other.objetivoInvestimento) &&
        listEquality.equals(volatilidade, other.volatilidade) &&
        listEquality.equals(rating, other.rating) &&
        listEquality.equals(nivelProtecaoCapital, other.nivelProtecaoCapital) &&
        listEquality.equals(beneficiosFiscais, other.beneficiosFiscais) &&
        listEquality.equals(privateEquity, other.privateEquity) &&
        listEquality.equals(ventureCapital, other.ventureCapital) &&
        listEquality.equals(ativoNaoFinanceiro, other.ativoNaoFinanceiro) &&
        listEquality.equals(
            ativoNaoFinanceiroFinalidade, other.ativoNaoFinanceiroFinalidade) &&
        listEquality.equals(
            ativoFinanceiroObjetivos, other.ativoFinanceiroObjetivos);
  }

  @override
  int get hashCode => const ListEquality().hash([
        estadoCivil,
        dependentes,
        vinculoprofissional,
        segurotipo,
        ativotipo,
        passivotipo,
        projetosvida,
        generos,
        suitabilities,
        irpf,
        regimeuniao,
        seguroempresa,
        statuspatrimonio,
        recebimento,
        pagamento,
        consumopatrimonio,
        produtostipo,
        dia,
        mes,
        ano,
        rendaFixa,
        rendaVariavel,
        previdenciaPrivada,
        fundosInvestimento,
        derivativos,
        cambio,
        consorcio,
        titulosCapitalizacao,
        contaEmergenciaPoupanca,
        criptomoeda,
        investimentosAlternativos,
        crowdfundingInvestimento,
        fundoPensao,
        riscoAssociado,
        horizonteInvestimento,
        liquidez,
        impostosTaxas,
        regulamentacao,
        objetivoInvestimento,
        volatilidade,
        rating,
        nivelProtecaoCapital,
        beneficiosFiscais,
        privateEquity,
        ventureCapital,
        ativoNaoFinanceiro,
        ativoNaoFinanceiroFinalidade,
        ativoFinanceiroObjetivos
      ]);
}

OpcoesVariaveisStruct createOpcoesVariaveisStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OpcoesVariaveisStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OpcoesVariaveisStruct? updateOpcoesVariaveisStruct(
  OpcoesVariaveisStruct? opcoesVariaveis, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    opcoesVariaveis
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOpcoesVariaveisStructData(
  Map<String, dynamic> firestoreData,
  OpcoesVariaveisStruct? opcoesVariaveis,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (opcoesVariaveis == null) {
    return;
  }
  if (opcoesVariaveis.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && opcoesVariaveis.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final opcoesVariaveisData =
      getOpcoesVariaveisFirestoreData(opcoesVariaveis, forFieldValue);
  final nestedData =
      opcoesVariaveisData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = opcoesVariaveis.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOpcoesVariaveisFirestoreData(
  OpcoesVariaveisStruct? opcoesVariaveis, [
  bool forFieldValue = false,
]) {
  if (opcoesVariaveis == null) {
    return {};
  }
  final firestoreData = mapToFirestore(opcoesVariaveis.toMap());

  // Add any Firestore field values
  opcoesVariaveis.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOpcoesVariaveisListFirestoreData(
  List<OpcoesVariaveisStruct>? opcoesVariaveiss,
) =>
    opcoesVariaveiss
        ?.map((e) => getOpcoesVariaveisFirestoreData(e, true))
        .toList() ??
    [];
