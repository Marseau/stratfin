import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_editar_model.dart';
export 'bottom_editar_model.dart';

class BottomEditarWidget extends StatefulWidget {
  const BottomEditarWidget({
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
  _BottomEditarWidgetState createState() => _BottomEditarWidgetState();
}

class _BottomEditarWidgetState extends State<BottomEditarWidget> {
  late BottomEditarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomEditarModel());

    _model.tituloController1 ??=
        TextEditingController(text: 'Editar  ${widget.tituloListView}');
    _model.tituloFocusNode1 ??= FocusNode();

    _model.descricaoController1 ??=
        TextEditingController(text: widget.listaCampoItem);
    _model.descricaoFocusNode1 ??= FocusNode();

    _model.tituloController2 ??=
        TextEditingController(text: 'Editar  ${widget.tituloListView}');
    _model.tituloFocusNode2 ??= FocusNode();

    _model.descricaoController2 ??=
        TextEditingController(text: widget.listaCampoItem);
    _model.descricaoFocusNode2 ??= FocusNode();

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
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.00, 1.00),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(1.00, -1.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 36.0),
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
                                    controller: _model.tituloController1,
                                    focusNode: _model.tituloFocusNode1,
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
                                    validator: _model.tituloController1Validator
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
                                  color: FlutterFlowTheme.of(context).alternate,
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 54.0),
                      child: SizedBox(
                        width: 250.0,
                        child: TextFormField(
                          controller: _model.descricaoController1,
                          focusNode: _model.descricaoFocusNode1,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.descricaoController1',
                            const Duration(milliseconds: 500),
                            () async {
                              setState(() {
                                _model.descricao =
                                    _model.descricaoController1.text;
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
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          textAlign: TextAlign.start,
                          cursorColor: FlutterFlowTheme.of(context).accent1,
                          validator: _model.descricaoController1Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 24.0),
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
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelLargeFamily),
                              ),
                          borderRadius: BorderRadius.circular(12.0),
                          hoverColor: FlutterFlowTheme.of(context).hookersGreen,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 24.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (widget.tituloListView == 'PERFIL') {
                            if (widget.listaCampoItem ==
                                _model.descricaoController1.text) {
                              Navigator.pop(context);
                              return;
                            } else {
                              await widget.docReference!
                                  .update(createOpcoesEscolhaRecordData(
                                escolha: createOpcoesVariaveisStruct(
                                  fieldValues: {
                                    'suitabilities': FieldValue.arrayUnion(
                                        [_model.descricaoController1.text]),
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
                                  _model.descricaoController1.text) {
                                Navigator.pop(context);
                                return;
                              } else {
                                await widget.docReference!
                                    .update(createOpcoesEscolhaRecordData(
                                  escolha: createOpcoesVariaveisStruct(
                                    fieldValues: {
                                      'generos': FieldValue.arrayUnion(
                                          [_model.descricaoController1.text]),
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
                                    _model.descricaoController1.text) {
                                  Navigator.pop(context);
                                  return;
                                } else {
                                  await widget.docReference!
                                      .update(createOpcoesEscolhaRecordData(
                                    escolha: createOpcoesVariaveisStruct(
                                      fieldValues: {
                                        'IRPF': FieldValue.arrayUnion(
                                            [_model.descricaoController1.text]),
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
                                      _model.descricaoController1.text) {
                                    Navigator.pop(context);
                                    return;
                                  } else {
                                    await widget.docReference!
                                        .update(createOpcoesEscolhaRecordData(
                                      escolha: createOpcoesVariaveisStruct(
                                        fieldValues: {
                                          'estado_civil':
                                              FieldValue.arrayUnion([
                                            _model.descricaoController1.text
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
                                        _model.descricaoController1.text) {
                                      Navigator.pop(context);
                                      return;
                                    } else {
                                      await widget.docReference!
                                          .update(createOpcoesEscolhaRecordData(
                                        escolha: createOpcoesVariaveisStruct(
                                          fieldValues: {
                                            'regimeuniao':
                                                FieldValue.arrayUnion([
                                              _model.descricaoController1.text
                                            ]),
                                          },
                                          clearUnsetFields: false,
                                        ),
                                      ));

                                      await widget.docReference!
                                          .update(createOpcoesEscolhaRecordData(
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
                                          _model.descricaoController1.text) {
                                        Navigator.pop(context);
                                        return;
                                      } else {
                                        await widget.docReference!.update(
                                            createOpcoesEscolhaRecordData(
                                          escolha: createOpcoesVariaveisStruct(
                                            fieldValues: {
                                              'dependentes':
                                                  FieldValue.arrayUnion([
                                                _model.descricaoController1.text
                                              ]),
                                            },
                                            clearUnsetFields: false,
                                          ),
                                        ));

                                        await widget.docReference!.update(
                                            createOpcoesEscolhaRecordData(
                                          escolha: createOpcoesVariaveisStruct(
                                            fieldValues: {
                                              'dependentes':
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
                                          'PROFISSIONAL') {
                                        if (widget.listaCampoItem ==
                                            _model.descricaoController1.text) {
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
                                                  _model
                                                      .descricaoController1.text
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
                                        if (widget.tituloListView == 'ATIVO') {
                                          if (widget.listaCampoItem ==
                                              _model
                                                  .descricaoController1.text) {
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
                                                    _model.descricaoController1
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
                                                _model.descricaoController1
                                                    .text) {
                                              Navigator.pop(context);
                                              return;
                                            } else {
                                              await widget.docReference!.update(
                                                  createOpcoesEscolhaRecordData(
                                                escolha:
                                                    createOpcoesVariaveisStruct(
                                                  fieldValues: {
                                                    'passivotipo':
                                                        FieldValue.arrayUnion([
                                                      _model
                                                          .descricaoController1
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
                                                    'passivotipo':
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
                                                'CONSUMO PATRIMÔNIO') {
                                              if (widget.listaCampoItem ==
                                                  _model.descricaoController1
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
                                                            .descricaoController1
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
                                                    _model.descricaoController1
                                                        .text) {
                                                  Navigator.pop(context);
                                                  return;
                                                } else {
                                                  await widget.docReference!.update(
                                                      createOpcoesEscolhaRecordData(
                                                    escolha:
                                                        createOpcoesVariaveisStruct(
                                                      fieldValues: {
                                                        'statuspatrimonio':
                                                            FieldValue
                                                                .arrayUnion([
                                                          _model
                                                              .descricaoController1
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
                                                        'statuspatrimonio':
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
                                                    'PROJETO DE VIDA') {
                                                  if (widget.listaCampoItem ==
                                                      _model
                                                          .descricaoController1
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
                                                                .descricaoController1
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
                                                          'projetosvida':
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
                                                      'EMPRESAS') {
                                                    if (widget.listaCampoItem ==
                                                        _model
                                                            .descricaoController1
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
                                                            'seguroempresa':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              _model
                                                                  .descricaoController1
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
                                                    if (widget.tituloListView ==
                                                        'TIPO') {
                                                      if (widget
                                                              .listaCampoItem ==
                                                          _model
                                                              .descricaoController1
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
                                                              'segurotipo':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                _model
                                                                    .descricaoController1
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
                                                        Navigator.pop(context);
                                                      }
                                                    } else {
                                                      if (widget
                                                              .tituloListView ==
                                                          'PAGAMENTO') {
                                                        if (widget
                                                                .listaCampoItem ==
                                                            _model
                                                                .descricaoController1
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
                                                                      .descricaoController1
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
                                                                  .descricaoController1
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
                                                                        .descricaoController1
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
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelLargeFamily),
                              ),
                          borderRadius: BorderRadius.circular(12.0),
                          hoverColor:
                              FlutterFlowTheme.of(context).royalBlueTraditional,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.00, 1.00),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(1.00, -1.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 36.0),
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
                                    controller: _model.tituloController2,
                                    focusNode: _model.tituloFocusNode2,
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
                                    validator: _model.tituloController2Validator
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
                                borderColor: Colors.transparent,
                                borderRadius: 22.0,
                                borderWidth: 0.0,
                                buttonSize: 40.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).asparagus,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: FlutterFlowTheme.of(context).alternate,
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 54.0),
                      child: SizedBox(
                        width: 250.0,
                        child: TextFormField(
                          controller: _model.descricaoController2,
                          focusNode: _model.descricaoFocusNode2,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.descricaoController2',
                            const Duration(milliseconds: 500),
                            () async {
                              setState(() {
                                _model.descricao =
                                    _model.descricaoController2.text;
                              });
                            },
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Descrição',
                            labelStyle: TextStyle(
                              color: FlutterFlowTheme.of(context).asparagus,
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
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          textAlign: TextAlign.start,
                          cursorColor: FlutterFlowTheme.of(context).accent1,
                          validator: _model.descricaoController2Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 24.0),
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
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelLargeFamily),
                              ),
                          borderRadius: BorderRadius.circular(12.0),
                          hoverColor: FlutterFlowTheme.of(context).hookersGreen,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 24.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (widget.tituloListView == 'PERFIL') {
                            if (widget.listaCampoItem ==
                                _model.descricaoController2.text) {
                              Navigator.pop(context);
                              return;
                            } else {
                              await widget.docReference!
                                  .update(createOpcoesEscolhaRecordData(
                                escolha: createOpcoesVariaveisStruct(
                                  fieldValues: {
                                    'suitabilities': FieldValue.arrayUnion(
                                        [_model.descricaoController2.text]),
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
                                  _model.descricaoController2.text) {
                                Navigator.pop(context);
                                return;
                              } else {
                                await widget.docReference!
                                    .update(createOpcoesEscolhaRecordData(
                                  escolha: createOpcoesVariaveisStruct(
                                    fieldValues: {
                                      'generos': FieldValue.arrayUnion(
                                          [_model.descricaoController2.text]),
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
                                    _model.descricaoController2.text) {
                                  Navigator.pop(context);
                                  return;
                                } else {
                                  await widget.docReference!
                                      .update(createOpcoesEscolhaRecordData(
                                    escolha: createOpcoesVariaveisStruct(
                                      fieldValues: {
                                        'IRPF': FieldValue.arrayUnion(
                                            [_model.descricaoController2.text]),
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
                                      _model.descricaoController2.text) {
                                    Navigator.pop(context);
                                    return;
                                  } else {
                                    await widget.docReference!
                                        .update(createOpcoesEscolhaRecordData(
                                      escolha: createOpcoesVariaveisStruct(
                                        fieldValues: {
                                          'estado_civil':
                                              FieldValue.arrayUnion([
                                            _model.descricaoController2.text
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
                                        _model.descricaoController2.text) {
                                      Navigator.pop(context);
                                      return;
                                    } else {
                                      await widget.docReference!
                                          .update(createOpcoesEscolhaRecordData(
                                        escolha: createOpcoesVariaveisStruct(
                                          fieldValues: {
                                            'regimeuniao':
                                                FieldValue.arrayUnion([
                                              _model.descricaoController2.text
                                            ]),
                                          },
                                          clearUnsetFields: false,
                                        ),
                                      ));

                                      await widget.docReference!
                                          .update(createOpcoesEscolhaRecordData(
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
                                          _model.descricaoController2.text) {
                                        Navigator.pop(context);
                                        return;
                                      } else {
                                        await widget.docReference!.update(
                                            createOpcoesEscolhaRecordData(
                                          escolha: createOpcoesVariaveisStruct(
                                            fieldValues: {
                                              'dependentes':
                                                  FieldValue.arrayUnion([
                                                _model.descricaoController2.text
                                              ]),
                                            },
                                            clearUnsetFields: false,
                                          ),
                                        ));

                                        await widget.docReference!.update(
                                            createOpcoesEscolhaRecordData(
                                          escolha: createOpcoesVariaveisStruct(
                                            fieldValues: {
                                              'dependentes':
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
                                          'PROFISSIONAL') {
                                        if (widget.listaCampoItem ==
                                            _model.descricaoController2.text) {
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
                                                  _model
                                                      .descricaoController2.text
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
                                        if (widget.tituloListView == 'ATIVO') {
                                          if (widget.listaCampoItem ==
                                              _model
                                                  .descricaoController2.text) {
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
                                                    _model.descricaoController2
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
                                                _model.descricaoController2
                                                    .text) {
                                              Navigator.pop(context);
                                              return;
                                            } else {
                                              await widget.docReference!.update(
                                                  createOpcoesEscolhaRecordData(
                                                escolha:
                                                    createOpcoesVariaveisStruct(
                                                  fieldValues: {
                                                    'passivotipo':
                                                        FieldValue.arrayUnion([
                                                      _model
                                                          .descricaoController2
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
                                                    'passivotipo':
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
                                                'CONSUMO PATRIMÔNIO') {
                                              if (widget.listaCampoItem ==
                                                  _model.descricaoController2
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
                                                            .descricaoController2
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
                                                    _model.descricaoController2
                                                        .text) {
                                                  Navigator.pop(context);
                                                  return;
                                                } else {
                                                  await widget.docReference!.update(
                                                      createOpcoesEscolhaRecordData(
                                                    escolha:
                                                        createOpcoesVariaveisStruct(
                                                      fieldValues: {
                                                        'statuspatrimonio':
                                                            FieldValue
                                                                .arrayUnion([
                                                          _model
                                                              .descricaoController2
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
                                                        'statuspatrimonio':
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
                                                    'PROJETO DE VIDA') {
                                                  if (widget.listaCampoItem ==
                                                      _model
                                                          .descricaoController2
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
                                                                .descricaoController2
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
                                                          'projetosvida':
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
                                                      'EMPRESAS') {
                                                    if (widget.listaCampoItem ==
                                                        _model
                                                            .descricaoController2
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
                                                            'seguroempresa':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              _model
                                                                  .descricaoController2
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
                                                    if (widget.tituloListView ==
                                                        'TIPO') {
                                                      if (widget
                                                              .listaCampoItem ==
                                                          _model
                                                              .descricaoController2
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
                                                              'segurotipo':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                _model
                                                                    .descricaoController2
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
                                                        Navigator.pop(context);
                                                      }
                                                    } else {
                                                      if (widget
                                                              .tituloListView ==
                                                          'PAGAMENTO') {
                                                        if (widget
                                                                .listaCampoItem ==
                                                            _model
                                                                .descricaoController2
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
                                                                      .descricaoController2
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
                                                                  .descricaoController2
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
                                                                        .descricaoController2
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
                                                        } else {
                                                          if (widget
                                                                  .tituloListView ==
                                                              'OBJETIVOS') {
                                                            if (widget
                                                                    .listaCampoItem ==
                                                                _model
                                                                    .descricaoController2
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
                                                                    'Objetivo_Investimento':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      _model
                                                                          .descricaoController2
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
                                                                    'Objetivo_Investimento':
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
                                                                'PROTEÇÃO DO CAPITAL') {
                                                              if (widget
                                                                      .listaCampoItem ==
                                                                  _model
                                                                      .descricaoController2
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
                                                                      'Nivel_Protecao_Capital':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        _model
                                                                            .descricaoController2
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
                                                                      'Nivel_Protecao_Capital':
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
                                                                  'RISCO ASSOCIADO') {
                                                                if (widget
                                                                        .listaCampoItem ==
                                                                    _model
                                                                        .descricaoController2
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
                                                                        'Risco_Associado':
                                                                            FieldValue.arrayUnion([
                                                                          _model
                                                                              .descricaoController2
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
                                                                        'Risco_Associado':
                                                                            FieldValue.arrayRemove([
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
                                                                    'RATING') {
                                                                  if (widget
                                                                          .listaCampoItem ==
                                                                      _model
                                                                          .descricaoController2
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
                                                                          'Rating':
                                                                              FieldValue.arrayUnion([
                                                                            _model.descricaoController2.text
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
                                                                          'Rating':
                                                                              FieldValue.arrayRemove([
                                                                            widget.listaCampoItem
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
                                                                      'LIQUIDEZ') {
                                                                    if (widget
                                                                            .listaCampoItem ==
                                                                        _model
                                                                            .descricaoController2
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
                                                                            'Liquidez':
                                                                                FieldValue.arrayUnion([
                                                                              _model.descricaoController2.text
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
                                                                            'Liquidez':
                                                                                FieldValue.arrayRemove([
                                                                              widget.listaCampoItem
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
                                                                        'HORIZONTE') {
                                                                      if (widget
                                                                              .listaCampoItem ==
                                                                          _model
                                                                              .descricaoController2
                                                                              .text) {
                                                                        Navigator.pop(
                                                                            context);
                                                                        return;
                                                                      } else {
                                                                        await widget
                                                                            .docReference!
                                                                            .update(createOpcoesEscolhaRecordData(
                                                                          escolha:
                                                                              createOpcoesVariaveisStruct(
                                                                            fieldValues: {
                                                                              'Horizonte_Investimento': FieldValue.arrayUnion([
                                                                                _model.descricaoController2.text
                                                                              ]),
                                                                            },
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                        ));

                                                                        await widget
                                                                            .docReference!
                                                                            .update(createOpcoesEscolhaRecordData(
                                                                          escolha:
                                                                              createOpcoesVariaveisStruct(
                                                                            fieldValues: {
                                                                              'Horizonte_Investimento': FieldValue.arrayRemove([
                                                                                widget.listaCampoItem
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
                                                                          'VOLATILIDADE') {
                                                                        if (widget.listaCampoItem ==
                                                                            _model.descricaoController2.text) {
                                                                          Navigator.pop(
                                                                              context);
                                                                          return;
                                                                        } else {
                                                                          await widget
                                                                              .docReference!
                                                                              .update(createOpcoesEscolhaRecordData(
                                                                            escolha:
                                                                                createOpcoesVariaveisStruct(
                                                                              fieldValues: {
                                                                                'Volatilidade': FieldValue.arrayUnion([
                                                                                  _model.descricaoController2.text
                                                                                ]),
                                                                              },
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                          ));

                                                                          await widget
                                                                              .docReference!
                                                                              .update(createOpcoesEscolhaRecordData(
                                                                            escolha:
                                                                                createOpcoesVariaveisStruct(
                                                                              fieldValues: {
                                                                                'Volatilidade': FieldValue.arrayRemove([
                                                                                  widget.listaCampoItem
                                                                                ]),
                                                                              },
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                          ));
                                                                          Navigator.pop(
                                                                              context);
                                                                        }
                                                                      } else {
                                                                        if (widget.tituloListView ==
                                                                            'IMPOSTOS  & TAXAS') {
                                                                          if (widget.listaCampoItem ==
                                                                              _model.descricaoController2.text) {
                                                                            Navigator.pop(context);
                                                                            return;
                                                                          } else {
                                                                            await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                              escolha: createOpcoesVariaveisStruct(
                                                                                fieldValues: {
                                                                                  'Impostos_Taxas': FieldValue.arrayUnion([
                                                                                    _model.descricaoController2.text
                                                                                  ]),
                                                                                },
                                                                                clearUnsetFields: false,
                                                                              ),
                                                                            ));

                                                                            await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                              escolha: createOpcoesVariaveisStruct(
                                                                                fieldValues: {
                                                                                  'Impostos_Taxas': FieldValue.arrayRemove([
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
                                                                              'REGULAMENTAÇÃO') {
                                                                            if (widget.listaCampoItem ==
                                                                                _model.descricaoController2.text) {
                                                                              Navigator.pop(context);
                                                                              return;
                                                                            } else {
                                                                              await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                escolha: createOpcoesVariaveisStruct(
                                                                                  fieldValues: {
                                                                                    'Regulamentacao': FieldValue.arrayUnion([
                                                                                      _model.descricaoController2.text
                                                                                    ]),
                                                                                  },
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));

                                                                              await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                escolha: createOpcoesVariaveisStruct(
                                                                                  fieldValues: {
                                                                                    'Regulamentacao': FieldValue.arrayRemove([
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
                                                                                'BENEFÍCIOS FISCAIS') {
                                                                              if (widget.listaCampoItem == _model.descricaoController2.text) {
                                                                                Navigator.pop(context);
                                                                                return;
                                                                              } else {
                                                                                await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                  escolha: createOpcoesVariaveisStruct(
                                                                                    fieldValues: {
                                                                                      'Beneficios_Fiscais': FieldValue.arrayUnion([
                                                                                        _model.descricaoController2.text
                                                                                      ]),
                                                                                    },
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                ));

                                                                                await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                  escolha: createOpcoesVariaveisStruct(
                                                                                    fieldValues: {
                                                                                      'Beneficios_Fiscais': FieldValue.arrayRemove([
                                                                                        widget.listaCampoItem
                                                                                      ]),
                                                                                    },
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                ));
                                                                                Navigator.pop(context);
                                                                              }
                                                                            } else {
                                                                              if (widget.tituloListView == 'CONSÓRCIO') {
                                                                                if (widget.listaCampoItem == _model.descricaoController2.text) {
                                                                                  Navigator.pop(context);
                                                                                  return;
                                                                                } else {
                                                                                  await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                    escolha: createOpcoesVariaveisStruct(
                                                                                      fieldValues: {
                                                                                        'Consorcio': FieldValue.arrayUnion([
                                                                                          _model.descricaoController2.text
                                                                                        ]),
                                                                                      },
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                  ));

                                                                                  await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                    escolha: createOpcoesVariaveisStruct(
                                                                                      fieldValues: {
                                                                                        'Consorcio': FieldValue.arrayRemove([
                                                                                          widget.listaCampoItem
                                                                                        ]),
                                                                                      },
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                  ));
                                                                                  Navigator.pop(context);
                                                                                }
                                                                              } else {
                                                                                if (widget.tituloListView == 'TÍTULOS CAPITALIZAÇÃO') {
                                                                                  if (widget.listaCampoItem == _model.descricaoController2.text) {
                                                                                    Navigator.pop(context);
                                                                                    return;
                                                                                  } else {
                                                                                    await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                      escolha: createOpcoesVariaveisStruct(
                                                                                        fieldValues: {
                                                                                          'Titulos_Capitalizacao': FieldValue.arrayUnion([
                                                                                            _model.descricaoController2.text
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));

                                                                                    await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                      escolha: createOpcoesVariaveisStruct(
                                                                                        fieldValues: {
                                                                                          'Titulos_Capitalizacao': FieldValue.arrayRemove([
                                                                                            widget.listaCampoItem
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                    Navigator.pop(context);
                                                                                  }
                                                                                } else {
                                                                                  if (widget.tituloListView == 'POUPANÇA /CONTAS EXTRAS') {
                                                                                    if (widget.listaCampoItem == _model.descricaoController2.text) {
                                                                                      Navigator.pop(context);
                                                                                      return;
                                                                                    } else {
                                                                                      await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                        escolha: createOpcoesVariaveisStruct(
                                                                                          fieldValues: {
                                                                                            'ContaEmergencia_Poupanca': FieldValue.arrayUnion([
                                                                                              _model.descricaoController2.text
                                                                                            ]),
                                                                                          },
                                                                                          clearUnsetFields: false,
                                                                                        ),
                                                                                      ));

                                                                                      await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                        escolha: createOpcoesVariaveisStruct(
                                                                                          fieldValues: {
                                                                                            'ContaEmergencia_Poupanca': FieldValue.arrayRemove([
                                                                                              widget.listaCampoItem
                                                                                            ]),
                                                                                          },
                                                                                          clearUnsetFields: false,
                                                                                        ),
                                                                                      ));
                                                                                      Navigator.pop(context);
                                                                                    }
                                                                                  } else {
                                                                                    if (widget.tituloListView == 'RENDA FIXA') {
                                                                                      if (widget.listaCampoItem == _model.descricaoController2.text) {
                                                                                        Navigator.pop(context);
                                                                                        return;
                                                                                      } else {
                                                                                        await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                          escolha: createOpcoesVariaveisStruct(
                                                                                            fieldValues: {
                                                                                              'Renda_Fixa': FieldValue.arrayUnion([
                                                                                                _model.descricaoController2.text
                                                                                              ]),
                                                                                            },
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                        ));

                                                                                        await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                          escolha: createOpcoesVariaveisStruct(
                                                                                            fieldValues: {
                                                                                              'Renda_Fixa': FieldValue.arrayRemove([
                                                                                                widget.listaCampoItem
                                                                                              ]),
                                                                                            },
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                        ));
                                                                                        Navigator.pop(context);
                                                                                      }
                                                                                    } else {
                                                                                      if (widget.tituloListView == 'PREVIDÊNCIA PRIVADA') {
                                                                                        if (widget.listaCampoItem == _model.descricaoController2.text) {
                                                                                          Navigator.pop(context);
                                                                                          return;
                                                                                        } else {
                                                                                          await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                            escolha: createOpcoesVariaveisStruct(
                                                                                              fieldValues: {
                                                                                                'Previdencia_Privada': FieldValue.arrayUnion([
                                                                                                  _model.descricaoController2.text
                                                                                                ]),
                                                                                              },
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));

                                                                                          await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                            escolha: createOpcoesVariaveisStruct(
                                                                                              fieldValues: {
                                                                                                'Previdencia_Privada': FieldValue.arrayRemove([
                                                                                                  widget.listaCampoItem
                                                                                                ]),
                                                                                              },
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                          Navigator.pop(context);
                                                                                        }
                                                                                      } else {
                                                                                        if (widget.tituloListView == 'FUNDOS DE PENSÃO') {
                                                                                          if (widget.listaCampoItem == _model.descricaoController2.text) {
                                                                                            Navigator.pop(context);
                                                                                            return;
                                                                                          } else {
                                                                                            await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                              escolha: createOpcoesVariaveisStruct(
                                                                                                fieldValues: {
                                                                                                  'Fundo_Pensao': FieldValue.arrayUnion([
                                                                                                    _model.descricaoController2.text
                                                                                                  ]),
                                                                                                },
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));

                                                                                            await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                              escolha: createOpcoesVariaveisStruct(
                                                                                                fieldValues: {
                                                                                                  'Fundo_Pensao': FieldValue.arrayRemove([
                                                                                                    widget.listaCampoItem
                                                                                                  ]),
                                                                                                },
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                            Navigator.pop(context);
                                                                                          }
                                                                                        } else {
                                                                                          if (widget.tituloListView == 'CÂMBIO') {
                                                                                            if (widget.listaCampoItem == _model.descricaoController2.text) {
                                                                                              Navigator.pop(context);
                                                                                              return;
                                                                                            } else {
                                                                                              await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                escolha: createOpcoesVariaveisStruct(
                                                                                                  fieldValues: {
                                                                                                    'Cambio': FieldValue.arrayUnion([
                                                                                                      _model.descricaoController2.text
                                                                                                    ]),
                                                                                                  },
                                                                                                  clearUnsetFields: false,
                                                                                                ),
                                                                                              ));

                                                                                              await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                escolha: createOpcoesVariaveisStruct(
                                                                                                  fieldValues: {
                                                                                                    'Cambio': FieldValue.arrayRemove([
                                                                                                      widget.listaCampoItem
                                                                                                    ]),
                                                                                                  },
                                                                                                  clearUnsetFields: false,
                                                                                                ),
                                                                                              ));
                                                                                              Navigator.pop(context);
                                                                                            }
                                                                                          } else {
                                                                                            if (widget.tituloListView == 'INVEST. ALTERNATIVO') {
                                                                                              if (widget.listaCampoItem == _model.descricaoController2.text) {
                                                                                                Navigator.pop(context);
                                                                                                return;
                                                                                              } else {
                                                                                                await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                  escolha: createOpcoesVariaveisStruct(
                                                                                                    fieldValues: {
                                                                                                      'Investimentos_Alternativos': FieldValue.arrayUnion([
                                                                                                        _model.descricaoController2.text
                                                                                                      ]),
                                                                                                    },
                                                                                                    clearUnsetFields: false,
                                                                                                  ),
                                                                                                ));

                                                                                                await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                  escolha: createOpcoesVariaveisStruct(
                                                                                                    fieldValues: {
                                                                                                      'Investimentos_Alternativos': FieldValue.arrayRemove([widget.listaCampoItem]),
                                                                                                    },
                                                                                                    clearUnsetFields: false,
                                                                                                  ),
                                                                                                ));
                                                                                                Navigator.pop(context);
                                                                                              }
                                                                                            } else {
                                                                                              if (widget.tituloListView == 'CROWDFUNDING') {
                                                                                                if (widget.listaCampoItem == _model.descricaoController2.text) {
                                                                                                  Navigator.pop(context);
                                                                                                  return;
                                                                                                } else {
                                                                                                  await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                    escolha: createOpcoesVariaveisStruct(
                                                                                                      fieldValues: {
                                                                                                        'Crowdfunding_Investimento': FieldValue.arrayUnion([
                                                                                                          _model.descricaoController2.text
                                                                                                        ]),
                                                                                                      },
                                                                                                      clearUnsetFields: false,
                                                                                                    ),
                                                                                                  ));

                                                                                                  await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                    escolha: createOpcoesVariaveisStruct(
                                                                                                      fieldValues: {
                                                                                                        'Crowdfunding_Investimento': FieldValue.arrayRemove([widget.listaCampoItem]),
                                                                                                      },
                                                                                                      clearUnsetFields: false,
                                                                                                    ),
                                                                                                  ));
                                                                                                  Navigator.pop(context);
                                                                                                }
                                                                                              } else {
                                                                                                if (widget.tituloListView == 'FUNDOS DE INVESTIMENTO') {
                                                                                                  if (widget.listaCampoItem == _model.descricaoController2.text) {
                                                                                                    Navigator.pop(context);
                                                                                                    return;
                                                                                                  } else {
                                                                                                    await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                      escolha: createOpcoesVariaveisStruct(
                                                                                                        fieldValues: {
                                                                                                          'Fundos_Investimento': FieldValue.arrayUnion([
                                                                                                            _model.descricaoController2.text
                                                                                                          ]),
                                                                                                        },
                                                                                                        clearUnsetFields: false,
                                                                                                      ),
                                                                                                    ));

                                                                                                    await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                      escolha: createOpcoesVariaveisStruct(
                                                                                                        fieldValues: {
                                                                                                          'Fundos_Investimento': FieldValue.arrayRemove([widget.listaCampoItem]),
                                                                                                        },
                                                                                                        clearUnsetFields: false,
                                                                                                      ),
                                                                                                    ));
                                                                                                    Navigator.pop(context);
                                                                                                  }
                                                                                                } else {
                                                                                                  if (widget.tituloListView == 'RENDA VARIÁVEL') {
                                                                                                    if (widget.listaCampoItem == _model.descricaoController2.text) {
                                                                                                      Navigator.pop(context);
                                                                                                      return;
                                                                                                    } else {
                                                                                                      await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                        escolha: createOpcoesVariaveisStruct(
                                                                                                          fieldValues: {
                                                                                                            'Renda_Variavel': FieldValue.arrayUnion([
                                                                                                              _model.descricaoController2.text
                                                                                                            ]),
                                                                                                          },
                                                                                                          clearUnsetFields: false,
                                                                                                        ),
                                                                                                      ));

                                                                                                      await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                        escolha: createOpcoesVariaveisStruct(
                                                                                                          fieldValues: {
                                                                                                            'Renda_Variavel': FieldValue.arrayRemove([widget.listaCampoItem]),
                                                                                                          },
                                                                                                          clearUnsetFields: false,
                                                                                                        ),
                                                                                                      ));
                                                                                                      Navigator.pop(context);
                                                                                                    }
                                                                                                  } else {
                                                                                                    if (widget.tituloListView == 'PRIVATE EQUITY') {
                                                                                                      if (widget.listaCampoItem == _model.descricaoController2.text) {
                                                                                                        Navigator.pop(context);
                                                                                                        return;
                                                                                                      } else {
                                                                                                        await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                          escolha: createOpcoesVariaveisStruct(
                                                                                                            fieldValues: {
                                                                                                              'PrivateEquity': FieldValue.arrayUnion([
                                                                                                                _model.descricaoController2.text
                                                                                                              ]),
                                                                                                            },
                                                                                                            clearUnsetFields: false,
                                                                                                          ),
                                                                                                        ));

                                                                                                        await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                          escolha: createOpcoesVariaveisStruct(
                                                                                                            fieldValues: {
                                                                                                              'PrivateEquity': FieldValue.arrayRemove([widget.listaCampoItem]),
                                                                                                            },
                                                                                                            clearUnsetFields: false,
                                                                                                          ),
                                                                                                        ));
                                                                                                        Navigator.pop(context);
                                                                                                      }
                                                                                                    } else {
                                                                                                      if (widget.tituloListView == 'VENTURE CAPITAL') {
                                                                                                        if (widget.listaCampoItem == _model.descricaoController2.text) {
                                                                                                          Navigator.pop(context);
                                                                                                          return;
                                                                                                        } else {
                                                                                                          await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                            escolha: createOpcoesVariaveisStruct(
                                                                                                              fieldValues: {
                                                                                                                'venture_capital': FieldValue.arrayUnion([_model.descricaoController2.text]),
                                                                                                              },
                                                                                                              clearUnsetFields: false,
                                                                                                            ),
                                                                                                          ));

                                                                                                          await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                            escolha: createOpcoesVariaveisStruct(
                                                                                                              fieldValues: {
                                                                                                                'venture_capital': FieldValue.arrayRemove([widget.listaCampoItem]),
                                                                                                              },
                                                                                                              clearUnsetFields: false,
                                                                                                            ),
                                                                                                          ));
                                                                                                          Navigator.pop(context);
                                                                                                        }
                                                                                                      } else {
                                                                                                        if (widget.tituloListView == 'DERIVATIVOS') {
                                                                                                          if (widget.listaCampoItem == _model.descricaoController2.text) {
                                                                                                            Navigator.pop(context);
                                                                                                            return;
                                                                                                          } else {
                                                                                                            await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                              escolha: createOpcoesVariaveisStruct(
                                                                                                                fieldValues: {
                                                                                                                  'Derivativos': FieldValue.arrayUnion([_model.descricaoController2.text]),
                                                                                                                },
                                                                                                                clearUnsetFields: false,
                                                                                                              ),
                                                                                                            ));

                                                                                                            await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                              escolha: createOpcoesVariaveisStruct(
                                                                                                                fieldValues: {
                                                                                                                  'Derivativos': FieldValue.arrayRemove([widget.listaCampoItem]),
                                                                                                                },
                                                                                                                clearUnsetFields: false,
                                                                                                              ),
                                                                                                            ));
                                                                                                            Navigator.pop(context);
                                                                                                          }
                                                                                                        } else {
                                                                                                          if (widget.tituloListView == 'CRIPTOMOEDAS') {
                                                                                                            if (widget.listaCampoItem == _model.descricaoController2.text) {
                                                                                                              Navigator.pop(context);
                                                                                                              return;
                                                                                                            } else {
                                                                                                              await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                                escolha: createOpcoesVariaveisStruct(
                                                                                                                  fieldValues: {
                                                                                                                    'Criptomoeda': FieldValue.arrayUnion([_model.descricaoController2.text]),
                                                                                                                  },
                                                                                                                  clearUnsetFields: false,
                                                                                                                ),
                                                                                                              ));

                                                                                                              await widget.docReference!.update(createOpcoesEscolhaRecordData(
                                                                                                                escolha: createOpcoesVariaveisStruct(
                                                                                                                  fieldValues: {
                                                                                                                    'Criptomoeda': FieldValue.arrayRemove([widget.listaCampoItem]),
                                                                                                                  },
                                                                                                                  clearUnsetFields: false,
                                                                                                                ),
                                                                                                              ));
                                                                                                              Navigator.pop(context);
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
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelLargeFamily),
                              ),
                          borderRadius: BorderRadius.circular(12.0),
                          hoverColor:
                              FlutterFlowTheme.of(context).royalBlueTraditional,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
