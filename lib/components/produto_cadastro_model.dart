import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'produto_cadastro_widget.dart' show ProdutoCadastroWidget;
import 'package:flutter/material.dart';

class ProdutoCadastroModel extends FlutterFlowModel<ProdutoCadastroWidget> {
  ///  Local state fields for this component.

  bool produtoState = false;

  String acaoStatus = 'Cadastrar';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in ProdutoCadastro widget.
  ProdutoRecord? produtoEditarQuery;
  // State field(s) for produtoNome widget.
  FocusNode? produtoNomeFocusNode;
  TextEditingController? produtoNomeController;
  String? Function(BuildContext, String?)? produtoNomeControllerValidator;
  // Stores action output result for [Custom Action - checkDocumentExists2fields] action in produtoNome widget.
  bool? produtExist;
  // Stores action output result for [Custom Action - checkDocumentExists2fields] action in produtoNome widget.
  bool? prodExistFalse;
  // State field(s) for tipoProduto widget.
  FocusNode? tipoProdutoFocusNode;
  TextEditingController? tipoProdutoController;
  String? Function(BuildContext, String?)? tipoProdutoControllerValidator;
  String? _tipoProdutoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for caracteristicasProduto widget.
  FocusNode? caracteristicasProdutoFocusNode;
  TextEditingController? caracteristicasProdutoController;
  String? Function(BuildContext, String?)?
      caracteristicasProdutoControllerValidator;
  String? _caracteristicasProdutoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for restricoesElegibilidadeProduto widget.
  FocusNode? restricoesElegibilidadeProdutoFocusNode;
  TextEditingController? restricoesElegibilidadeProdutoController;
  String? Function(BuildContext, String?)?
      restricoesElegibilidadeProdutoControllerValidator;
  // State field(s) for tarifasCustosAdicionaisProduto widget.
  FocusNode? tarifasCustosAdicionaisProdutoFocusNode;
  TextEditingController? tarifasCustosAdicionaisProdutoController;
  String? Function(BuildContext, String?)?
      tarifasCustosAdicionaisProdutoControllerValidator;
  // Stores action output result for [Custom Action - createDocumentWithUid] action in ButtonCadastrarProduto widget.
  DocumentReference? docRefProduto;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    tipoProdutoControllerValidator = _tipoProdutoControllerValidator;
    caracteristicasProdutoControllerValidator =
        _caracteristicasProdutoControllerValidator;
  }

  @override
  void dispose() {
    produtoNomeFocusNode?.dispose();
    produtoNomeController?.dispose();

    tipoProdutoFocusNode?.dispose();
    tipoProdutoController?.dispose();

    caracteristicasProdutoFocusNode?.dispose();
    caracteristicasProdutoController?.dispose();

    restricoesElegibilidadeProdutoFocusNode?.dispose();
    restricoesElegibilidadeProdutoController?.dispose();

    tarifasCustosAdicionaisProdutoFocusNode?.dispose();
    tarifasCustosAdicionaisProdutoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
