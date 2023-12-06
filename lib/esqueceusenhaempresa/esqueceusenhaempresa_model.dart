import '/components/passagem_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'esqueceusenhaempresa_widget.dart' show EsqueceusenhaempresaWidget;
import 'package:flutter/material.dart';

class EsqueceusenhaempresaModel
    extends FlutterFlowModel<EsqueceusenhaempresaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Passagem component.
  late PassagemModel passagemModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passagemModel = createModel(context, () => PassagemModel());
  }

  @override
  void dispose() {
    passagemModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
