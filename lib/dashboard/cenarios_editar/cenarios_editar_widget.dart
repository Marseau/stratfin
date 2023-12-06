import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cenarios_editar_model.dart';
export 'cenarios_editar_model.dart';

class CenariosEditarWidget extends StatefulWidget {
  const CenariosEditarWidget({
    super.key,
    this.tituloListView,
    this.listaCampoItem,
    required this.docReference,
    this.itemCampoItem,
    this.newData,
    required this.colecao,
  });

  final String? tituloListView;
  final String? listaCampoItem;
  final DocumentReference? docReference;
  final int? itemCampoItem;
  final List<String>? newData;
  final OpcoesVariaveisStruct? colecao;

  @override
  _CenariosEditarWidgetState createState() => _CenariosEditarWidgetState();
}

class _CenariosEditarWidgetState extends State<CenariosEditarWidget> {
  late CenariosEditarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CenariosEditarModel());

    _model.tituloController ??=
        TextEditingController(text: 'Editar  ${widget.tituloListView}');
    _model.tituloFocusNode ??= FocusNode();

    _model.descricaoController ??=
        TextEditingController(text: widget.listaCampoItem);
    _model.descricaoFocusNode ??= FocusNode();

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

    return Align(
      alignment: const AlignmentDirectional(0.00, 1.00),
      child: SizedBox(
        width: 390.0,
        height: 420.0,
        child: Stack(
          alignment: const AlignmentDirectional(0.0, 1.0),
          children: [
            Align(
              alignment: const AlignmentDirectional(0.00, 0.00),
              child: Container(
                width: 375.0,
                height: 475.0,
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
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                child: Theme(
                  data: ThemeData(
                    checkboxTheme: const CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    unselectedWidgetColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                  child: CheckboxListTile(
                    value: _model.checkboxListTileValue ??= true,
                    onChanged: (newValue) async {
                      setState(() => _model.checkboxListTileValue = newValue!);
                    },
                    title: Text(
                      'Title',
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    subtitle: Text(
                      'Subtitle goes here...',
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.00, 1.00),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(1.00, -1.00),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 36.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: const AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      40.0, 0.0, 15.0, 0.0),
                                  child: SizedBox(
                                    width: 250.0,
                                    child: TextFormField(
                                      controller: _model.tituloController,
                                      focusNode: _model.tituloFocusNode,
                                      readOnly: true,
                                      obscureText: false,
                                      decoration: const InputDecoration(
                                        isDense: true,
                                        labelStyle: TextStyle(
                                          color: Color(0xFF00800F),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0,
                                        ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16.0, 16.0, 0.0, 16.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMediumFamily,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMediumFamily),
                                          ),
                                      textAlign: TextAlign.start,
                                      cursorColor: const Color(0xFF00000F),
                                      validator: _model
                                          .tituloControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1.00, -1.00),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 22.0,
                                  borderWidth: 0.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).asparagus,
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 22.0,
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 54.0),
                        child: SizedBox(
                          width: 250.0,
                          child: TextFormField(
                            controller: _model.descricaoController,
                            focusNode: _model.descricaoFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.descricaoController',
                              const Duration(milliseconds: 500),
                              () async {
                                setState(() {
                                  _model.descricao =
                                      _model.descricaoController.text;
                                });
                              },
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Descrição',
                              labelStyle: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .customStarPrimary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 0.0, 16.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w300,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                            textAlign: TextAlign.start,
                            cursorColor: FlutterFlowTheme.of(context).accent1,
                            validator: _model.descricaoControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 24.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Cancelar',
                          options: FFButtonOptions(
                            width: 250.0,
                            height: 52.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).asparagus,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelLargeFamily,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelLargeFamily),
                                ),
                            borderRadius: BorderRadius.circular(12.0),
                            hoverColor:
                                FlutterFlowTheme.of(context).hookersGreen,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 24.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (widget.tituloListView == 'PERFIL') {
                              if (widget.listaCampoItem ==
                                  _model.descricaoController.text) {
                                Navigator.pop(context);
                                return;
                              } else {
                                await widget.docReference!
                                    .update(createOpcoesEscolhaRecordData(
                                  escolha: createOpcoesVariaveisStruct(
                                    fieldValues: {
                                      'suitabilities': FieldValue.arrayUnion(
                                          [_model.descricaoController.text]),
                                    },
                                    clearUnsetFields: false,
                                  ),
                                ));

                                await widget.docReference!
                                    .update(createOpcoesEscolhaRecordData(
                                  escolha: createOpcoesVariaveisStruct(
                                    fieldValues: {
                                      'suitabilities': FieldValue.arrayRemove(
                                          [widget.listaCampoItem]),
                                    },
                                    clearUnsetFields: false,
                                  ),
                                ));
                                Navigator.pop(context);
                              }
                            } else {
                              if (widget.tituloListView ==
                                  'GÊNERO (aposentadoria)') {
                                if (widget.listaCampoItem ==
                                    _model.descricaoController.text) {
                                  Navigator.pop(context);
                                  return;
                                } else {
                                  await widget.docReference!
                                      .update(createOpcoesEscolhaRecordData(
                                    escolha: createOpcoesVariaveisStruct(
                                      fieldValues: {
                                        'generos': FieldValue.arrayUnion(
                                            [_model.descricaoController.text]),
                                      },
                                      clearUnsetFields: false,
                                    ),
                                  ));

                                  await widget.docReference!
                                      .update(createOpcoesEscolhaRecordData(
                                    escolha: createOpcoesVariaveisStruct(
                                      fieldValues: {
                                        'generos': FieldValue.arrayRemove(
                                            [widget.listaCampoItem]),
                                      },
                                      clearUnsetFields: false,
                                    ),
                                  ));
                                  Navigator.pop(context);
                                }
                              } else {
                                if (widget.tituloListView == 'IRPF') {
                                  if (widget.listaCampoItem ==
                                      _model.descricaoController.text) {
                                    Navigator.pop(context);
                                    return;
                                  } else {
                                    await widget.docReference!
                                        .update(createOpcoesEscolhaRecordData(
                                      escolha: createOpcoesVariaveisStruct(
                                        fieldValues: {
                                          'IRPF': FieldValue.arrayUnion([
                                            _model.descricaoController.text
                                          ]),
                                        },
                                        clearUnsetFields: false,
                                      ),
                                    ));

                                    await widget.docReference!
                                        .update(createOpcoesEscolhaRecordData(
                                      escolha: createOpcoesVariaveisStruct(
                                        fieldValues: {
                                          'IRPF': FieldValue.arrayRemove(
                                              [widget.listaCampoItem]),
                                        },
                                        clearUnsetFields: false,
                                      ),
                                    ));
                                    Navigator.pop(context);
                                  }
                                } else {
                                  if (widget.tituloListView == 'ESTADO CIVIL') {
                                    if (widget.listaCampoItem ==
                                        _model.descricaoController.text) {
                                      Navigator.pop(context);
                                      return;
                                    } else {
                                      await widget.docReference!
                                          .update(createOpcoesEscolhaRecordData(
                                        escolha: createOpcoesVariaveisStruct(
                                          fieldValues: {
                                            'estado_civil':
                                                FieldValue.arrayUnion([
                                              _model.descricaoController.text
                                            ]),
                                          },
                                          clearUnsetFields: false,
                                        ),
                                      ));

                                      await widget.docReference!
                                          .update(createOpcoesEscolhaRecordData(
                                        escolha: createOpcoesVariaveisStruct(
                                          fieldValues: {
                                            'estado_civil':
                                                FieldValue.arrayRemove(
                                                    [widget.listaCampoItem]),
                                          },
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                      Navigator.pop(context);
                                    }
                                  } else {
                                    if (widget.tituloListView ==
                                        'REGIME DE UNIÃO') {
                                      if (widget.listaCampoItem ==
                                          _model.descricaoController.text) {
                                        Navigator.pop(context);
                                        return;
                                      } else {
                                        await widget.docReference!.update(
                                            createOpcoesEscolhaRecordData(
                                          escolha: createOpcoesVariaveisStruct(
                                            fieldValues: {
                                              'regimeuniao':
                                                  FieldValue.arrayUnion([
                                                _model.descricaoController.text
                                              ]),
                                            },
                                            clearUnsetFields: false,
                                          ),
                                        ));

                                        await widget.docReference!.update(
                                            createOpcoesEscolhaRecordData(
                                          escolha: createOpcoesVariaveisStruct(
                                            fieldValues: {
                                              'regimeuniao':
                                                  FieldValue.arrayRemove(
                                                      [widget.listaCampoItem]),
                                            },
                                            clearUnsetFields: false,
                                          ),
                                        ));
                                        Navigator.pop(context);
                                      }
                                    } else {
                                      if (widget.tituloListView ==
                                          'DEPENDENTES') {
                                        if (widget.listaCampoItem ==
                                            _model.descricaoController.text) {
                                          Navigator.pop(context);
                                          return;
                                        } else {
                                          await widget.docReference!.update(
                                              createOpcoesEscolhaRecordData(
                                            escolha:
                                                createOpcoesVariaveisStruct(
                                              fieldValues: {
                                                'dependentes':
                                                    FieldValue.arrayUnion([
                                                  _model
                                                      .descricaoController.text
                                                ]),
                                              },
                                              clearUnsetFields: false,
                                            ),
                                          ));

                                          await widget.docReference!.update(
                                              createOpcoesEscolhaRecordData(
                                            escolha:
                                                createOpcoesVariaveisStruct(
                                              fieldValues: {
                                                'dependentes':
                                                    FieldValue.arrayRemove([
                                                  widget.listaCampoItem
                                                ]),
                                              },
                                              clearUnsetFields: false,
                                            ),
                                          ));
                                          Navigator.pop(context);
                                        }
                                      } else {
                                        if (widget.tituloListView ==
                                            'PROFISSIONAL') {
                                          if (widget.listaCampoItem ==
                                              _model.descricaoController.text) {
                                            Navigator.pop(context);
                                            return;
                                          } else {
                                            await widget.docReference!.update(
                                                createOpcoesEscolhaRecordData(
                                              escolha:
                                                  createOpcoesVariaveisStruct(
                                                fieldValues: {
                                                  'vinculoprofissional':
                                                      FieldValue.arrayUnion([
                                                    _model.descricaoController
                                                        .text
                                                  ]),
                                                },
                                                clearUnsetFields: false,
                                              ),
                                            ));

                                            await widget.docReference!.update(
                                                createOpcoesEscolhaRecordData(
                                              escolha:
                                                  createOpcoesVariaveisStruct(
                                                fieldValues: {
                                                  'vinculoprofissional':
                                                      FieldValue.arrayRemove([
                                                    widget.listaCampoItem
                                                  ]),
                                                },
                                                clearUnsetFields: false,
                                              ),
                                            ));
                                            Navigator.pop(context);
                                          }
                                        } else {
                                          if (widget.tituloListView ==
                                              'ATIVO') {
                                            if (widget.listaCampoItem ==
                                                _model
                                                    .descricaoController.text) {
                                              Navigator.pop(context);
                                              return;
                                            } else {
                                              await widget.docReference!.update(
                                                  createOpcoesEscolhaRecordData(
                                                escolha:
                                                    createOpcoesVariaveisStruct(
                                                  fieldValues: {
                                                    'ativotipo':
                                                        FieldValue.arrayUnion([
                                                      _model.descricaoController
                                                          .text
                                                    ]),
                                                  },
                                                  clearUnsetFields: false,
                                                ),
                                              ));

                                              await widget.docReference!.update(
                                                  createOpcoesEscolhaRecordData(
                                                escolha:
                                                    createOpcoesVariaveisStruct(
                                                  fieldValues: {
                                                    'ativotipo':
                                                        FieldValue.arrayRemove([
                                                      widget.listaCampoItem
                                                    ]),
                                                  },
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                              Navigator.pop(context);
                                            }
                                          } else {
                                            if (widget.tituloListView ==
                                                'PASSIVO') {
                                              if (widget.listaCampoItem ==
                                                  _model.descricaoController
                                                      .text) {
                                                Navigator.pop(context);
                                                return;
                                              } else {
                                                await widget.docReference!.update(
                                                    createOpcoesEscolhaRecordData(
                                                  escolha:
                                                      createOpcoesVariaveisStruct(
                                                    fieldValues: {
                                                      'passivotipo': FieldValue
                                                          .arrayUnion([
                                                        _model
                                                            .descricaoController
                                                            .text
                                                      ]),
                                                    },
                                                    clearUnsetFields: false,
                                                  ),
                                                ));

                                                await widget.docReference!.update(
                                                    createOpcoesEscolhaRecordData(
                                                  escolha:
                                                      createOpcoesVariaveisStruct(
                                                    fieldValues: {
                                                      'passivotipo': FieldValue
                                                          .arrayRemove([
                                                        widget.listaCampoItem
                                                      ]),
                                                    },
                                                    clearUnsetFields: false,
                                                  ),
                                                ));
                                                Navigator.pop(context);
                                              }
                                            } else {
                                              if (widget.tituloListView ==
                                                  'CONSUMO PATRIMÔNIO') {
                                                if (widget.listaCampoItem ==
                                                    _model.descricaoController
                                                        .text) {
                                                  Navigator.pop(context);
                                                  return;
                                                } else {
                                                  await widget.docReference!.update(
                                                      createOpcoesEscolhaRecordData(
                                                    escolha:
                                                        createOpcoesVariaveisStruct(
                                                      fieldValues: {
                                                        'consumopatrimonio':
                                                            FieldValue
                                                                .arrayUnion([
                                                          _model
                                                              .descricaoController
                                                              .text
                                                        ]),
                                                      },
                                                      clearUnsetFields: false,
                                                    ),
                                                  ));

                                                  await widget.docReference!.update(
                                                      createOpcoesEscolhaRecordData(
                                                    escolha:
                                                        createOpcoesVariaveisStruct(
                                                      fieldValues: {
                                                        'consumopatrimonio':
                                                            FieldValue
                                                                .arrayRemove([
                                                          widget.listaCampoItem
                                                        ]),
                                                      },
                                                      clearUnsetFields: false,
                                                    ),
                                                  ));
                                                  Navigator.pop(context);
                                                }
                                              } else {
                                                if (widget.tituloListView ==
                                                    'STATUS PATRIMÔNIO') {
                                                  if (widget.listaCampoItem ==
                                                      _model.descricaoController
                                                          .text) {
                                                    Navigator.pop(context);
                                                    return;
                                                  } else {
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
                                                                .descricaoController
                                                                .text
                                                          ]),
                                                        },
                                                        clearUnsetFields: false,
                                                      ),
                                                    ));

                                                    await widget.docReference!
                                                        .update(
                                                            createOpcoesEscolhaRecordData(
                                                      escolha:
                                                          createOpcoesVariaveisStruct(
                                                        fieldValues: {
                                                          'statuspatrimonio':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            widget
                                                                .listaCampoItem
                                                          ]),
                                                        },
                                                        clearUnsetFields: false,
                                                      ),
                                                    ));
                                                    Navigator.pop(context);
                                                  }
                                                } else {
                                                  if (widget.tituloListView ==
                                                      'PROJETO DE VIDA') {
                                                    if (widget.listaCampoItem ==
                                                        _model
                                                            .descricaoController
                                                            .text) {
                                                      Navigator.pop(context);
                                                      return;
                                                    } else {
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
                                                                  .descricaoController
                                                                  .text
                                                            ]),
                                                          },
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                      ));

                                                      await widget.docReference!
                                                          .update(
                                                              createOpcoesEscolhaRecordData(
                                                        escolha:
                                                            createOpcoesVariaveisStruct(
                                                          fieldValues: {
                                                            'projetosvida':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              widget
                                                                  .listaCampoItem
                                                            ]),
                                                          },
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                      ));
                                                      Navigator.pop(context);
                                                    }
                                                  } else {
                                                    if (widget.tituloListView ==
                                                        'EMPRESAS') {
                                                      if (widget
                                                              .listaCampoItem ==
                                                          _model
                                                              .descricaoController
                                                              .text) {
                                                        Navigator.pop(context);
                                                        return;
                                                      } else {
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
                                                                    .descricaoController
                                                                    .text
                                                              ]),
                                                            },
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                        ));

                                                        await widget
                                                            .docReference!
                                                            .update(
                                                                createOpcoesEscolhaRecordData(
                                                          escolha:
                                                              createOpcoesVariaveisStruct(
                                                            fieldValues: {
                                                              'seguroempresa':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                widget
                                                                    .listaCampoItem
                                                              ]),
                                                            },
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                        ));
                                                        Navigator.pop(context);
                                                      }
                                                    } else {
                                                      if (widget
                                                              .tituloListView ==
                                                          'TIPO') {
                                                        if (widget
                                                                .listaCampoItem ==
                                                            _model
                                                                .descricaoController
                                                                .text) {
                                                          Navigator.pop(
                                                              context);
                                                          return;
                                                        } else {
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
                                                                      .descricaoController
                                                                      .text
                                                                ]),
                                                              },
                                                              clearUnsetFields:
                                                                  false,
                                                            ),
                                                          ));

                                                          await widget
                                                              .docReference!
                                                              .update(
                                                                  createOpcoesEscolhaRecordData(
                                                            escolha:
                                                                createOpcoesVariaveisStruct(
                                                              fieldValues: {
                                                                'segurotipo':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  widget
                                                                      .listaCampoItem
                                                                ]),
                                                              },
                                                              clearUnsetFields:
                                                                  false,
                                                            ),
                                                          ));
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      } else {
                                                        if (widget
                                                                .tituloListView ==
                                                            'PAGAMENTO') {
                                                          if (widget
                                                                  .listaCampoItem ==
                                                              _model
                                                                  .descricaoController
                                                                  .text) {
                                                            Navigator.pop(
                                                                context);
                                                            return;
                                                          } else {
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
                                                                        .descricaoController
                                                                        .text
                                                                  ]),
                                                                },
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                            ));

                                                            await widget
                                                                .docReference!
                                                                .update(
                                                                    createOpcoesEscolhaRecordData(
                                                              escolha:
                                                                  createOpcoesVariaveisStruct(
                                                                fieldValues: {
                                                                  'pagamento':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    widget
                                                                        .listaCampoItem
                                                                  ]),
                                                                },
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                            ));
                                                            Navigator.pop(
                                                                context);
                                                          }
                                                        } else {
                                                          if (widget
                                                                  .tituloListView ==
                                                              'RECEBIMENTO') {
                                                            if (widget
                                                                    .listaCampoItem ==
                                                                _model
                                                                    .descricaoController
                                                                    .text) {
                                                              Navigator.pop(
                                                                  context);
                                                              return;
                                                            } else {
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
                                                                          .descricaoController
                                                                          .text
                                                                    ]),
                                                                  },
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));

                                                              await widget
                                                                  .docReference!
                                                                  .update(
                                                                      createOpcoesEscolhaRecordData(
                                                                escolha:
                                                                    createOpcoesVariaveisStruct(
                                                                  fieldValues: {
                                                                    'recebimento':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      widget
                                                                          .listaCampoItem
                                                                    ]),
                                                                  },
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                              Navigator.pop(
                                                                  context);
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
                          text: 'Salvar',
                          icon: const Icon(
                            Icons.check_rounded,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: 250.0,
                            height: 52.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).charcoal,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelLargeFamily,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelLargeFamily),
                                ),
                            borderRadius: BorderRadius.circular(12.0),
                            hoverColor: FlutterFlowTheme.of(context)
                                .royalBlueTraditional,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
