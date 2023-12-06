import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'testes_usuario_widget.dart' show TestesUsuarioWidget;
import 'package:flutter/material.dart';

class TestesUsuarioModel extends FlutterFlowModel<TestesUsuarioWidget> {
  ///  Local state fields for this page.

  int? age;

  DateTime? date;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in TestesUsuario widget.
  UsersRecord? preparo;
  // Stores action output result for [Firestore Query - Query a collection] action in TestesUsuario widget.
  List<UsersRecord>? usuarioEmpresa;

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
