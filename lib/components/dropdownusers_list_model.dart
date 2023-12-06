import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dropdownusers_list_widget.dart' show DropdownusersListWidget;
import 'package:flutter/material.dart';

class DropdownusersListModel extends FlutterFlowModel<DropdownusersListWidget> {
  ///  Local state fields for this component.

  bool adicionar = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in DropdownusersList widget.
  UsersRecord? userEmpresa;
  // Stores action output result for [Firestore Query - Query a collection] action in DropdownusersList widget.
  UsersRecord? userUsuarioEmpresa;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
