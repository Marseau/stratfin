import '/components/entrar_cadastrar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Entrar_Cadastrar component.
  late EntrarCadastrarModel entrarCadastrarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    entrarCadastrarModel = createModel(context, () => EntrarCadastrarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    entrarCadastrarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
