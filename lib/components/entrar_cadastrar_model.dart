import '/backend/backend.dart';
import '/components/login_midia_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'entrar_cadastrar_widget.dart' show EntrarCadastrarWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EntrarCadastrarModel extends FlutterFlowModel<EntrarCadastrarWidget> {
  ///  Local state fields for this component.

  bool ready = false;

  bool emailcpfcnpj = false;

  bool emailready = false;

  bool cpfcnpjready = false;

  bool passwordready = false;

  DocumentReference? docRefUser;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailentrar widget.
  FocusNode? emailentrarFocusNode;
  TextEditingController? emailentrarController;
  String? Function(BuildContext, String?)? emailentrarControllerValidator;
  // Stores action output result for [Custom Action - validateEmailA] action in emailentrar widget.
  bool? emailEntrarResult;
  // Stores action output result for [Custom Action - getDocumentCount] action in emailentrar widget.
  int? emailentrarexist;
  // Stores action output result for [Firestore Query - Query a collection] action in emailentrar widget.
  UsersRecord? userEntrando;
  // State field(s) for docentrarCNPJ widget.
  FocusNode? docentrarCNPJFocusNode;
  TextEditingController? docentrarCNPJController;
  final docentrarCNPJMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? docentrarCNPJControllerValidator;
  // Stores action output result for [Custom Action - verifyCPFOrCNPJ] action in docentrarCNPJ widget.
  String? docEntryResultCNPJ;
  // Stores action output result for [Custom Action - checkDocumentExists2fields] action in docentrarCNPJ widget.
  bool? docResultExist;
  // State field(s) for passwordentrar widget.
  FocusNode? passwordentrarFocusNode;
  TextEditingController? passwordentrarController;
  late bool passwordentrarVisibility;
  String? Function(BuildContext, String?)? passwordentrarControllerValidator;
  // Model for LoginMidia component.
  late LoginMidiaModel loginMidiaModel;
  // State field(s) for emailcadastrar widget.
  FocusNode? emailcadastrarFocusNode;
  TextEditingController? emailcadastrarController;
  String? Function(BuildContext, String?)? emailcadastrarControllerValidator;
  // Stores action output result for [Custom Action - validateEmailA] action in emailcadastrar widget.
  bool? emailCadastrarResult;
  // Stores action output result for [Custom Action - getDocumentCount] action in emailcadastrar widget.
  int? emailCadastrarexist;
  // State field(s) for doccadastrarCNPJ widget.
  FocusNode? doccadastrarCNPJFocusNode;
  TextEditingController? doccadastrarCNPJController;
  final doccadastrarCNPJMask =
      MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? doccadastrarCNPJControllerValidator;
  // Stores action output result for [Custom Action - verifyCPFOrCNPJ] action in doccadastrarCNPJ widget.
  String? docCNPJEntryResult;
  // Stores action output result for [Custom Action - getDocumentCount] action in doccadastrarCNPJ widget.
  int? docCNPJResultExist;
  // State field(s) for passwordcadastrar widget.
  FocusNode? passwordcadastrarFocusNode;
  TextEditingController? passwordcadastrarController;
  late bool passwordcadastrarVisibility;
  String? Function(BuildContext, String?)? passwordcadastrarControllerValidator;
  // State field(s) for passwordrepetircadastrar widget.
  FocusNode? passwordrepetircadastrarFocusNode;
  TextEditingController? passwordrepetircadastrarController;
  late bool passwordrepetircadastrarVisibility;
  String? Function(BuildContext, String?)?
      passwordrepetircadastrarControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordentrarVisibility = false;
    loginMidiaModel = createModel(context, () => LoginMidiaModel());
    passwordcadastrarVisibility = false;
    passwordrepetircadastrarVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailentrarFocusNode?.dispose();
    emailentrarController?.dispose();

    docentrarCNPJFocusNode?.dispose();
    docentrarCNPJController?.dispose();

    passwordentrarFocusNode?.dispose();
    passwordentrarController?.dispose();

    loginMidiaModel.dispose();
    emailcadastrarFocusNode?.dispose();
    emailcadastrarController?.dispose();

    doccadastrarCNPJFocusNode?.dispose();
    doccadastrarCNPJController?.dispose();

    passwordcadastrarFocusNode?.dispose();
    passwordcadastrarController?.dispose();

    passwordrepetircadastrarFocusNode?.dispose();
    passwordrepetircadastrarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
