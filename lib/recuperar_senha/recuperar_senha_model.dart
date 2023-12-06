import '/flutter_flow/flutter_flow_util.dart';
import 'recuperar_senha_widget.dart' show RecuperarSenhaWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RecuperarSenhaModel extends FlutterFlowModel<RecuperarSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for resetepassword widget.
  FocusNode? resetepasswordFocusNode;
  TextEditingController? resetepasswordController;
  String? Function(BuildContext, String?)? resetepasswordControllerValidator;
  // State field(s) for TextCNPJ widget.
  FocusNode? textCNPJFocusNode;
  TextEditingController? textCNPJController;
  final textCNPJMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? textCNPJControllerValidator;
  // State field(s) for TextFieldCPF widget.
  FocusNode? textFieldCPFFocusNode;
  TextEditingController? textFieldCPFController;
  final textFieldCPFMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? textFieldCPFControllerValidator;
  // Stores action output result for [Custom Action - getDocumentCount] action in EnvieLink widget.
  int? emailValidation;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    resetepasswordFocusNode?.dispose();
    resetepasswordController?.dispose();

    textCNPJFocusNode?.dispose();
    textCNPJController?.dispose();

    textFieldCPFFocusNode?.dispose();
    textFieldCPFController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
