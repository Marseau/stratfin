import '/flutter_flow/flutter_flow_util.dart';
import 'bottom_editar_widget.dart' show BottomEditarWidget;
import 'package:flutter/material.dart';

class BottomEditarModel extends FlutterFlowModel<BottomEditarWidget> {
  ///  Local state fields for this component.

  String descricao = 'Default';

  ///  State fields for stateful widgets in this component.

  // State field(s) for Titulo widget.
  FocusNode? tituloFocusNode1;
  TextEditingController? tituloController1;
  String? Function(BuildContext, String?)? tituloController1Validator;
  // State field(s) for Descricao widget.
  FocusNode? descricaoFocusNode1;
  TextEditingController? descricaoController1;
  String? Function(BuildContext, String?)? descricaoController1Validator;
  // State field(s) for Titulo widget.
  FocusNode? tituloFocusNode2;
  TextEditingController? tituloController2;
  String? Function(BuildContext, String?)? tituloController2Validator;
  // State field(s) for Descricao widget.
  FocusNode? descricaoFocusNode2;
  TextEditingController? descricaoController2;
  String? Function(BuildContext, String?)? descricaoController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tituloFocusNode1?.dispose();
    tituloController1?.dispose();

    descricaoFocusNode1?.dispose();
    descricaoController1?.dispose();

    tituloFocusNode2?.dispose();
    tituloController2?.dispose();

    descricaoFocusNode2?.dispose();
    descricaoController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
