import '/backend/backend.dart';
import '/components/container_limpo01_widget.dart';
import '/components/container_limpo_widget.dart';
import '/components/dropdown_produto_widget.dart';
import '/components/dropdownconvidados_list_widget.dart';
import '/components/dropdownusers_list_widget.dart';
import '/dashboard/list_view_search/list_view_search_widget.dart';
import '/dashboard/top_nav_empresa/top_nav_empresa_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  bool tabbarempresa = false;

  String? uiduser = '';

  bool perfil = true;

  int activetab = 0;

  String? activetabNome = '';

  bool basicas = false;

  bool usuarios = false;

  bool advisor = false;

  bool produtoTipo = false;

  bool produtoCampanha = false;

  DocumentReference? docUserRef;

  bool produtoTipoCont = false;

  bool produtoCampanhaCont = false;

  bool tabbarproduto = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in ContainerMenu widget.
  UsersRecord? empresaVinculante;
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

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  final textFieldMask3 = MaskTextInputFormatter(mask: '+55 (##) ####-####');
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // Model for DropdownconvidadosList component.
  late DropdownconvidadosListModel dropdownconvidadosListModel1;
  // Model for DropdownusersList component.
  late DropdownusersListModel dropdownusersListModel1;
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
  // Model for DropdownAdvisorList.
  late ContainerLimpo01Model dropdownAdvisorListModel;
  // Model for ContainerLimpo component.
  late ContainerLimpoModel containerLimpoModel;
  // Model for DropdownProduto component.
  late DropdownProdutoModel dropdownProdutoModel;
  // Model for DropdownconvidadosList component.
  late DropdownconvidadosListModel dropdownconvidadosListModel2;
  // Model for DropdownusersList component.
  late DropdownusersListModel dropdownusersListModel2;
  // State field(s) for TabBarProduto widget.
  TabController? tabBarProdutoController;
  int get tabBarProdutoCurrentIndex =>
      tabBarProdutoController != null ? tabBarProdutoController!.index : 0;

  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel17;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel18;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel19;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel20;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel21;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel22;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel23;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel24;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel25;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel26;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel27;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel28;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel29;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel30;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel31;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel32;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel33;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel34;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel35;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel36;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel37;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel38;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel39;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel40;
  // Model for listViewSearch component.
  late ListViewSearchModel listViewSearchModel41;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    topNavEmpresaModel = createModel(context, () => TopNavEmpresaModel());
    dropdownconvidadosListModel1 =
        createModel(context, () => DropdownconvidadosListModel());
    dropdownusersListModel1 =
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
    dropdownAdvisorListModel =
        createModel(context, () => ContainerLimpo01Model());
    containerLimpoModel = createModel(context, () => ContainerLimpoModel());
    dropdownProdutoModel = createModel(context, () => DropdownProdutoModel());
    dropdownconvidadosListModel2 =
        createModel(context, () => DropdownconvidadosListModel());
    dropdownusersListModel2 =
        createModel(context, () => DropdownusersListModel());
    listViewSearchModel17 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel18 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel19 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel20 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel21 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel22 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel23 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel24 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel25 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel26 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel27 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel28 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel29 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel30 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel31 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel32 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel33 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel34 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel35 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel36 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel37 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel38 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel39 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel40 = createModel(context, () => ListViewSearchModel());
    listViewSearchModel41 = createModel(context, () => ListViewSearchModel());
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
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    dropdownconvidadosListModel1.dispose();
    dropdownusersListModel1.dispose();
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
    dropdownAdvisorListModel.dispose();
    containerLimpoModel.dispose();
    dropdownProdutoModel.dispose();
    dropdownconvidadosListModel2.dispose();
    dropdownusersListModel2.dispose();
    tabBarProdutoController?.dispose();
    listViewSearchModel17.dispose();
    listViewSearchModel18.dispose();
    listViewSearchModel19.dispose();
    listViewSearchModel20.dispose();
    listViewSearchModel21.dispose();
    listViewSearchModel22.dispose();
    listViewSearchModel23.dispose();
    listViewSearchModel24.dispose();
    listViewSearchModel25.dispose();
    listViewSearchModel26.dispose();
    listViewSearchModel27.dispose();
    listViewSearchModel28.dispose();
    listViewSearchModel29.dispose();
    listViewSearchModel30.dispose();
    listViewSearchModel31.dispose();
    listViewSearchModel32.dispose();
    listViewSearchModel33.dispose();
    listViewSearchModel34.dispose();
    listViewSearchModel35.dispose();
    listViewSearchModel36.dispose();
    listViewSearchModel37.dispose();
    listViewSearchModel38.dispose();
    listViewSearchModel39.dispose();
    listViewSearchModel40.dispose();
    listViewSearchModel41.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
