import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'produto_cadastro_model.dart';
export 'produto_cadastro_model.dart';

class ProdutoCadastroWidget extends StatefulWidget {
  const ProdutoCadastroWidget({
    super.key,
    required this.acaoStatus,
  });

  final String? acaoStatus;

  @override
  _ProdutoCadastroWidgetState createState() => _ProdutoCadastroWidgetState();
}

class _ProdutoCadastroWidgetState extends State<ProdutoCadastroWidget> {
  late ProdutoCadastroModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProdutoCadastroModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.acaoStatus = widget.acaoStatus!;
      });
      if (widget.acaoStatus == 'Editar') {
        _model.produtoEditarQuery = await queryProdutoRecordOnce(
          queryBuilder: (produtoRecord) => produtoRecord.where(
            'uid',
            isEqualTo: FFAppState().docRefProduto?.id,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text(FFAppState().docRefProduto!.id),
              content: Text(_model.produtoEditarQuery!.reference.id),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
        return;
      } else {
        return;
      }
    });

    _model.produtoNomeFocusNode ??= FocusNode();

    _model.tipoProdutoFocusNode ??= FocusNode();

    _model.caracteristicasProdutoFocusNode ??= FocusNode();

    _model.restricoesElegibilidadeProdutoFocusNode ??= FocusNode();

    _model.tarifasCustosAdicionaisProdutoFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.00, 0.00),
            child: StreamBuilder<ProdutoRecord>(
              stream: ProdutoRecord.getDocument(FFAppState().docRefProduto!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                final containerProdutoRecord = snapshot.data!;
                return Container(
                  width: 340.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(1.00, 0.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 16.0, 0.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (widget.acaoStatus == 'Cadastrar')
                                  Text(
                                    'Cadastrar Produto',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                if (widget.acaoStatus == 'Editar')
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Editar/Excluir Produto',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                Align(
                                  alignment: const AlignmentDirectional(1.00, 0.00),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 16.0, 8.0),
                                    child: FlutterFlowIconButton(
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          _model.produtoNomeController?.clear();
                                          _model.tipoProdutoController?.clear();
                                          _model
                                              .caracteristicasProdutoController
                                              ?.clear();
                                          _model
                                              .restricoesElegibilidadeProdutoController
                                              ?.clear();
                                          _model
                                              .tarifasCustosAdicionaisProdutoController
                                              ?.clear();
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.produtoNomeController ??=
                                              TextEditingController(
                                        text: widget.acaoStatus == 'Editar'
                                            ? containerProdutoRecord.nomeProduto
                                            : null,
                                      ),
                                      focusNode: _model.produtoNomeFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.produtoNomeController',
                                        const Duration(milliseconds: 2000),
                                        () async {
                                          var shouldSetState = false;
                                          if (widget.acaoStatus == 'Editar') {
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          }

                                          if (_model.produtoNomeController
                                                      .text !=
                                                  '') {
                                            _model.produtExist = await actions
                                                .checkDocumentExists2fields(
                                              'Produto',
                                              'Nome_produto',
                                              _model.produtoNomeController.text,
                                              null,
                                              null,
                                              'user_produto',
                                              FFAppState().docRefUsers,
                                              null,
                                              null,
                                            );
                                            shouldSetState = true;
                                            if (_model.produtExist == false) {
                                              setState(() {
                                                _model.produtoState = false;
                                              });
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Número de Docs em Produto'),
                                                    content: const Text('0'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: const Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                              return;
                                            } else {
                                              _model.prodExistFalse =
                                                  await actions
                                                      .checkDocumentExists2fields(
                                                'Produto',
                                                'Nome_produto',
                                                _model
                                                    .produtoNomeController.text,
                                                null,
                                                null,
                                                'user_produto',
                                                FFAppState().docRefUsers,
                                                'status',
                                                false,
                                              );
                                              shouldSetState = true;
                                              if (_model.prodExistFalse ==
                                                  true) {
                                                setState(() {
                                                  _model.produtoState = false;
                                                });
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'Produto já cadastrado mas eliminado!'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: const Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                if (shouldSetState) {
                                                  setState(() {});
                                                }
                                                return;
                                              } else {
                                                setState(() {
                                                  _model.produtoState = true;
                                                });
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'Produto já cadastrado'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: const Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                Navigator.pop(context);
                                                if (shouldSetState) {
                                                  setState(() {});
                                                }
                                                return;
                                              }
                                            }
                                          } else {
                                            setState(() {
                                              _model.produtoState = true;
                                            });
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Produto não preenchido!'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          }

                                          if (shouldSetState) setState(() {});
                                        },
                                      ),
                                      readOnly: widget.acaoStatus == 'Editar',
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Nome*',
                                        labelStyle: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14.0,
                                        ),
                                        hintText: 'Digite o nome do produto',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _model.produtoState
                                                ? FlutterFlowTheme.of(context)
                                                    .error
                                                : FlutterFlowTheme.of(context)
                                                    .success,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                FFAppState().ColorPrimaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                16.0, 24.0, 0.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w300,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                      textAlign: TextAlign.start,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      validator: _model
                                          .produtoNomeControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: SizedBox(
                                      width: 300.0,
                                      child: TextFormField(
                                        controller:
                                            _model.tipoProdutoController ??=
                                                TextEditingController(
                                          text: _model.acaoStatus == 'Editar'
                                              ? containerProdutoRecord
                                                  .tipoProduto
                                              : null,
                                        ),
                                        focusNode: _model.tipoProdutoFocusNode,
                                        readOnly: widget.acaoStatus == 'Editar',
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Tipo *',
                                          labelStyle: TextStyle(
                                            color: FFAppState()
                                                .ColorPrefereceSecondary,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14.0,
                                          ),
                                          alignLabelWithHint: true,
                                          hintText: 'Digite o tipo de produto',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FFAppState().ColorPrimaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 24.0, 0.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w300,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                        textAlign: TextAlign.start,
                                        maxLines: null,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        validator: _model
                                            .tipoProdutoControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: SizedBox(
                                      width: 300.0,
                                      child: TextFormField(
                                        controller: _model
                                                .caracteristicasProdutoController ??=
                                            TextEditingController(
                                          text: _model.acaoStatus == 'Editar'
                                              ? containerProdutoRecord
                                                  .caracteristicas
                                              : null,
                                        ),
                                        focusNode: _model
                                            .caracteristicasProdutoFocusNode,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Características*',
                                          labelStyle: TextStyle(
                                            color: FFAppState()
                                                .ColorPrefereceSecondary,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14.0,
                                          ),
                                          alignLabelWithHint: true,
                                          hintText:
                                              'Digite as principais características do produto',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FFAppState().ColorPrimaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 24.0, 0.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w300,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                        textAlign: TextAlign.start,
                                        maxLines: 4,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        validator: _model
                                            .caracteristicasProdutoControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: SizedBox(
                                      width: 300.0,
                                      child: TextFormField(
                                        controller: _model
                                                .restricoesElegibilidadeProdutoController ??=
                                            TextEditingController(
                                          text: _model.acaoStatus == 'Editar'
                                              ? containerProdutoRecord
                                                  .restricoesElegibilidade
                                              : null,
                                        ),
                                        focusNode: _model
                                            .restricoesElegibilidadeProdutoFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.restricoesElegibilidadeProdutoController',
                                          const Duration(milliseconds: 2000),
                                          () => setState(() {}),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Restrições/Elegibilidade',
                                          labelStyle: TextStyle(
                                            color: FFAppState()
                                                .ColorPrefereceSecondary,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14.0,
                                          ),
                                          alignLabelWithHint: true,
                                          hintText:
                                              'Digite  restrições e/ou elegibilidade do produto',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FFAppState().ColorPrimaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 24.0, 0.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w300,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                        textAlign: TextAlign.start,
                                        maxLines: 3,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        validator: _model
                                            .restricoesElegibilidadeProdutoControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: SizedBox(
                                      width: 300.0,
                                      child: TextFormField(
                                        controller: _model
                                                .tarifasCustosAdicionaisProdutoController ??=
                                            TextEditingController(
                                          text: _model.acaoStatus == 'Editar'
                                              ? containerProdutoRecord
                                                  .tarifasCustosadicionais
                                              : null,
                                        ),
                                        focusNode: _model
                                            .tarifasCustosAdicionaisProdutoFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.tarifasCustosAdicionaisProdutoController',
                                          const Duration(milliseconds: 2000),
                                          () => setState(() {}),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'tarifas/Custo s Adic.',
                                          labelStyle: TextStyle(
                                            color: FFAppState()
                                                .ColorPrefereceSecondary,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14.0,
                                          ),
                                          alignLabelWithHint: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FFAppState().ColorPrimaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 24.0, 0.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w300,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                        textAlign: TextAlign.start,
                                        maxLines: 3,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        validator: _model
                                            .tarifasCustosAdicionaisProdutoControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                if (widget.acaoStatus == 'Cadastrar')
                                  Align(
                                    alignment: const AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 8.0, 20.0, 16.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          _model.docRefProduto = await actions
                                              .createDocumentWithUid(
                                            'Produto',
                                            'Nome_produto',
                                            _model.produtoNomeController.text,
                                            'tipo_produto',
                                            _model.tipoProdutoController.text,
                                            'restricoes_elegibilidade',
                                            _model
                                                .restricoesElegibilidadeProdutoController
                                                .text,
                                          );

                                          await _model.docRefProduto!
                                              .update(createProdutoRecordData(
                                            tarifasCustosadicionais: _model
                                                .tarifasCustosAdicionaisProdutoController
                                                .text,
                                            caracteristicas: _model
                                                .caracteristicasProdutoController
                                                .text,
                                            status: true,
                                            userProduto:
                                                FFAppState().docRefUsers,
                                          ));
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text('Produto'),
                                                content: const Text(
                                                    'Cadastrado com Sucesso!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          setState(() {
                                            _model.produtoNomeController
                                                ?.clear();
                                            _model.tipoProdutoController
                                                ?.clear();
                                            _model
                                                .caracteristicasProdutoController
                                                ?.clear();
                                            _model
                                                .restricoesElegibilidadeProdutoController
                                                ?.clear();
                                            _model
                                                .tarifasCustosAdicionaisProdutoController
                                                ?.clear();
                                          });
                                          Navigator.pop(context);

                                          setState(() {});
                                        },
                                        text: 'Cadastrar ',
                                        options: FFButtonOptions(
                                          width: 300.0,
                                          height: 52.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0xFF00800F),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLargeFamily),
                                              ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Color(0xFF5F9845),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .asparagus,
                                        ),
                                      ),
                                    ),
                                  ),
                                if (widget.acaoStatus == 'Editar')
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 8.0, 20.0, 8.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }

                                              await containerProdutoRecord
                                                  .reference
                                                  .update(
                                                      createProdutoRecordData(
                                                caracteristicas: _model
                                                    .caracteristicasProdutoController
                                                    .text,
                                                restricoesElegibilidade: _model
                                                    .restricoesElegibilidadeProdutoController
                                                    .text,
                                                tarifasCustosadicionais: _model
                                                    .tarifasCustosAdicionaisProdutoController
                                                    .text,
                                              ));
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text('Produto'),
                                                    content: const Text(
                                                        'Atualizado com Sucesso!'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: const Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              setState(() {
                                                _model.produtoNomeController
                                                    ?.clear();
                                                _model.tipoProdutoController
                                                    ?.clear();
                                                _model
                                                    .caracteristicasProdutoController
                                                    ?.clear();
                                                _model
                                                    .restricoesElegibilidadeProdutoController
                                                    ?.clear();
                                                _model
                                                    .tarifasCustosAdicionaisProdutoController
                                                    ?.clear();
                                              });
                                              Navigator.pop(context);
                                            },
                                            text: 'Editar/Atualizar',
                                            options: FFButtonOptions(
                                              width: 300.0,
                                              height: 52.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFF00800F),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Color(0xFF5F9845),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              hoverColor:
                                                  FlutterFlowTheme.of(context)
                                                      .asparagus,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 8.0, 20.0, 16.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                'Tem certeza que quer excluir o Produto!'),
                                                            content: const Text(
                                                                'Está operação é definitiva!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: const Text(
                                                                    'Cancele'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: const Text(
                                                                    'Confirme'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                await containerProdutoRecord
                                                    .reference
                                                    .update(
                                                        createProdutoRecordData(
                                                  status: false,
                                                ));
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: const Text('Produto'),
                                                      content: const Text(
                                                          'Atualizado Excluído!'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: const Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                setState(() {
                                                  _model.produtoNomeController
                                                      ?.clear();
                                                  _model.tipoProdutoController
                                                      ?.clear();
                                                  _model
                                                      .caracteristicasProdutoController
                                                      ?.clear();
                                                  _model
                                                      .restricoesElegibilidadeProdutoController
                                                      ?.clear();
                                                  _model
                                                      .tarifasCustosAdicionaisProdutoController
                                                      ?.clear();
                                                });
                                                Navigator.pop(context);
                                                return;
                                              } else {
                                                setState(() {
                                                  _model.produtoNomeController
                                                      ?.clear();
                                                  _model.tipoProdutoController
                                                      ?.clear();
                                                  _model
                                                      .caracteristicasProdutoController
                                                      ?.clear();
                                                  _model
                                                      .restricoesElegibilidadeProdutoController
                                                      ?.clear();
                                                  _model
                                                      .tarifasCustosAdicionaisProdutoController
                                                      ?.clear();
                                                });
                                                Navigator.pop(context);
                                                return;
                                              }
                                            },
                                            text: 'Excluir',
                                            options: FFButtonOptions(
                                              width: 300.0,
                                              height: 52.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              hoverColor: const Color(0xACD00C07),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ]
                                  .divide(const SizedBox(height: 8.0))
                                  .around(const SizedBox(height: 8.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
