import '/components/dropdownconvidados_list_widget.dart';
import '/components/dropdownusers_list_widget.dart';
import '/dashboard/list_view_search/list_view_search_widget.dart';
import '/dashboard/top_nav_empresa/top_nav_empresa_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_cliente_widget.dart' show DashboardClienteWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DashboardClienteModel extends FlutterFlowModel<DashboardClienteWidget> {
  ///  Local state fields for this page.

  bool tabbarempresa = false;

  String? uiduser = '';

  bool perfil = true;

  int activetab = 0;

  String? activetabNome = '';

  bool basicas = false;

  bool usuarios = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController4;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController5;

  // Model for TopNavEmpresa component.
  late TopNavEmpresaModel topNavEmpresaModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for NomeCompleto widget.
  FocusNode? nomeCompletoFocusNode;
  TextEditingController? nomeCompletoController;
  String? Function(BuildContext, String?)? nomeCompletoControllerValidator;
  // State field(s) for Apelido widget.
  FocusNode? apelidoFocusNode;
  TextEditingController? apelidoController;
  String? Function(BuildContext, String?)? apelidoControllerValidator;
  // State field(s) for Celular widget.
  FocusNode? celularFocusNode;
  TextEditingController? celularController;
  final celularMask = MaskTextInputFormatter(mask: '+55 (##) ####-####');
  String? Function(BuildContext, String?)? celularControllerValidator;
  // State field(s) for CPF widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfController;
  String? Function(BuildContext, String?)? cpfControllerValidator;
  // State field(s) for Bio widget.
  FocusNode? bioFocusNode;
  TextEditingController? bioController;
  String? Function(BuildContext, String?)? bioControllerValidator;
  // State field(s) for DatadeNascimento widget.
  FocusNode? datadeNascimentoFocusNode;
  TextEditingController? datadeNascimentoController;
  String? Function(BuildContext, String?)? datadeNascimentoControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController8;
  final textFieldMask2 = MaskTextInputFormatter(mask: '+55 (##) ####-####');
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // Model for DropdownconvidadosList component.
  late DropdownconvidadosListModel dropdownconvidadosListModel;
  // Model for DropdownusersList component.
  late DropdownusersListModel dropdownusersListModel;
  // State field(s) for TabBarEmpresa widget.
  TabController? tabBarEmpresaController;
  int get tabBarEmpresaCurrentIndex =>
      tabBarEmpresaController != null ? tabBarEmpresaController!.index : 0;

  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel1;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel2;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel3;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel4;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel5;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel6;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel7;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel8;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel9;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel10;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel11;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel12;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel13;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel14;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel15;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel16;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    topNavEmpresaModel = createModel(context, () => TopNavEmpresaModel());
    dropdownconvidadosListModel =
        createModel(context, () => DropdownconvidadosListModel());
    dropdownusersListModel =
        createModel(context, () => DropdownusersListModel());
    listViewSearchModel1 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel2 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel3 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel4 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel5 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel6 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel7 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel8 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel9 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel10 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel11 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel12 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel13 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel14 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel15 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel16 = createModel(context, () => ListViewSearchModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    expandableController1.dispose();
    expandableController2.dispose();
    expandableController3.dispose();
    expandableController4.dispose();
    expandableController5.dispose();
    topNavEmpresaModel.dispose();
    nomeCompletoFocusNode?.dispose();
    nomeCompletoController?.dispose();

    apelidoFocusNode?.dispose();
    apelidoController?.dispose();

    celularFocusNode?.dispose();
    celularController?.dispose();

    cpfFocusNode?.dispose();
    cpfController?.dispose();

    bioFocusNode?.dispose();
    bioController?.dispose();

    datadeNascimentoFocusNode?.dispose();
    datadeNascimentoController?.dispose();

    textFieldFocusNode1?.dispose();
    textController7?.dispose();

    textFieldFocusNode2?.dispose();
    textController8?.dispose();

    textFieldFocusNode3?.dispose();
    textController9?.dispose();

    textFieldFocusNode4?.dispose();
    textController10?.dispose();

    dropdownconvidadosListModel.dispose();
    dropdownusersListModel.dispose();
    tabBarEmpresaController?.dispose();
    listViewSearchModel1.dispose();
    listViewSearchModel2.dispose();
    listViewSearchModel3.dispose();
    listViewSearchModel4.dispose();
    listViewSearchModel5.dispose();
    listViewSearchModel6.dispose();
    listViewSearchModel7.dispose();
    listViewSearchModel8.dispose();
    listViewSearchModel9.dispose();
    listViewSearchModel10.dispose();
    listViewSearchModel11.dispose();
    listViewSearchModel12.dispose();
    listViewSearchModel13.dispose();
    listViewSearchModel14.dispose();
    listViewSearchModel15.dispose();
    listViewSearchModel16.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
