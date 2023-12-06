import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dropdownconvidados_list_widget.dart' show DropdownconvidadosListWidget;
import 'package:flutter/material.dart';

class DropdownconvidadosListModel
    extends FlutterFlowModel<DropdownconvidadosListWidget> {
  ///  Local state fields for this component.

  bool adicionar = true;

  DocumentReference? userDocRef;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in DropdownconvidadosList widget.
  UsersRecord? userDoc;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
