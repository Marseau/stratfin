import '/flutter_flow/flutter_flow_util.dart';
import 'testes_empresa_widget.dart' show TestesEmpresaWidget;
import 'package:flutter/material.dart';

class TestesEmpresaModel extends FlutterFlowModel<TestesEmpresaWidget> {
  ///  Local state fields for this page.

  int? age;

  DateTime? date;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
