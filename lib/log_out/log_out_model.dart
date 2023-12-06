import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'log_out_widget.dart' show LogOutWidget;
import 'package:flutter/material.dart';

class LogOutModel extends FlutterFlowModel<LogOutWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? userResult;

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
