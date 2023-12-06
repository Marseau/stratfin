import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'bottom_exp_widget.dart' show BottomExpWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BottomExpModel extends FlutterFlowModel<BottomExpWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeController;
  String? Function(BuildContext, String?)? nomeControllerValidator;
  // State field(s) for Celular widget.
  FocusNode? celularFocusNode;
  TextEditingController? celularController;
  final celularMask = MaskTextInputFormatter(mask: '+55(##)#####-####');
  String? Function(BuildContext, String?)? celularControllerValidator;
  // State field(s) for DatadeNascimento widget.
  FocusNode? datadeNascimentoFocusNode;
  TextEditingController? datadeNascimentoController;
  final datadeNascimentoMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? datadeNascimentoControllerValidator;
  // State field(s) for CPF widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfController;
  String? Function(BuildContext, String?)? cpfControllerValidator;
  // State field(s) for Perfil widget.
  FocusNode? perfilFocusNode;
  TextEditingController? perfilController;
  String? Function(BuildContext, String?)? perfilControllerValidator;
  // State field(s) for DropDownPerfil widget.
  String? dropDownPerfilValue;
  FormFieldController<String>? dropDownPerfilValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeController?.dispose();

    celularFocusNode?.dispose();
    celularController?.dispose();

    datadeNascimentoFocusNode?.dispose();
    datadeNascimentoController?.dispose();

    cpfFocusNode?.dispose();
    cpfController?.dispose();

    perfilFocusNode?.dispose();
    perfilController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
