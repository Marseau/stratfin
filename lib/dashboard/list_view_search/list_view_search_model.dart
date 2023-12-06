import '/flutter_flow/flutter_flow_util.dart';
import 'list_view_search_widget.dart' show ListViewSearchWidget;
import 'package:flutter/material.dart';

class ListViewSearchModel extends FlutterFlowModel<ListViewSearchWidget> {
  ///  Local state fields for this component.

  int? listItem;

  String? listName = '';

  List<String> newData = [];
  void addToNewData(String item) => newData.add(item);
  void removeFromNewData(String item) => newData.remove(item);
  void removeAtIndexFromNewData(int index) => newData.removeAt(index);
  void insertAtIndexInNewData(int index, String item) =>
      newData.insert(index, item);
  void updateNewDataAtIndex(int index, Function(String) updateFn) =>
      newData[index] = updateFn(newData[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for SearchFor0 widget.
  FocusNode? searchFor0FocusNode;
  TextEditingController? searchFor0Controller;
  String? Function(BuildContext, String?)? searchFor0ControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFor0FocusNode?.dispose();
    searchFor0Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
