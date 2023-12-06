import '/flutter_flow/flutter_flow_util.dart';
import 'passagem_widget.dart' show PassagemWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PassagemModel extends FlutterFlowModel<PassagemWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextCNPJ widget.
  FocusNode? textCNPJFocusNode;
  TextEditingController? textCNPJController;
  final textCNPJMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? textCNPJControllerValidator;
  // State field(s) for resetepassword widget.
  FocusNode? resetepasswordFocusNode;
  TextEditingController? resetepasswordController;
  String? Function(BuildContext, String?)? resetepasswordControllerValidator;
  // State field(s) for TextFieldCPF widget.
  FocusNode? textFieldCPFFocusNode;
  TextEditingController? textFieldCPFController;
  final textFieldCPFMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? textFieldCPFControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textCNPJFocusNode?.dispose();
    textCNPJController?.dispose();

    resetepasswordFocusNode?.dispose();
    resetepasswordController?.dispose();

    textFieldCPFFocusNode?.dispose();
    textFieldCPFController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
