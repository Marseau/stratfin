import '/backend/backend.dart';
import '/dashboard/bottom_editar/bottom_editar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_view_search_model.dart';
export 'list_view_search_model.dart';

class ListViewSearchWidget extends StatefulWidget {
  const ListViewSearchWidget({
    super.key,
    this.docReference,
    this.listaCampoItem,
    this.titulolistview,
    this.colecao,
    this.campoNome,
    this.listaNome,
  });

  final DocumentReference? docReference;
  final List<String>? listaCampoItem;
  final String? titulolistview;
  final String? colecao;
  final String? campoNome;
  final String? listaNome;

  @override
  _ListViewSearchWidgetState createState() => _ListViewSearchWidgetState();
}

class _ListViewSearchWidgetState extends State<ListViewSearchWidget> {
  late ListViewSearchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewSearchModel());

    _model.searchFor0Controller ??= TextEditingController();
    _model.searchFor0FocusNode ??= FocusNode();

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 2.0),
          child: StreamBuilder<List<OpcoesEscolhaRecord>>(
            stream: queryOpcoesEscolhaRecord(
              queryBuilder: (opcoesEscolhaRecord) => opcoesEscolhaRecord.where(
                'uid',
                isEqualTo: FFAppState().docRefUsers?.id,
              ),
              singleRecord: true,
            ),
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
              List<OpcoesEscolhaRecord> containerOpcoesEscolhaRecordList =
                  snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final containerOpcoesEscolhaRecord =
                  containerOpcoesEscolhaRecordList.isNotEmpty
                      ? containerOpcoesEscolhaRecordList.first
                      : null;
              return Material(
                color: Colors.transparent,
                elevation: 1.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: FlutterFlowTheme.of(context).alternate,
                        offset: const Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  alignment: const AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.00, 0.00),
                          child: SizedBox(
                            width: 160.0,
                            child: TextFormField(
                              controller: _model.searchFor0Controller,
                              focusNode: _model.searchFor0FocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.searchFor0Controller',
                                const Duration(milliseconds: 500),
                                () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                alignLabelWithHint: false,
                                hintText: 'Pesquise',
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                filled: true,
                                fillColor: const Color(0x74FFFFFF),
                                prefixIcon: Icon(
                                  Icons.search_sharp,
                                  color: FlutterFlowTheme.of(context).accent1,
                                ),
                                suffixIcon: _model
                                        .searchFor0Controller!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.searchFor0Controller?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 22,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              minLines: 1,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.searchFor0ControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            if (_model.searchFor0Controller.text == '') {
                              await actions.updateAndSortList(
                                widget.colecao!,
                                widget.docReference!.id,
                                widget.campoNome!,
                                widget.listaNome!,
                                widget.listaCampoItem!.toList(),
                              );
                              return;
                            } else {
                              if (widget.titulolistview == 'PERFIL') {
                                await widget.docReference!
                                    .update(createOpcoesEscolhaRecordData(
                                  escolha: createOpcoesVariaveisStruct(
                                    fieldValues: {
                                      'suitabilities': FieldValue.arrayUnion(
                                          [_model.searchFor0Controller.text]),
                                    },
                                    clearUnsetFields: false,
                                  ),
                                ));
                                await Future.delayed(
                                    const Duration(milliseconds: 500));
                                await actions.updateAndSortList(
                                  widget.colecao!,
                                  widget.docReference!.id,
                                  widget.campoNome!,
                                  widget.listaNome!,
                                  widget.listaCampoItem!.toList(),
                                );
                                setState(() {
                                  _model.searchFor0Controller?.clear();
                                });
                              } else {
                                if (widget.titulolistview ==
                                    'GÊNERO (aposentadoria)') {
                                  await widget.docReference!
                                      .update(createOpcoesEscolhaRecordData(
                                    escolha: createOpcoesVariaveisStruct(
                                      fieldValues: {
                                        'generos': FieldValue.arrayUnion(
                                            [_model.searchFor0Controller.text]),
                                      },
                                      clearUnsetFields: false,
                                    ),
                                  ));
                                  await Future.delayed(
                                      const Duration(milliseconds: 500));
                                  await actions.updateAndSortList(
                                    widget.colecao!,
                                    widget.docReference!.id,
                                    widget.campoNome!,
                                    widget.listaNome!,
                                    widget.listaCampoItem!.toList(),
                                  );
                                  setState(() {
                                    _model.searchFor0Controller?.clear();
                                  });
                                } else {
                                  if (widget.titulolistview == 'IRPF') {
                                    await widget.docReference!
                                        .update(createOpcoesEscolhaRecordData(
                                      escolha: createOpcoesVariaveisStruct(
                                        fieldValues: {
                                          'IRPF': FieldValue.arrayUnion([
                                            _model.searchFor0Controller.text
                                          ]),
                                        },
                                        clearUnsetFields: false,
                                      ),
                                    ));
                                    await Future.delayed(
                                        const Duration(milliseconds: 500));
                                    await actions.updateAndSortList(
                                      widget.colecao!,
                                      widget.docReference!.id,
                                      widget.campoNome!,
                                      widget.listaNome!,
                                      widget.listaCampoItem!.toList(),
                                    );
                                    setState(() {
                                      _model.searchFor0Controller?.clear();
                                    });
                                  } else {
                                    if (widget.titulolistview ==
                                        'ESTADO CIVIL') {
                                      await widget.docReference!
                                          .update(createOpcoesEscolhaRecordData(
                                        escolha: createOpcoesVariaveisStruct(
                                          fieldValues: {
                                            'estado_civil':
                                                FieldValue.arrayUnion([
                                              _model.searchFor0Controller.text
                                            ]),
                                          },
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                      await Future.delayed(
                                          const Duration(milliseconds: 500));
                                      await actions.updateAndSortList(
                                        widget.colecao!,
                                        widget.docReference!.id,
                                        widget.campoNome!,
                                        widget.listaNome!,
                                        widget.listaCampoItem!.toList(),
                                      );
                                      setState(() {
                                        _model.searchFor0Controller?.clear();
                                      });
                                    } else {
                                      if (widget.titulolistview ==
                                          'REGIME DE UNIÃO') {
                                        await widget.docReference!.update(
                                            createOpcoesEscolhaRecordData(
                                          escolha: createOpcoesVariaveisStruct(
                                            fieldValues: {
                                              'regimeuniao':
                                                  FieldValue.arrayUnion([
                                                _model.searchFor0Controller.text
                                              ]),
                                            },
                                            clearUnsetFields: false,
                                          ),
                                        ));
                                        await Future.delayed(
                                            const Duration(milliseconds: 500));
                                        await actions.updateAndSortList(
                                          widget.colecao!,
                                          widget.docReference!.id,
                                          widget.campoNome!,
                                          widget.listaNome!,
                                          widget.listaCampoItem!.toList(),
                                        );
                                        setState(() {
                                          _model.searchFor0Controller?.clear();
                                        });
                                      } else {
                                        if (widget.titulolistview ==
                                            'DEPENDENTES') {
                                          await widget.docReference!.update(
                                              createOpcoesEscolhaRecordData(
                                            escolha:
                                                createOpcoesVariaveisStruct(
                                              fieldValues: {
                                                'dependentes':
                                                    FieldValue.arrayUnion([
                                                  _model
                                                      .searchFor0Controller.text
                                                ]),
                                              },
                                              clearUnsetFields: false,
                                            ),
                                          ));
                                          await Future.delayed(const Duration(
                                              milliseconds: 500));
                                          await actions.updateAndSortList(
                                            widget.colecao!,
                                            widget.docReference!.id,
                                            widget.campoNome!,
                                            widget.listaNome!,
                                            widget.listaCampoItem!.toList(),
                                          );
                                          setState(() {
                                            _model.searchFor0Controller
                                                ?.clear();
                                          });
                                        } else {
                                          if (widget.titulolistview ==
                                              'PROFISSIONAL') {
                                            await widget.docReference!.update(
                                                createOpcoesEscolhaRecordData(
                                              escolha:
                                                  createOpcoesVariaveisStruct(
                                                fieldValues: {
                                                  'vinculoprofissional':
                                                      FieldValue.arrayUnion([
                                                    _model.searchFor0Controller
                                                        .text
                                                  ]),
                                                },
                                                clearUnsetFields: false,
                                              ),
                                            ));
                                            await Future.delayed(const Duration(
                                                milliseconds: 500));
                                            await actions.updateAndSortList(
                                              widget.colecao!,
                                              widget.docReference!.id,
                                              widget.campoNome!,
                                              widget.listaNome!,
                                              widget.listaCampoItem!.toList(),
                                            );
                                            setState(() {
                                              _model.searchFor0Controller
                                                  ?.clear();
                                            });
                                          } else {
                                            if (widget.titulolistview ==
                                                'ATIVO') {
                                              await widget.docReference!.update(
                                                  createOpcoesEscolhaRecordData(
                                                escolha:
                                                    createOpcoesVariaveisStruct(
                                                  fieldValues: {
                                                    'ativotipo':
                                                        FieldValue.arrayUnion([
                                                      _model
                                                          .searchFor0Controller
                                                          .text
                                                    ]),
                                                  },
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 500));
                                              await actions.updateAndSortList(
                                                widget.colecao!,
                                                widget.docReference!.id,
                                                widget.campoNome!,
                                                widget.listaNome!,
                                                widget.listaCampoItem!.toList(),
                                              );
                                              setState(() {
                                                _model.searchFor0Controller
                                                    ?.clear();
                                              });
                                            } else {
                                              if (widget.titulolistview ==
                                                  'PASSIVO') {
                                                await widget.docReference!.update(
                                                    createOpcoesEscolhaRecordData(
                                                  escolha:
                                                      createOpcoesVariaveisStruct(
                                                    fieldValues: {
                                                      'passivotipo': FieldValue
                                                          .arrayUnion([
                                                        _model
                                                            .searchFor0Controller
                                                            .text
                                                      ]),
                                                    },
                                                    clearUnsetFields: false,
                                                  ),
                                                ));
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 500));
                                                await actions.updateAndSortList(
                                                  widget.colecao!,
                                                  widget.docReference!.id,
                                                  widget.campoNome!,
                                                  widget.listaNome!,
                                                  widget.listaCampoItem!
                                                      .toList(),
                                                );
                                                setState(() {
                                                  _model.searchFor0Controller
                                                      ?.clear();
                                                });
                                              } else {
                                                if (widget.titulolistview ==
                                                    'CONSUMO PATRIMÔNIO') {
                                                  await widget.docReference!.update(
                                                      createOpcoesEscolhaRecordData(
                                                    escolha:
                                                        createOpcoesVariaveisStruct(
                                                      fieldValues: {
                                                        'consumopatrimonio':
                                                            FieldValue
                                                                .arrayUnion([
                                                          _model
                                                              .searchFor0Controller
                                                              .text
                                                        ]),
                                                      },
                                                      clearUnsetFields: false,
                                                    ),
                                                  ));
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 500));
                                                  await actions
                                                      .updateAndSortList(
                                                    widget.colecao!,
                                                    widget.docReference!.id,
                                                    widget.campoNome!,
                                                    widget.listaNome!,
                                                    widget.listaCampoItem!
                                                        .toList(),
                                                  );
                                                  setState(() {
                                                    _model.searchFor0Controller
                                                        ?.clear();
                                                  });
                                                } else {
                                                  if (widget.titulolistview ==
                                                      'STATUS PATRIMÔNIO') {
                                                    await widget.docReference!
                                                        .update(
                                                            createOpcoesEscolhaRecordData(
                                                      escolha:
                                                          createOpcoesVariaveisStruct(
                                                        fieldValues: {
                                                          'statuspatrimonio':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            _model
                                                                .searchFor0Controller
                                                                .text
                                                          ]),
                                                        },
                                                        clearUnsetFields: false,
                                                      ),
                                                    ));
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 500));
                                                    await actions
                                                        .updateAndSortList(
                                                      widget.colecao!,
                                                      widget.docReference!.id,
                                                      widget.campoNome!,
                                                      widget.listaNome!,
                                                      widget.listaCampoItem!
                                                          .toList(),
                                                    );
                                                    setState(() {
                                                      _model
                                                          .searchFor0Controller
                                                          ?.clear();
                                                    });
                                                  } else {
                                                    if (widget.titulolistview ==
                                                        'PROJETO DE VIDA') {
                                                      await widget.docReference!
                                                          .update(
                                                              createOpcoesEscolhaRecordData(
                                                        escolha:
                                                            createOpcoesVariaveisStruct(
                                                          fieldValues: {
                                                            'projetosvida':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              _model
                                                                  .searchFor0Controller
                                                                  .text
                                                            ]),
                                                          },
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                      ));
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  500));
                                                      await actions
                                                          .updateAndSortList(
                                                        widget.colecao!,
                                                        widget.docReference!.id,
                                                        widget.campoNome!,
                                                        widget.listaNome!,
                                                        widget.listaCampoItem!
                                                            .toList(),
                                                      );
                                                      setState(() {
                                                        _model
                                                            .searchFor0Controller
                                                            ?.clear();
                                                      });
                                                    } else {
                                                      if (widget
                                                              .titulolistview ==
                                                          'EMPRESAS') {
                                                        await widget
                                                            .docReference!
                                                            .update(
                                                                createOpcoesEscolhaRecordData(
                                                          escolha:
                                                              createOpcoesVariaveisStruct(
                                                            fieldValues: {
                                                              'seguroempresa':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                _model
                                                                    .searchFor0Controller
                                                                    .text
                                                              ]),
                                                            },
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                        ));
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    500));
                                                        await actions
                                                            .updateAndSortList(
                                                          widget.colecao!,
                                                          widget
                                                              .docReference!.id,
                                                          widget.campoNome!,
                                                          widget.listaNome!,
                                                          widget.listaCampoItem!
                                                              .toList(),
                                                        );
                                                        setState(() {
                                                          _model
                                                              .searchFor0Controller
                                                              ?.clear();
                                                        });
                                                      } else {
                                                        if (widget
                                                                .titulolistview ==
                                                            'TIPO') {
                                                          await widget
                                                              .docReference!
                                                              .update(
                                                                  createOpcoesEscolhaRecordData(
                                                            escolha:
                                                                createOpcoesVariaveisStruct(
                                                              fieldValues: {
                                                                'segurotipo':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  _model
                                                                      .searchFor0Controller
                                                                      .text
                                                                ]),
                                                              },
                                                              clearUnsetFields:
                                                                  false,
                                                            ),
                                                          ));
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      500));
                                                          await actions
                                                              .updateAndSortList(
                                                            widget.colecao!,
                                                            widget.docReference!
                                                                .id,
                                                            widget.campoNome!,
                                                            widget.listaNome!,
                                                            widget
                                                                .listaCampoItem!
                                                                .toList(),
                                                          );
                                                          setState(() {
                                                            _model
                                                                .searchFor0Controller
                                                                ?.clear();
                                                          });
                                                        } else {
                                                          if (widget
                                                                  .titulolistview ==
                                                              'PAGAMENTO') {
                                                            await widget
                                                                .docReference!
                                                                .update(
                                                                    createOpcoesEscolhaRecordData(
                                                              escolha:
                                                                  createOpcoesVariaveisStruct(
                                                                fieldValues: {
                                                                  'pagamento':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    _model
                                                                        .searchFor0Controller
                                                                        .text
                                                                  ]),
                                                                },
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                            ));
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        500));
                                                            await actions
                                                                .updateAndSortList(
                                                              widget.colecao!,
                                                              widget
                                                                  .docReference!
                                                                  .id,
                                                              widget.campoNome!,
                                                              widget.listaNome!,
                                                              widget
                                                                  .listaCampoItem!
                                                                  .toList(),
                                                            );
                                                            setState(() {
                                                              _model
                                                                  .searchFor0Controller
                                                                  ?.clear();
                                                            });
                                                          } else {
                                                            if (widget
                                                                    .titulolistview ==
                                                                'RECEBIMENTO') {
                                                              await widget
                                                                  .docReference!
                                                                  .update(
                                                                      createOpcoesEscolhaRecordData(
                                                                escolha:
                                                                    createOpcoesVariaveisStruct(
                                                                  fieldValues: {
                                                                    'recebimento':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      _model
                                                                          .searchFor0Controller
                                                                          .text
                                                                    ]),
                                                                  },
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          500));
                                                              await actions
                                                                  .updateAndSortList(
                                                                widget.colecao!,
                                                                widget
                                                                    .docReference!
                                                                    .id,
                                                                widget
                                                                    .campoNome!,
                                                                widget
                                                                    .listaNome!,
                                                                widget
                                                                    .listaCampoItem!
                                                                    .toList(),
                                                              );
                                                              setState(() {
                                                                _model
                                                                    .searchFor0Controller
                                                                    ?.clear();
                                                              });
                                                            } else {
                                                              if (widget
                                                                      .titulolistview ==
                                                                  'OBJETIVOS') {
                                                                await widget
                                                                    .docReference!
                                                                    .update(
                                                                        createOpcoesEscolhaRecordData(
                                                                  escolha:
                                                                      createOpcoesVariaveisStruct(
                                                                    fieldValues: {
                                                                      'Objetivo_Investimento':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        _model
                                                                            .searchFor0Controller
                                                                            .text
                                                                      ]),
                                                                    },
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                ));
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500));
                                                                await actions
                                                                    .updateAndSortList(
                                                                  widget
                                                                      .colecao!,
                                                                  widget
                                                                      .docReference!
                                                                      .id,
                                                                  widget
                                                                      .campoNome!,
                                                                  widget
                                                                      .listaNome!,
                                                                  widget
                                                                      .listaCampoItem!
                                                                      .toList(),
                                                                );
                                                                setState(() {
                                                                  _model
                                                                      .searchFor0Controller
                                                                      ?.clear();
                                                                });
                                                              } else {
                                                                if (widget
                                                                        .titulolistview ==
                                                                    'PROTEÇÃO CAPITAL') {
                                                                  await widget
                                                                      .docReference!
                                                                      .update(
                                                                          createOpcoesEscolhaRecordData(
                                                                    escolha:
                                                                        createOpcoesVariaveisStruct(
                                                                      fieldValues: {
                                                                        'Nivel_Protecao_Capital':
                                                                            FieldValue.arrayUnion([
                                                                          _model
                                                                              .searchFor0Controller
                                                                              .text
                                                                        ]),
                                                                      },
                                                                      clearUnsetFields:
                                                                          false,
                                                                    ),
                                                                  ));
                                                                  await Future.delayed(
                                                                      const Duration(
                                                                          milliseconds:
                                                                              500));
                                                                  await actions
                                                                      .updateAndSortList(
                                                                    widget
                                                                        .colecao!,
                                                                    widget
                                                                        .docReference!
                                                                        .id,
                                                                    widget
                                                                        .campoNome!,
                                                                    widget
                                                                        .listaNome!,
                                                                    widget
                                                                        .listaCampoItem!
                                                                        .toList(),
                                                                  );
                                                                  setState(() {
                                                                    _model
                                                                        .searchFor0Controller
                                                                        ?.clear();
                                                                  });
                                                                } else {
                                                                  if (widget
                                                                          .titulolistview ==
                                                                      'RISCO ASSOCIADO') {
                                                                    await widget
                                                                        .docReference!
                                                                        .update(
                                                                            createOpcoesEscolhaRecordData(
                                                                      escolha:
                                                                          createOpcoesVariaveisStruct(
                                                                        fieldValues: {
                                                                          'Risco_Associado':
                                                                              FieldValue.arrayUnion([
                                                                            _model.searchFor0Controller.text
                                                                          ]),
                                                                        },
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    ));
                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            500));
                                                                    await actions
                                                                        .updateAndSortList(
                                                                      widget
                                                                          .colecao!,
                                                                      widget
                                                                          .docReference!
                                                                          .id,
                                                                      widget
                                                                          .campoNome!,
                                                                      widget
                                                                          .listaNome!,
                                                                      widget
                                                                          .listaCampoItem!
                                                                          .toList(),
                                                                    );
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .searchFor0Controller
                                                                          ?.clear();
                                                                    });
                                                                  } else {
                                                                    if (widget
                                                                            .titulolistview ==
                                                                        'RATING') {
                                                                      await widget
                                                                          .docReference!
                                                                          .update(
                                                                              createOpcoesEscolhaRecordData(
                                                                        escolha:
                                                                            createOpcoesVariaveisStruct(
                                                                          fieldValues: {
                                                                            'Rating':
                                                                                FieldValue.arrayUnion([
                                                                              _model.searchFor0Controller.text
                                                                            ]),
                                                                          },
                                                                          clearUnsetFields:
                                                                              false,
                                                                        ),
                                                                      ));
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              500));
                                                                      await actions
                                                                          .updateAndSortList(
                                                                        widget
                                                                            .colecao!,
                                                                        widget
                                                                            .docReference!
                                                                            .id,
                                                                        widget
                                                                            .campoNome!,
                                                                        widget
                                                                            .listaNome!,
                                                                        widget
                                                                            .listaCampoItem!
                                                                            .toList(),
                                                                      );
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .searchFor0Controller
                                                                            ?.clear();
                                                                      });
                                                                    } else {
                                                                      if (widget
                                                                              .titulolistview ==
                                                                          'LIQUIDEZ') {
                                                                        await widget
                                                                            .docReference!
                                                                            .update(createOpcoesEscolhaRecordData(
                                                                          escolha:
                                                                              createOpcoesVariaveisStruct(
                                                                            fieldValues: {
                                                                              'Liquidez': FieldValue.arrayUnion([
                                                                                _model.searchFor0Controller.text
                                                                              ]),
                                                                            },
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                        ));
                                                                        await Future.delayed(const Duration(
                                                                            milliseconds:
                                                                                500));
                                                                        await actions
                                                                            .updateAndSortList(
                                                                          widget
                                                                              .colecao!,
                                                                          widget
                                                                              .docReference!
                                                                              .id,
                                                                          widget
                                                                              .campoNome!,
                                                                          widget
                                                                              .listaNome!,
                                                                          widget
                                                                              .listaCampoItem!
                                                                              .toList(),
                                                                        );
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .searchFor0Controller
                                                                              ?.clear();
                                                                        });
                                                                      } else {
                                                                        if (widget.titulolistview ==
                                                                            'HORIZONTE') {
                                                                          await widget
                                                                              .docReference!
                                                                              .update(createOpcoesEscolhaRecordData(
                                                                            escolha:
                                                                                createOpcoesVariaveisStruct(
                                                                              fieldValues: {
                                                                                'Horizonte_Investimento': FieldValue.arrayUnion([
                                                                                  _model.searchFor0Controller.text
                                                                                ]),
                                                                              },
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                          ));
                                                                          await Future.delayed(
                                                                              const Duration(milliseconds: 500));
                                                                          await actions
                                                                              .updateAndSortList(
                                                                            widget.colecao!,
                                                                            widget.docReference!.id,
                                                                            widget.campoNome!,
                                                                            widget.listaNome!,
                                                                            widget.listaCampoItem!.toList(),
                                                                          );
                                                                          setState(
                                                                              () {
                                                                            _model.searchFor0Controller?.clear();
                                                                          });
                                                                        } else {
                                                                          if (widget.titulolistview ==
                                                                              'VOLATILIDADE') {
                                                                            await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                              escolha: createOpcoesVariaveisStruct(
                                                                                fieldValues: {
                                                                                  'Volatilidade': FieldValue.arrayUnion([
                                                                                    _model.searchFor0Controller.text
                                                                                  ]),
                                                                                },
                                                                                clearUnsetFields: false,
                                                                              ),
                                                                            ));
                                                                            await Future.delayed(const Duration(milliseconds: 500));
                                                                            await actions.updateAndSortList(
                                                                              widget.colecao!,
                                                                              widget.docReference!.id,
                                                                              widget.campoNome!,
                                                                              widget.listaNome!,
                                                                              widget.listaCampoItem!.toList(),
                                                                            );
                                                                            setState(() {
                                                                              _model.searchFor0Controller?.clear();
                                                                            });
                                                                          } else {
                                                                            if (widget.titulolistview ==
                                                                                'IMPOSTOS  & TAXAS') {
                                                                              await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                escolha: createOpcoesVariaveisStruct(
                                                                                  fieldValues: {
                                                                                    'Impostos_Taxas': FieldValue.arrayUnion([
                                                                                      _model.searchFor0Controller.text
                                                                                    ]),
                                                                                  },
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                              await Future.delayed(const Duration(milliseconds: 500));
                                                                              await actions.updateAndSortList(
                                                                                widget.colecao!,
                                                                                widget.docReference!.id,
                                                                                widget.campoNome!,
                                                                                widget.listaNome!,
                                                                                widget.listaCampoItem!.toList(),
                                                                              );
                                                                              setState(() {
                                                                                _model.searchFor0Controller?.clear();
                                                                              });
                                                                            } else {
                                                                              if (widget.titulolistview == 'REGULAMENTAÇÃO') {
                                                                                await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                  escolha: createOpcoesVariaveisStruct(
                                                                                    fieldValues: {
                                                                                      'Regulamentacao': FieldValue.arrayUnion([
                                                                                        _model.searchFor0Controller.text
                                                                                      ]),
                                                                                    },
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                ));
                                                                                await Future.delayed(const Duration(milliseconds: 500));
                                                                                await actions.updateAndSortList(
                                                                                  widget.colecao!,
                                                                                  widget.docReference!.id,
                                                                                  widget.campoNome!,
                                                                                  widget.listaNome!,
                                                                                  widget.listaCampoItem!.toList(),
                                                                                );
                                                                                setState(() {
                                                                                  _model.searchFor0Controller?.clear();
                                                                                });
                                                                              } else {
                                                                                if (widget.titulolistview == 'BENEFÍCIOS FISCAIS') {
                                                                                  await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                    escolha: createOpcoesVariaveisStruct(
                                                                                      fieldValues: {
                                                                                        'Beneficios_Fiscais': FieldValue.arrayUnion([
                                                                                          _model.searchFor0Controller.text
                                                                                        ]),
                                                                                      },
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                  ));
                                                                                  await Future.delayed(const Duration(milliseconds: 500));
                                                                                  await actions.updateAndSortList(
                                                                                    widget.colecao!,
                                                                                    widget.docReference!.id,
                                                                                    widget.campoNome!,
                                                                                    widget.listaNome!,
                                                                                    widget.listaCampoItem!.toList(),
                                                                                  );
                                                                                  setState(() {
                                                                                    _model.searchFor0Controller?.clear();
                                                                                  });
                                                                                } else {
                                                                                  if (widget.titulolistview == 'CONSÓRCIO') {
                                                                                    await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                      escolha: createOpcoesVariaveisStruct(
                                                                                        fieldValues: {
                                                                                          'Consorcio': FieldValue.arrayUnion([
                                                                                            _model.searchFor0Controller.text
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                    await Future.delayed(const Duration(milliseconds: 500));
                                                                                    await actions.updateAndSortList(
                                                                                      widget.colecao!,
                                                                                      widget.docReference!.id,
                                                                                      widget.campoNome!,
                                                                                      widget.listaNome!,
                                                                                      widget.listaCampoItem!.toList(),
                                                                                    );
                                                                                    setState(() {
                                                                                      _model.searchFor0Controller?.clear();
                                                                                    });
                                                                                  } else {
                                                                                    if (widget.titulolistview == 'TÍTULOS CAPITALIZAÇÃO') {
                                                                                      await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                        escolha: createOpcoesVariaveisStruct(
                                                                                          fieldValues: {
                                                                                            'Titulos_Capitalizacao': FieldValue.arrayUnion([
                                                                                              _model.searchFor0Controller.text
                                                                                            ]),
                                                                                          },
                                                                                          clearUnsetFields: false,
                                                                                        ),
                                                                                      ));
                                                                                      await Future.delayed(const Duration(milliseconds: 500));
                                                                                      await actions.updateAndSortList(
                                                                                        widget.colecao!,
                                                                                        widget.docReference!.id,
                                                                                        widget.campoNome!,
                                                                                        widget.listaNome!,
                                                                                        widget.listaCampoItem!.toList(),
                                                                                      );
                                                                                      setState(() {
                                                                                        _model.searchFor0Controller?.clear();
                                                                                      });
                                                                                    } else {
                                                                                      if (widget.titulolistview == 'POUPANÇA /CONTAS EXTRAS') {
                                                                                        await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                          escolha: createOpcoesVariaveisStruct(
                                                                                            fieldValues: {
                                                                                              'ContaEmergencia_Poupanca': FieldValue.arrayUnion([
                                                                                                _model.searchFor0Controller.text
                                                                                              ]),
                                                                                            },
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                        ));
                                                                                        await Future.delayed(const Duration(milliseconds: 500));
                                                                                        await actions.updateAndSortList(
                                                                                          widget.colecao!,
                                                                                          widget.docReference!.id,
                                                                                          widget.campoNome!,
                                                                                          widget.listaNome!,
                                                                                          widget.listaCampoItem!.toList(),
                                                                                        );
                                                                                        setState(() {
                                                                                          _model.searchFor0Controller?.clear();
                                                                                        });
                                                                                      } else {
                                                                                        if (widget.titulolistview == 'RENDA FIXA') {
                                                                                          await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                            escolha: createOpcoesVariaveisStruct(
                                                                                              fieldValues: {
                                                                                                'Renda_Fixa': FieldValue.arrayUnion([
                                                                                                  _model.searchFor0Controller.text
                                                                                                ]),
                                                                                              },
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                          await Future.delayed(const Duration(milliseconds: 500));
                                                                                          await actions.updateAndSortList(
                                                                                            widget.colecao!,
                                                                                            widget.docReference!.id,
                                                                                            widget.campoNome!,
                                                                                            widget.listaNome!,
                                                                                            widget.listaCampoItem!.toList(),
                                                                                          );
                                                                                          setState(() {
                                                                                            _model.searchFor0Controller?.clear();
                                                                                          });
                                                                                        } else {
                                                                                          if (widget.titulolistview == 'PREVIDÊNCIA PRIVADA') {
                                                                                            await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                              escolha: createOpcoesVariaveisStruct(
                                                                                                fieldValues: {
                                                                                                  'Previdencia_Privada': FieldValue.arrayUnion([
                                                                                                    _model.searchFor0Controller.text
                                                                                                  ]),
                                                                                                },
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                            await Future.delayed(const Duration(milliseconds: 500));
                                                                                            await actions.updateAndSortList(
                                                                                              widget.colecao!,
                                                                                              widget.docReference!.id,
                                                                                              widget.campoNome!,
                                                                                              widget.listaNome!,
                                                                                              widget.listaCampoItem!.toList(),
                                                                                            );
                                                                                            setState(() {
                                                                                              _model.searchFor0Controller?.clear();
                                                                                            });
                                                                                          } else {
                                                                                            if (widget.titulolistview == 'FUNDOS DE PENSÃO') {
                                                                                              await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                escolha: createOpcoesVariaveisStruct(
                                                                                                  fieldValues: {
                                                                                                    'Fundo_Pensao': FieldValue.arrayUnion([
                                                                                                      _model.searchFor0Controller.text
                                                                                                    ]),
                                                                                                  },
                                                                                                  clearUnsetFields: false,
                                                                                                ),
                                                                                              ));
                                                                                              await Future.delayed(const Duration(milliseconds: 500));
                                                                                              await actions.updateAndSortList(
                                                                                                widget.colecao!,
                                                                                                widget.docReference!.id,
                                                                                                widget.campoNome!,
                                                                                                widget.listaNome!,
                                                                                                widget.listaCampoItem!.toList(),
                                                                                              );
                                                                                              setState(() {
                                                                                                _model.searchFor0Controller?.clear();
                                                                                              });
                                                                                            } else {
                                                                                              if (widget.titulolistview == 'CÂMBIO') {
                                                                                                await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                  escolha: createOpcoesVariaveisStruct(
                                                                                                    fieldValues: {
                                                                                                      'Cambio': FieldValue.arrayUnion([
                                                                                                        _model.searchFor0Controller.text
                                                                                                      ]),
                                                                                                    },
                                                                                                    clearUnsetFields: false,
                                                                                                  ),
                                                                                                ));
                                                                                                await Future.delayed(const Duration(milliseconds: 500));
                                                                                                await actions.updateAndSortList(
                                                                                                  widget.colecao!,
                                                                                                  widget.docReference!.id,
                                                                                                  widget.campoNome!,
                                                                                                  widget.listaNome!,
                                                                                                  widget.listaCampoItem!.toList(),
                                                                                                );
                                                                                                setState(() {
                                                                                                  _model.searchFor0Controller?.clear();
                                                                                                });
                                                                                              } else {
                                                                                                if (widget.titulolistview == 'CROWDFUNDING') {
                                                                                                  await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                    escolha: createOpcoesVariaveisStruct(
                                                                                                      fieldValues: {
                                                                                                        'Crowdfunding_Investimento': FieldValue.arrayUnion([
                                                                                                          _model.searchFor0Controller.text
                                                                                                        ]),
                                                                                                      },
                                                                                                      clearUnsetFields: false,
                                                                                                    ),
                                                                                                  ));
                                                                                                  await Future.delayed(const Duration(milliseconds: 500));
                                                                                                  await actions.updateAndSortList(
                                                                                                    widget.colecao!,
                                                                                                    widget.docReference!.id,
                                                                                                    widget.campoNome!,
                                                                                                    widget.listaNome!,
                                                                                                    widget.listaCampoItem!.toList(),
                                                                                                  );
                                                                                                  setState(() {
                                                                                                    _model.searchFor0Controller?.clear();
                                                                                                  });
                                                                                                } else {
                                                                                                  if (widget.titulolistview == 'FUNDOS DE INVESTIMENTO') {
                                                                                                    await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                      escolha: createOpcoesVariaveisStruct(
                                                                                                        fieldValues: {
                                                                                                          'Fundos_Investimento': FieldValue.arrayUnion([
                                                                                                            _model.searchFor0Controller.text
                                                                                                          ]),
                                                                                                        },
                                                                                                        clearUnsetFields: false,
                                                                                                      ),
                                                                                                    ));
                                                                                                    await Future.delayed(const Duration(milliseconds: 500));
                                                                                                    await actions.updateAndSortList(
                                                                                                      widget.colecao!,
                                                                                                      widget.docReference!.id,
                                                                                                      widget.campoNome!,
                                                                                                      widget.listaNome!,
                                                                                                      widget.listaCampoItem!.toList(),
                                                                                                    );
                                                                                                    setState(() {
                                                                                                      _model.searchFor0Controller?.clear();
                                                                                                    });
                                                                                                  } else {
                                                                                                    if (widget.titulolistview == 'RENDA VARIÁVEL') {
                                                                                                      await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                        escolha: createOpcoesVariaveisStruct(
                                                                                                          fieldValues: {
                                                                                                            'Renda_Variavel': FieldValue.arrayUnion([
                                                                                                              _model.searchFor0Controller.text
                                                                                                            ]),
                                                                                                          },
                                                                                                          clearUnsetFields: false,
                                                                                                        ),
                                                                                                      ));
                                                                                                      await Future.delayed(const Duration(milliseconds: 500));
                                                                                                      await actions.updateAndSortList(
                                                                                                        widget.colecao!,
                                                                                                        widget.docReference!.id,
                                                                                                        widget.campoNome!,
                                                                                                        widget.listaNome!,
                                                                                                        widget.listaCampoItem!.toList(),
                                                                                                      );
                                                                                                      setState(() {
                                                                                                        _model.searchFor0Controller?.clear();
                                                                                                      });
                                                                                                    } else {
                                                                                                      if (widget.titulolistview == 'PRIVATE EQUITY') {
                                                                                                        await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                          escolha: createOpcoesVariaveisStruct(
                                                                                                            fieldValues: {
                                                                                                              'PrivateEquity': FieldValue.arrayUnion([
                                                                                                                _model.searchFor0Controller.text
                                                                                                              ]),
                                                                                                            },
                                                                                                            clearUnsetFields: false,
                                                                                                          ),
                                                                                                        ));
                                                                                                        await Future.delayed(const Duration(milliseconds: 500));
                                                                                                        await actions.updateAndSortList(
                                                                                                          widget.colecao!,
                                                                                                          widget.docReference!.id,
                                                                                                          widget.campoNome!,
                                                                                                          widget.listaNome!,
                                                                                                          widget.listaCampoItem!.toList(),
                                                                                                        );
                                                                                                        setState(() {
                                                                                                          _model.searchFor0Controller?.clear();
                                                                                                        });
                                                                                                      } else {
                                                                                                        if (widget.titulolistview == 'VENTURE CAPITAL') {
                                                                                                          await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                            escolha: createOpcoesVariaveisStruct(
                                                                                                              fieldValues: {
                                                                                                                'venture_capital': FieldValue.arrayUnion([_model.searchFor0Controller.text]),
                                                                                                              },
                                                                                                              clearUnsetFields: false,
                                                                                                            ),
                                                                                                          ));
                                                                                                          await Future.delayed(const Duration(milliseconds: 500));
                                                                                                          await actions.updateAndSortList(
                                                                                                            widget.colecao!,
                                                                                                            widget.docReference!.id,
                                                                                                            widget.campoNome!,
                                                                                                            widget.listaNome!,
                                                                                                            widget.listaCampoItem!.toList(),
                                                                                                          );
                                                                                                          setState(() {
                                                                                                            _model.searchFor0Controller?.clear();
                                                                                                          });
                                                                                                        } else {
                                                                                                          if (widget.titulolistview == 'DERIVATIVOS') {
                                                                                                            await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                              escolha: createOpcoesVariaveisStruct(
                                                                                                                fieldValues: {
                                                                                                                  'Derivativos': FieldValue.arrayUnion([_model.searchFor0Controller.text]),
                                                                                                                },
                                                                                                                clearUnsetFields: false,
                                                                                                              ),
                                                                                                            ));
                                                                                                            await Future.delayed(const Duration(milliseconds: 500));
                                                                                                            await actions.updateAndSortList(
                                                                                                              widget.colecao!,
                                                                                                              widget.docReference!.id,
                                                                                                              widget.campoNome!,
                                                                                                              widget.listaNome!,
                                                                                                              widget.listaCampoItem!.toList(),
                                                                                                            );
                                                                                                            setState(() {
                                                                                                              _model.searchFor0Controller?.clear();
                                                                                                            });
                                                                                                          } else {
                                                                                                            if (widget.titulolistview == 'CRIPTOMOEDAS') {
                                                                                                              await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                                escolha: createOpcoesVariaveisStruct(
                                                                                                                  fieldValues: {
                                                                                                                    'Criptomoeda': FieldValue.arrayUnion([_model.searchFor0Controller.text]),
                                                                                                                  },
                                                                                                                  clearUnsetFields: false,
                                                                                                                ),
                                                                                                              ));
                                                                                                              await Future.delayed(const Duration(milliseconds: 500));
                                                                                                              await actions.updateAndSortList(
                                                                                                                widget.colecao!,
                                                                                                                widget.docReference!.id,
                                                                                                                widget.campoNome!,
                                                                                                                widget.listaNome!,
                                                                                                                widget.listaCampoItem!.toList(),
                                                                                                              );
                                                                                                              setState(() {
                                                                                                                _model.searchFor0Controller?.clear();
                                                                                                              });
                                                                                                            } else {
                                                                                                              if (widget.titulolistview == 'INVEST. ALTERNATIVO') {
                                                                                                                await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                                  escolha: createOpcoesVariaveisStruct(
                                                                                                                    fieldValues: {
                                                                                                                      'Investimentos_Alternativos': FieldValue.arrayUnion([_model.searchFor0Controller.text]),
                                                                                                                    },
                                                                                                                    clearUnsetFields: false,
                                                                                                                  ),
                                                                                                                ));
                                                                                                                await Future.delayed(const Duration(milliseconds: 500));
                                                                                                                await actions.updateAndSortList(
                                                                                                                  widget.colecao!,
                                                                                                                  widget.docReference!.id,
                                                                                                                  widget.campoNome!,
                                                                                                                  widget.listaNome!,
                                                                                                                  widget.listaCampoItem!.toList(),
                                                                                                                );
                                                                                                                setState(() {
                                                                                                                  _model.searchFor0Controller?.clear();
                                                                                                                });
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          },
                          text: '',
                          icon: const Icon(
                            Icons.add,
                            size: 26.0,
                          ),
                          options: FFButtonOptions(
                            width: 35.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).asparagus,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                            hoverTextColor:
                                FlutterFlowTheme.of(context).accent1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: AutoSizeText(
                            widget.titulolistview!,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            minFontSize: 8.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 2.0),
                )
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
              ),
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
              ),
            ),
            child: Builder(
              builder: (context) {
                final listaCampo = widget.listaCampoItem?.toList() ?? [];
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  scrollDirection: Axis.vertical,
                  itemCount: listaCampo.length,
                  itemBuilder: (context, listaCampoIndex) {
                    final listaCampoItem = listaCampo[listaCampoIndex];
                    return Align(
                      alignment: const AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 1.0,
                          child: Container(
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            child: Visibility(
                              visible: functions.searchFieldResult(
                                  _model.searchFor0Controller.text,
                                  listaCampoItem),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: AutoSizeText(
                                      listaCampoItem,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w300,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      minFontSize: 8.0,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.00, -1.00),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            buttonSize: 35.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                            hoverIconColor:
                                                FlutterFlowTheme.of(context)
                                                    .asparagus,
                                            icon: FaIcon(
                                              FontAwesomeIcons.edit,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              setState(() {
                                                _model.listItem =
                                                    listaCampoIndex;
                                                _model.listName =
                                                    listaCampoIndex.toString();
                                              });
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: BottomEditarWidget(
                                                      tituloListView:
                                                          widget.titulolistview,
                                                      listaCampoItem:
                                                          listaCampoItem,
                                                      docReference:
                                                          widget.docReference!,
                                                      itemCampoItem:
                                                          listaCampoIndex,
                                                      newData:
                                                          widget.listaCampoItem,
                                                      colecao:
                                                          OpcoesVariaveisStruct(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              await actions.updateAndSortList(
                                                widget.colecao!,
                                                widget.docReference!.id,
                                                widget.campoNome!,
                                                widget.listaNome!,
                                                widget.listaCampoItem!.toList(),
                                              );
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 500));
                                            },
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.00, -1.00),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            buttonSize: 35.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                            hoverIconColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                            icon: FaIcon(
                                              FontAwesomeIcons.trash,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              setState(() {
                                                _model.listItem =
                                                    listaCampoIndex;
                                                _model.listName =
                                                    listaCampoItem;
                                              });
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                'Tem ceretza que deseja excluir a opção?'),
                                                            content: const Text(
                                                                'Podem existir clientes que estejam usando esta opção e a exclusão é definitiva!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: const Text(
                                                                    'Cancela'),
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
                                                if (widget.titulolistview ==
                                                    'PERFIL') {
                                                  await widget.docReference!.update(
                                                      createOpcoesEscolhaRecordData(
                                                    escolha:
                                                        createOpcoesVariaveisStruct(
                                                      fieldValues: {
                                                        'suitabilities':
                                                            FieldValue
                                                                .arrayRemove([
                                                          _model.listName
                                                        ]),
                                                      },
                                                      clearUnsetFields: false,
                                                    ),
                                                  ));
                                                } else {
                                                  if (widget.titulolistview ==
                                                      'GÊNERO (aposentadoria)') {
                                                    await widget.docReference!
                                                        .update(
                                                            createOpcoesEscolhaRecordData(
                                                      escolha:
                                                          createOpcoesVariaveisStruct(
                                                        fieldValues: {
                                                          'generos': FieldValue
                                                              .arrayRemove([
                                                            _model.listName
                                                          ]),
                                                        },
                                                        clearUnsetFields: false,
                                                      ),
                                                    ));
                                                  } else {
                                                    if (widget.titulolistview ==
                                                        'IRPF') {
                                                      await widget.docReference!
                                                          .update(
                                                              createOpcoesEscolhaRecordData(
                                                        escolha:
                                                            createOpcoesVariaveisStruct(
                                                          fieldValues: {
                                                            'IRPF': FieldValue
                                                                .arrayRemove([
                                                              _model.listName
                                                            ]),
                                                          },
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                      ));
                                                    } else {
                                                      if (widget
                                                              .titulolistview ==
                                                          'ESTADO CIVIL') {
                                                        await widget
                                                            .docReference!
                                                            .update(
                                                                createOpcoesEscolhaRecordData(
                                                          escolha:
                                                              createOpcoesVariaveisStruct(
                                                            fieldValues: {
                                                              'estado_civil':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                _model.listName
                                                              ]),
                                                            },
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                        ));
                                                      } else {
                                                        if (widget
                                                                .titulolistview ==
                                                            'REGIME DE UNIÃO') {
                                                          await widget
                                                              .docReference!
                                                              .update(
                                                                  createOpcoesEscolhaRecordData(
                                                            escolha:
                                                                createOpcoesVariaveisStruct(
                                                              fieldValues: {
                                                                'regimeuniao':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  _model
                                                                      .listName
                                                                ]),
                                                              },
                                                              clearUnsetFields:
                                                                  false,
                                                            ),
                                                          ));
                                                        } else {
                                                          if (widget
                                                                  .titulolistview ==
                                                              'DEPENDENTES') {
                                                            await widget
                                                                .docReference!
                                                                .update(
                                                                    createOpcoesEscolhaRecordData(
                                                              escolha:
                                                                  createOpcoesVariaveisStruct(
                                                                fieldValues: {
                                                                  'dependentes':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    _model
                                                                        .listName
                                                                  ]),
                                                                },
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                            ));
                                                          } else {
                                                            if (widget
                                                                    .titulolistview ==
                                                                'PROFISSIONAL') {
                                                              await widget
                                                                  .docReference!
                                                                  .update(
                                                                      createOpcoesEscolhaRecordData(
                                                                escolha:
                                                                    createOpcoesVariaveisStruct(
                                                                  fieldValues: {
                                                                    'vinculoprofissional':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      _model
                                                                          .listName
                                                                    ]),
                                                                  },
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            } else {
                                                              if (widget
                                                                      .titulolistview ==
                                                                  'ATIVO') {
                                                                await widget
                                                                    .docReference!
                                                                    .update(
                                                                        createOpcoesEscolhaRecordData(
                                                                  escolha:
                                                                      createOpcoesVariaveisStruct(
                                                                    fieldValues: {
                                                                      'ativotipo':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        _model
                                                                            .listName
                                                                      ]),
                                                                    },
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                ));
                                                              } else {
                                                                if (widget
                                                                        .titulolistview ==
                                                                    'PASSIVO') {
                                                                  await widget
                                                                      .docReference!
                                                                      .update(
                                                                          createOpcoesEscolhaRecordData(
                                                                    escolha:
                                                                        createOpcoesVariaveisStruct(
                                                                      fieldValues: {
                                                                        'passivotipo':
                                                                            FieldValue.arrayRemove([
                                                                          _model
                                                                              .listName
                                                                        ]),
                                                                      },
                                                                      clearUnsetFields:
                                                                          false,
                                                                    ),
                                                                  ));
                                                                } else {
                                                                  if (widget
                                                                          .titulolistview ==
                                                                      'CONSUMO PATRIMÔNIO') {
                                                                    await widget
                                                                        .docReference!
                                                                        .update(
                                                                            createOpcoesEscolhaRecordData(
                                                                      escolha:
                                                                          createOpcoesVariaveisStruct(
                                                                        fieldValues: {
                                                                          'consumopatrimonio':
                                                                              FieldValue.arrayRemove([
                                                                            _model.listName
                                                                          ]),
                                                                        },
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    ));
                                                                  } else {
                                                                    if (widget
                                                                            .titulolistview ==
                                                                        'STATUS PATRIMÔNIO') {
                                                                      await widget
                                                                          .docReference!
                                                                          .update(
                                                                              createOpcoesEscolhaRecordData(
                                                                        escolha:
                                                                            createOpcoesVariaveisStruct(
                                                                          fieldValues: {
                                                                            'statuspatrimonio':
                                                                                FieldValue.arrayRemove([
                                                                              _model.listName
                                                                            ]),
                                                                          },
                                                                          clearUnsetFields:
                                                                              false,
                                                                        ),
                                                                      ));
                                                                    } else {
                                                                      if (widget
                                                                              .titulolistview ==
                                                                          'EMPRESAS') {
                                                                        await widget
                                                                            .docReference!
                                                                            .update(createOpcoesEscolhaRecordData(
                                                                          escolha:
                                                                              createOpcoesVariaveisStruct(
                                                                            fieldValues: {
                                                                              'seguroempresa': FieldValue.arrayRemove([
                                                                                _model.listName
                                                                              ]),
                                                                            },
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                        ));
                                                                      } else {
                                                                        if (widget.titulolistview ==
                                                                            'TIPO') {
                                                                          await widget
                                                                              .docReference!
                                                                              .update(createOpcoesEscolhaRecordData(
                                                                            escolha:
                                                                                createOpcoesVariaveisStruct(
                                                                              fieldValues: {
                                                                                'segurotipo': FieldValue.arrayRemove([
                                                                                  _model.listName
                                                                                ]),
                                                                              },
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                          ));
                                                                        } else {
                                                                          if (widget.titulolistview ==
                                                                              'PAGAMENTO') {
                                                                            await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                              escolha: createOpcoesVariaveisStruct(
                                                                                fieldValues: {
                                                                                  'pagamento': FieldValue.arrayRemove([
                                                                                    _model.listName
                                                                                  ]),
                                                                                },
                                                                                clearUnsetFields: false,
                                                                              ),
                                                                            ));
                                                                          } else {
                                                                            if (widget.titulolistview ==
                                                                                'RECEBIMENTO') {
                                                                              await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                escolha: createOpcoesVariaveisStruct(
                                                                                  fieldValues: {
                                                                                    'recebimento': FieldValue.arrayRemove([
                                                                                      _model.listName
                                                                                    ]),
                                                                                  },
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                            } else {
                                                                              if (widget.titulolistview == 'OBJETIVOS') {
                                                                                await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                  escolha: createOpcoesVariaveisStruct(
                                                                                    fieldValues: {
                                                                                      'Objetivo_Investimento': FieldValue.arrayRemove([
                                                                                        _model.listName
                                                                                      ]),
                                                                                    },
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                ));
                                                                              } else {
                                                                                if (widget.titulolistview == 'RISCO ASSOCIADO') {
                                                                                  await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                    escolha: createOpcoesVariaveisStruct(
                                                                                      fieldValues: {
                                                                                        'Risco_Associado': FieldValue.arrayRemove([
                                                                                          _model.listName
                                                                                        ]),
                                                                                      },
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                  ));
                                                                                } else {
                                                                                  if (widget.titulolistview == 'RATING') {
                                                                                    await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                      escolha: createOpcoesVariaveisStruct(
                                                                                        fieldValues: {
                                                                                          'Rating': FieldValue.arrayRemove([
                                                                                            _model.listName
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                  } else {
                                                                                    if (widget.titulolistview == 'LIQUIDEZ') {
                                                                                      await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                        escolha: createOpcoesVariaveisStruct(
                                                                                          fieldValues: {
                                                                                            'Liquidez': FieldValue.arrayRemove([
                                                                                              _model.listName
                                                                                            ]),
                                                                                          },
                                                                                          clearUnsetFields: false,
                                                                                        ),
                                                                                      ));
                                                                                    } else {
                                                                                      if (widget.titulolistview == 'HORIZONTE') {
                                                                                        await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                          escolha: createOpcoesVariaveisStruct(
                                                                                            fieldValues: {
                                                                                              'Horizonte_Investimento': FieldValue.arrayRemove([
                                                                                                _model.listName
                                                                                              ]),
                                                                                            },
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                        ));
                                                                                      } else {
                                                                                        if (widget.titulolistview == 'VOLATILIDADE') {
                                                                                          await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                            escolha: createOpcoesVariaveisStruct(
                                                                                              fieldValues: {
                                                                                                'Volatilidade': FieldValue.arrayRemove([_model.listName]),
                                                                                              },
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        } else {
                                                                                          if (widget.titulolistview == 'IMPOSTOS  & TAXAS') {
                                                                                            await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                              escolha: createOpcoesVariaveisStruct(
                                                                                                fieldValues: {
                                                                                                  'Impostos_Taxas': FieldValue.arrayRemove([_model.listName]),
                                                                                                },
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          } else {
                                                                                            if (widget.titulolistview == 'REGULAMENTAÇÃO') {
                                                                                              await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                escolha: createOpcoesVariaveisStruct(
                                                                                                  fieldValues: {
                                                                                                    'Regulamentacao': FieldValue.arrayRemove([_model.listName]),
                                                                                                  },
                                                                                                  clearUnsetFields: false,
                                                                                                ),
                                                                                              ));
                                                                                            } else {
                                                                                              if (widget.titulolistview == 'BENEFÍCIOS FISCAIS') {
                                                                                                await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                  escolha: createOpcoesVariaveisStruct(
                                                                                                    fieldValues: {
                                                                                                      'Beneficios_Fiscais': FieldValue.arrayRemove([_model.listName]),
                                                                                                    },
                                                                                                    clearUnsetFields: false,
                                                                                                  ),
                                                                                                ));
                                                                                              } else {
                                                                                                if (widget.titulolistview == 'CONSÓRCIO') {
                                                                                                  await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                    escolha: createOpcoesVariaveisStruct(
                                                                                                      fieldValues: {
                                                                                                        'Consorcio': FieldValue.arrayRemove([_model.listName]),
                                                                                                      },
                                                                                                      clearUnsetFields: false,
                                                                                                    ),
                                                                                                  ));
                                                                                                } else {
                                                                                                  if (widget.titulolistview == 'TÍTULOS CAPITALIZAÇÃO') {
                                                                                                    await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                      escolha: createOpcoesVariaveisStruct(
                                                                                                        fieldValues: {
                                                                                                          'Titulos_Capitalizacao': FieldValue.arrayRemove([_model.listName]),
                                                                                                        },
                                                                                                        clearUnsetFields: false,
                                                                                                      ),
                                                                                                    ));
                                                                                                  } else {
                                                                                                    if (widget.titulolistview == 'POUPANÇA /CONTAS EXTRAS') {
                                                                                                      await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                        escolha: createOpcoesVariaveisStruct(
                                                                                                          fieldValues: {
                                                                                                            'ContaEmergencia_Poupanca': FieldValue.arrayRemove([_model.listName]),
                                                                                                          },
                                                                                                          clearUnsetFields: false,
                                                                                                        ),
                                                                                                      ));
                                                                                                    } else {
                                                                                                      if (widget.titulolistview == 'RENDA FIXA') {
                                                                                                        await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                          escolha: createOpcoesVariaveisStruct(
                                                                                                            fieldValues: {
                                                                                                              'Renda_Fixa': FieldValue.arrayRemove([_model.listName]),
                                                                                                            },
                                                                                                            clearUnsetFields: false,
                                                                                                          ),
                                                                                                        ));
                                                                                                      } else {
                                                                                                        if (widget.titulolistview == 'PREVIDÊNCIA PRIVADA') {
                                                                                                          await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                            escolha: createOpcoesVariaveisStruct(
                                                                                                              fieldValues: {
                                                                                                                'Previdencia_Privada': FieldValue.arrayRemove([_model.listName]),
                                                                                                              },
                                                                                                              clearUnsetFields: false,
                                                                                                            ),
                                                                                                          ));
                                                                                                        } else {
                                                                                                          if (widget.titulolistview == 'FUNDOS DE PENSÃO') {
                                                                                                            await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                              escolha: createOpcoesVariaveisStruct(
                                                                                                                fieldValues: {
                                                                                                                  'Fundo_Pensao': FieldValue.arrayRemove([_model.listName]),
                                                                                                                },
                                                                                                                clearUnsetFields: false,
                                                                                                              ),
                                                                                                            ));
                                                                                                          } else {
                                                                                                            if (widget.titulolistview == 'CÂMBIO') {
                                                                                                              await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                                escolha: createOpcoesVariaveisStruct(
                                                                                                                  fieldValues: {
                                                                                                                    'Cambio': FieldValue.arrayRemove([_model.listName]),
                                                                                                                  },
                                                                                                                  clearUnsetFields: false,
                                                                                                                ),
                                                                                                              ));
                                                                                                            } else {
                                                                                                              if (widget.titulolistview == 'INVEST. ALTERNATIVO') {
                                                                                                                await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                                  escolha: createOpcoesVariaveisStruct(
                                                                                                                    fieldValues: {
                                                                                                                      'Investimentos_Alternativos': FieldValue.arrayRemove([_model.listName]),
                                                                                                                    },
                                                                                                                    clearUnsetFields: false,
                                                                                                                  ),
                                                                                                                ));
                                                                                                              } else {
                                                                                                                if (widget.titulolistview == 'CROWDFUNDING') {
                                                                                                                  await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                                    escolha: createOpcoesVariaveisStruct(
                                                                                                                      fieldValues: {
                                                                                                                        'Crowdfunding_Investimento': FieldValue.arrayRemove([_model.listName]),
                                                                                                                      },
                                                                                                                      clearUnsetFields: false,
                                                                                                                    ),
                                                                                                                  ));
                                                                                                                } else {
                                                                                                                  if (widget.titulolistview == 'FUNDOS DE INVESTIMENTO') {
                                                                                                                    await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                                      escolha: createOpcoesVariaveisStruct(
                                                                                                                        fieldValues: {
                                                                                                                          'Fundos_Investimento': FieldValue.arrayRemove([_model.listName]),
                                                                                                                        },
                                                                                                                        clearUnsetFields: false,
                                                                                                                      ),
                                                                                                                    ));
                                                                                                                  } else {
                                                                                                                    if (widget.titulolistview == 'RENDA VARIÁVEL') {
                                                                                                                      await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                                        escolha: createOpcoesVariaveisStruct(
                                                                                                                          fieldValues: {
                                                                                                                            'Renda_Variavel': FieldValue.arrayRemove([_model.listName]),
                                                                                                                          },
                                                                                                                          clearUnsetFields: false,
                                                                                                                        ),
                                                                                                                      ));
                                                                                                                    } else {
                                                                                                                      if (widget.titulolistview == 'PRIVATE EQUITY') {
                                                                                                                        await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                                          escolha: createOpcoesVariaveisStruct(
                                                                                                                            fieldValues: {
                                                                                                                              'PrivateEquity': FieldValue.arrayRemove([_model.listName]),
                                                                                                                            },
                                                                                                                            clearUnsetFields: false,
                                                                                                                          ),
                                                                                                                        ));
                                                                                                                      } else {
                                                                                                                        if (widget.titulolistview == 'VENTURE CAPITAL') {
                                                                                                                          await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                                            escolha: createOpcoesVariaveisStruct(
                                                                                                                              fieldValues: {
                                                                                                                                'venture_capital': FieldValue.arrayRemove([_model.listName]),
                                                                                                                              },
                                                                                                                              clearUnsetFields: false,
                                                                                                                            ),
                                                                                                                          ));
                                                                                                                        } else {
                                                                                                                          if (widget.titulolistview == 'DERIVATIVOS') {
                                                                                                                            await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                                              escolha: createOpcoesVariaveisStruct(
                                                                                                                                fieldValues: {
                                                                                                                                  'Derivativos': FieldValue.arrayRemove([_model.listName]),
                                                                                                                                },
                                                                                                                                clearUnsetFields: false,
                                                                                                                              ),
                                                                                                                            ));
                                                                                                                          } else {
                                                                                                                            if (widget.titulolistview == 'CRIPTOMOEDAS') {
                                                                                                                              await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                                                escolha: createOpcoesVariaveisStruct(
                                                                                                                                  fieldValues: {
                                                                                                                                    'Criptomoeda': FieldValue.arrayRemove([_model.listName]),
                                                                                                                                  },
                                                                                                                                  clearUnsetFields: false,
                                                                                                                                ),
                                                                                                                              ));
                                                                                                                            } else {
                                                                                                                              if (widget.titulolistview == 'PROTEÇÃO CAPITAL') {
                                                                                                                                await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                                                  escolha: createOpcoesVariaveisStruct(
                                                                                                                                    fieldValues: {
                                                                                                                                      'Nivel_Protecao_Capital': FieldValue.arrayRemove([_model.listName]),
                                                                                                                                    },
                                                                                                                                    clearUnsetFields: false,
                                                                                                                                  ),
                                                                                                                                ));
                                                                                                                              }
                                                                                                                            }
                                                                                                                          }
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              } else {
                                                return;
                                              }

                                              if (widget.titulolistview ==
                                                  'PERFIL') {
                                                await widget.docReference!.update(
                                                    createOpcoesEscolhaRecordData(
                                                  escolha:
                                                      createOpcoesVariaveisStruct(
                                                    fieldValues: {
                                                      'suitabilities':
                                                          FieldValue
                                                              .arrayRemove([
                                                        _model.listName
                                                      ]),
                                                    },
                                                    clearUnsetFields: false,
                                                  ),
                                                ));
                                              } else {
                                                if (widget.titulolistview ==
                                                    'GENÊRO (aposentadoria)') {
                                                  await widget.docReference!.update(
                                                      createOpcoesEscolhaRecordData(
                                                    escolha:
                                                        createOpcoesVariaveisStruct(
                                                      fieldValues: {
                                                        'generos': FieldValue
                                                            .arrayRemove([
                                                          _model.listName
                                                        ]),
                                                      },
                                                      clearUnsetFields: false,
                                                    ),
                                                  ));
                                                } else {
                                                  if (widget.titulolistview ==
                                                      'IRPF') {
                                                    await widget.docReference!
                                                        .update(
                                                            createOpcoesEscolhaRecordData(
                                                      escolha:
                                                          createOpcoesVariaveisStruct(
                                                        fieldValues: {
                                                          'IRPF': FieldValue
                                                              .arrayRemove([
                                                            widget.listaNome
                                                          ]),
                                                        },
                                                        clearUnsetFields: false,
                                                      ),
                                                    ));
                                                  } else {
                                                    if (widget.titulolistview ==
                                                        'ESTADO CIVIL') {
                                                      await widget.docReference!
                                                          .update(
                                                              createOpcoesEscolhaRecordData(
                                                        escolha:
                                                            createOpcoesVariaveisStruct(
                                                          fieldValues: {
                                                            'estado_civil':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              _model.listName
                                                            ]),
                                                          },
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                      ));
                                                    } else {
                                                      if (widget
                                                              .titulolistview ==
                                                          'REGIME DE UNIÃO') {
                                                        await widget
                                                            .docReference!
                                                            .update(
                                                                createOpcoesEscolhaRecordData(
                                                          escolha:
                                                              createOpcoesVariaveisStruct(
                                                            fieldValues: {
                                                              'suitabilities':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                widget.listaNome
                                                              ]),
                                                            },
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                        ));
                                                      } else {
                                                        if (widget
                                                                .titulolistview ==
                                                            'DEPENDENTES') {
                                                          await widget
                                                              .docReference!
                                                              .update(
                                                                  createOpcoesEscolhaRecordData(
                                                            escolha:
                                                                createOpcoesVariaveisStruct(
                                                              fieldValues: {
                                                                'suitabilities':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  widget
                                                                      .listaNome
                                                                ]),
                                                              },
                                                              clearUnsetFields:
                                                                  false,
                                                            ),
                                                          ));
                                                        } else {
                                                          if (widget
                                                                  .titulolistview ==
                                                              'PROFISSIONAL') {
                                                            await widget
                                                                .docReference!
                                                                .update(
                                                                    createOpcoesEscolhaRecordData(
                                                              escolha:
                                                                  createOpcoesVariaveisStruct(
                                                                fieldValues: {
                                                                  'suitabilities':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    widget
                                                                        .listaNome
                                                                  ]),
                                                                },
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                            ));
                                                          } else {
                                                            if (widget
                                                                    .titulolistview ==
                                                                'ATIVO') {
                                                              await widget
                                                                  .docReference!
                                                                  .update(
                                                                      createOpcoesEscolhaRecordData(
                                                                escolha:
                                                                    createOpcoesVariaveisStruct(
                                                                  fieldValues: {
                                                                    'suitabilities':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      widget
                                                                          .listaNome
                                                                    ]),
                                                                  },
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            } else {
                                                              if (widget
                                                                      .titulolistview ==
                                                                  'PASSIVO') {
                                                                await widget
                                                                    .docReference!
                                                                    .update(
                                                                        createOpcoesEscolhaRecordData(
                                                                  escolha:
                                                                      createOpcoesVariaveisStruct(
                                                                    fieldValues: {
                                                                      'suitabilities':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        widget
                                                                            .listaNome
                                                                      ]),
                                                                    },
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                ));
                                                              } else {
                                                                if (widget
                                                                        .titulolistview ==
                                                                    'CONSUMO PATRIMÔNIO') {
                                                                  await widget
                                                                      .docReference!
                                                                      .update(
                                                                          createOpcoesEscolhaRecordData(
                                                                    escolha:
                                                                        createOpcoesVariaveisStruct(
                                                                      fieldValues: {
                                                                        'suitabilities':
                                                                            FieldValue.arrayRemove([
                                                                          widget
                                                                              .listaNome
                                                                        ]),
                                                                      },
                                                                      clearUnsetFields:
                                                                          false,
                                                                    ),
                                                                  ));
                                                                } else {
                                                                  if (widget
                                                                          .titulolistview ==
                                                                      'STATUS PATRIMÔNIO') {
                                                                    await widget
                                                                        .docReference!
                                                                        .update(
                                                                            createOpcoesEscolhaRecordData(
                                                                      escolha:
                                                                          createOpcoesVariaveisStruct(
                                                                        fieldValues: {
                                                                          'suitabilities':
                                                                              FieldValue.arrayRemove([
                                                                            widget.listaNome
                                                                          ]),
                                                                        },
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    ));
                                                                  } else {
                                                                    if (widget
                                                                            .titulolistview ==
                                                                        'EMPRESAS') {
                                                                      await widget
                                                                          .docReference!
                                                                          .update(
                                                                              createOpcoesEscolhaRecordData(
                                                                        escolha:
                                                                            createOpcoesVariaveisStruct(
                                                                          fieldValues: {
                                                                            'suitabilities':
                                                                                FieldValue.arrayRemove([
                                                                              widget.listaNome
                                                                            ]),
                                                                          },
                                                                          clearUnsetFields:
                                                                              false,
                                                                        ),
                                                                      ));
                                                                    } else {
                                                                      if (widget
                                                                              .titulolistview ==
                                                                          'TIPO') {
                                                                        await widget
                                                                            .docReference!
                                                                            .update(createOpcoesEscolhaRecordData(
                                                                          escolha:
                                                                              createOpcoesVariaveisStruct(
                                                                            fieldValues: {
                                                                              'suitabilities': FieldValue.arrayRemove([
                                                                                widget.listaNome
                                                                              ]),
                                                                            },
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                        ));
                                                                      } else {
                                                                        if (widget.titulolistview ==
                                                                            'PAGAMENTO') {
                                                                          await widget
                                                                              .docReference!
                                                                              .update(createOpcoesEscolhaRecordData(
                                                                            escolha:
                                                                                createOpcoesVariaveisStruct(
                                                                              fieldValues: {
                                                                                'suitabilities': FieldValue.arrayRemove([
                                                                                  widget.listaNome
                                                                                ]),
                                                                              },
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                          ));
                                                                        } else {
                                                                          if (widget.titulolistview ==
                                                                              'RECEBIMENTO') {
                                                                            await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                              escolha: createOpcoesVariaveisStruct(
                                                                                fieldValues: {
                                                                                  'suitabilities': FieldValue.arrayRemove([
                                                                                    widget.listaNome
                                                                                  ]),
                                                                                },
                                                                                clearUnsetFields: false,
                                                                              ),
                                                                            ));
                                                                          } else {
                                                                            if (widget.titulolistview ==
                                                                                'PERFIL') {
                                                                              await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                escolha: createOpcoesVariaveisStruct(
                                                                                  fieldValues: {
                                                                                    'suitabilities': FieldValue.arrayRemove([
                                                                                      widget.listaNome
                                                                                    ]),
                                                                                  },
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
