import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'base1_widget.dart' show Base1Widget;
import 'package:flutter/material.dart';

class Base1Model extends FlutterFlowModel<Base1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for email widget.
  FocusNode? emailFocusNode1;
  TextEditingController? emailController1;
  String? Function(BuildContext, String?)? emailController1Validator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode2;
  TextEditingController? emailController2;
  late bool emailVisibility;
  String? Function(BuildContext, String?)? emailController2Validator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode3;
  TextEditingController? emailController3;
  String? Function(BuildContext, String?)? emailController3Validator;
  // State field(s) for Senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaControllerValidator;
  // State field(s) for repetirSenha widget.
  FocusNode? repetirSenhaFocusNode;
  TextEditingController? repetirSenhaController;
  late bool repetirSenhaVisibility;
  String? Function(BuildContext, String?)? repetirSenhaControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    emailVisibility = false;
    senhaVisibility = false;
    repetirSenhaVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailFocusNode1?.dispose();
    emailController1?.dispose();

    emailFocusNode2?.dispose();
    emailController2?.dispose();

    emailFocusNode3?.dispose();
    emailController3?.dispose();

    senhaFocusNode?.dispose();
    senhaController?.dispose();

    repetirSenhaFocusNode?.dispose();
    repetirSenhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
