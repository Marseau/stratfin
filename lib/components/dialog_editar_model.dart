import '/flutter_flow/flutter_flow_util.dart';
import 'dialog_editar_widget.dart' show DialogEditarWidget;
import 'package:flutter/material.dart';

class DialogEditarModel extends FlutterFlowModel<DialogEditarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for NomeEdicao widget.
  FocusNode? nomeEdicaoFocusNode;
  TextEditingController? nomeEdicaoController;
  String? Function(BuildContext, String?)? nomeEdicaoControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeEdicaoFocusNode?.dispose();
    nomeEdicaoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
