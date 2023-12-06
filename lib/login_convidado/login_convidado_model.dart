import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_convidado_widget.dart' show LoginConvidadoWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginConvidadoModel extends FlutterFlowModel<LoginConvidadoWidget> {
  ///  Local state fields for this page.

  DocumentReference? docRefEmissor;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailConvidado widget.
  FocusNode? emailConvidadoFocusNode1;
  TextEditingController? emailConvidadoController1;
  String? Function(BuildContext, String?)? emailConvidadoController1Validator;
  // State field(s) for EmailConvidado widget.
  FocusNode? emailConvidadoFocusNode2;
  TextEditingController? emailConvidadoController2;
  String? Function(BuildContext, String?)? emailConvidadoController2Validator;
  // State field(s) for CNPJConvidado widget.
  FocusNode? cNPJConvidadoFocusNode;
  TextEditingController? cNPJConvidadoController;
  final cNPJConvidadoMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? cNPJConvidadoControllerValidator;
  // State field(s) for CPFConvidado widget.
  FocusNode? cPFConvidadoFocusNode;
  TextEditingController? cPFConvidadoController;
  final cPFConvidadoMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cPFConvidadoControllerValidator;
  String? _cPFConvidadoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // Stores action output result for [Custom Action - verifyCPFOrCNPJ] action in CPFConvidado widget.
  String? cpfResult;
  // State field(s) for SenhaConvidado widget.
  FocusNode? senhaConvidadoFocusNode;
  TextEditingController? senhaConvidadoController;
  late bool senhaConvidadoVisibility;
  String? Function(BuildContext, String?)? senhaConvidadoControllerValidator;
  // State field(s) for repetirSenhaConvidado widget.
  FocusNode? repetirSenhaConvidadoFocusNode;
  TextEditingController? repetirSenhaConvidadoController;
  late bool repetirSenhaConvidadoVisibility;
  String? Function(BuildContext, String?)?
      repetirSenhaConvidadoControllerValidator;
  String? _repetirSenhaConvidadoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // Stores action output result for [Custom Action - getDocumentCount] action in ButtonCadastroConvidado widget.
  int? countConvidadoUsersResult;
  // Stores action output result for [Firestore Query - Query a collection] action in ButtonCadastroConvidado widget.
  UsersRecord? userResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    cPFConvidadoControllerValidator = _cPFConvidadoControllerValidator;
    senhaConvidadoVisibility = false;
    repetirSenhaConvidadoVisibility = false;
    repetirSenhaConvidadoControllerValidator =
        _repetirSenhaConvidadoControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailConvidadoFocusNode1?.dispose();
    emailConvidadoController1?.dispose();

    emailConvidadoFocusNode2?.dispose();
    emailConvidadoController2?.dispose();

    cNPJConvidadoFocusNode?.dispose();
    cNPJConvidadoController?.dispose();

    cPFConvidadoFocusNode?.dispose();
    cPFConvidadoController?.dispose();

    senhaConvidadoFocusNode?.dispose();
    senhaConvidadoController?.dispose();

    repetirSenhaConvidadoFocusNode?.dispose();
    repetirSenhaConvidadoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
