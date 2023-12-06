import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'convidar_widget.dart' show ConvidarWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ConvidarModel extends FlutterFlowModel<ConvidarWidget> {
  ///  Local state fields for this component.

  DocumentReference? docStateConvidados;

  int? docResult = 5;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailNewCadastro widget.
  FocusNode? emailNewCadastroFocusNode;
  TextEditingController? emailNewCadastroController;
  String? Function(BuildContext, String?)? emailNewCadastroControllerValidator;
  String? _emailNewCadastroControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Custom Action - validateEmailA] action in emailNewCadastro widget.
  bool? emailNewCadastroResult;
  // Stores action output result for [Custom Action - getDocumentCount] action in emailNewCadastro widget.
  int? emailNewCadastro;
  // Stores action output result for [Custom Action - getDocumentCount] action in emailNewCadastro widget.
  int? emailNewCadastroConvidadosResult;
  // Stores action output result for [Firestore Query - Query a collection] action in emailNewCadastro widget.
  ConvidadosRecord? docConvidados;
  // State field(s) for nomecompletoNewCadastro widget.
  FocusNode? nomecompletoNewCadastroFocusNode;
  TextEditingController? nomecompletoNewCadastroController;
  String? Function(BuildContext, String?)?
      nomecompletoNewCadastroControllerValidator;
  String? _nomecompletoNewCadastroControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    return null;
  }

  // State field(s) for razaoSocialNewCadastro widget.
  FocusNode? razaoSocialNewCadastroFocusNode;
  TextEditingController? razaoSocialNewCadastroController;
  String? Function(BuildContext, String?)?
      razaoSocialNewCadastroControllerValidator;
  String? _razaoSocialNewCadastroControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    return null;
  }

  // State field(s) for CPFNewCadastro widget.
  FocusNode? cPFNewCadastroFocusNode;
  TextEditingController? cPFNewCadastroController;
  final cPFNewCadastroMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cPFNewCadastroControllerValidator;
  String? _cPFNewCadastroControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    return null;
  }

  // Stores action output result for [Custom Action - verifyCPFOrCNPJ] action in CPFNewCadastro widget.
  String? validCpfResult;
  // State field(s) for CNPJNewCadastro widget.
  FocusNode? cNPJNewCadastroFocusNode;
  TextEditingController? cNPJNewCadastroController;
  final cNPJNewCadastroMask =
      MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? cNPJNewCadastroControllerValidator;
  String? _cNPJNewCadastroControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    return null;
  }

  // Stores action output result for [Custom Action - verifyCPFOrCNPJ] action in CNPJNewCadastro widget.
  String? validCnpjResult;
  // State field(s) for DropDownuserUserCadastro widget.
  String? dropDownuserUserCadastroValue;
  FormFieldController<String>? dropDownuserUserCadastroValueController;
  // Stores action output result for [Custom Action - getDocumentCount] action in ButtonUserConvidar widget.
  int? newConvidadoResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    emailNewCadastroControllerValidator = _emailNewCadastroControllerValidator;
    nomecompletoNewCadastroControllerValidator =
        _nomecompletoNewCadastroControllerValidator;
    razaoSocialNewCadastroControllerValidator =
        _razaoSocialNewCadastroControllerValidator;
    cPFNewCadastroControllerValidator = _cPFNewCadastroControllerValidator;
    cNPJNewCadastroControllerValidator = _cNPJNewCadastroControllerValidator;
  }

  @override
  void dispose() {
    emailNewCadastroFocusNode?.dispose();
    emailNewCadastroController?.dispose();

    nomecompletoNewCadastroFocusNode?.dispose();
    nomecompletoNewCadastroController?.dispose();

    razaoSocialNewCadastroFocusNode?.dispose();
    razaoSocialNewCadastroController?.dispose();

    cPFNewCadastroFocusNode?.dispose();
    cPFNewCadastroController?.dispose();

    cNPJNewCadastroFocusNode?.dispose();
    cNPJNewCadastroController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
