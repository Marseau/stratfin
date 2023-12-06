import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/login_midia_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'entrar_cadastrar_model.dart';
export 'entrar_cadastrar_model.dart';

class EntrarCadastrarWidget extends StatefulWidget {
  const EntrarCadastrarWidget({super.key});

  @override
  _EntrarCadastrarWidgetState createState() => _EntrarCadastrarWidgetState();
}

class _EntrarCadastrarWidgetState extends State<EntrarCadastrarWidget>
    with TickerProviderStateMixin {
  late EntrarCadastrarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntrarCadastrarModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.emailentrarController ??= TextEditingController();
    _model.emailentrarFocusNode ??= FocusNode();

    _model.docentrarCNPJController ??= TextEditingController();
    _model.docentrarCNPJFocusNode ??= FocusNode();

    _model.passwordentrarController ??= TextEditingController();
    _model.passwordentrarFocusNode ??= FocusNode();

    _model.emailcadastrarController ??= TextEditingController();
    _model.emailcadastrarFocusNode ??= FocusNode();

    _model.doccadastrarCNPJController ??= TextEditingController();
    _model.doccadastrarCNPJFocusNode ??= FocusNode();

    _model.passwordcadastrarController ??= TextEditingController();
    _model.passwordcadastrarFocusNode ??= FocusNode();

    _model.passwordrepetircadastrarController ??= TextEditingController();
    _model.passwordrepetircadastrarFocusNode ??= FocusNode();

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
            child: Material(
              color: Colors.transparent,
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width >= 650.0
                    ? (MediaQuery.sizeOf(context).width * 0.5)
                    : MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FFAppState().ColorTertiary,
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(0.0, 0),
                          child: TabBar(
                            labelColor: FlutterFlowTheme.of(context).success,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).accent1,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                32.0, 0.0, 32.0, 0.0),
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  fontWeight: FontWeight.w300,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                            unselectedLabelStyle: const TextStyle(),
                            indicatorColor:
                                FlutterFlowTheme.of(context).success,
                            indicatorWeight: 3.0,
                            tabs: const [
                              Tab(
                                text: 'Entrar',
                              ),
                              Tab(
                                text: 'Cadastrar',
                              ),
                            ],
                            controller: _model.tabBarController,
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.00, 0.00),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.00, 0.00),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Bem Vindo!',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMediumFamily,
                                                          color: FFAppState()
                                                              .ColorPrimaryText,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(40.0, 16.0,
                                                          40.0, 0.0),
                                                  child: SizedBox(
                                                    width: 300.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .emailentrarController,
                                                      focusNode: _model
                                                          .emailentrarFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.emailentrarController',
                                                        const Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          var shouldSetState =
                                                              false;
                                                          if (_model.emailentrarController
                                                                      .text !=
                                                                  '') {
                                                            _model.emailEntrarResult =
                                                                await actions
                                                                    .validateEmailA(
                                                              _model
                                                                  .emailentrarController
                                                                  .text,
                                                            );
                                                            shouldSetState =
                                                                true;
                                                            if (_model
                                                                    .emailEntrarResult ==
                                                                true) {
                                                              _model.emailentrarexist =
                                                                  await actions
                                                                      .getDocumentCount(
                                                                'users',
                                                                'email',
                                                                _model
                                                                    .emailentrarController
                                                                    .text,
                                                              );
                                                              shouldSetState =
                                                                  true;
                                                              if (_model
                                                                      .emailentrarexist! >
                                                                  0) {
                                                                setState(() {
                                                                  FFAppState()
                                                                          .emailstate =
                                                                      false;
                                                                });
                                                                setState(() {
                                                                  _model.emailready =
                                                                      true;
                                                                });
                                                                _model.userEntrando =
                                                                    await queryUsersRecordOnce(
                                                                  queryBuilder:
                                                                      (usersRecord) =>
                                                                          usersRecord
                                                                              .where(
                                                                    'email',
                                                                    isEqualTo: _model
                                                                        .emailentrarController
                                                                        .text,
                                                                  ),
                                                                  singleRecord:
                                                                      true,
                                                                ).then((s) => s
                                                                        .firstOrNull);
                                                                shouldSetState =
                                                                    true;
                                                                if (shouldSetState) {
                                                                  setState(
                                                                      () {});
                                                                }
                                                                return;
                                                              } else {
                                                                setState(() {
                                                                  FFAppState()
                                                                          .emailstate =
                                                                      true;
                                                                });
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: const Text(
                                                                          'Email não cadastrado!'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              const Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                setState(() {
                                                                  _model
                                                                      .emailentrarController
                                                                      ?.clear();
                                                                });
                                                                if (shouldSetState) {
                                                                  setState(
                                                                      () {});
                                                                }
                                                                return;
                                                              }
                                                            } else {
                                                              setState(() {
                                                                FFAppState()
                                                                        .emailstate =
                                                                    true;
                                                              });
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: const Text(
                                                                        'Email não válido!'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: const Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                              setState(() {
                                                                _model
                                                                    .emailentrarController
                                                                    ?.clear();
                                                              });
                                                              if (shouldSetState) {
                                                                setState(() {});
                                                              }
                                                              return;
                                                            }
                                                          } else {
                                                            setState(() {
                                                              FFAppState()
                                                                      .emailstate =
                                                                  true;
                                                            });
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Email não preenchido!'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: const Text(
                                                                          'Ok'),
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

                                                          if (shouldSetState) {
                                                            setState(() {});
                                                          }
                                                        },
                                                      ),
                                                      readOnly:
                                                          _model.emailcpfcnpj ==
                                                              true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'End. de Email ',
                                                        labelStyle: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .success,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 16.0,
                                                        ),
                                                        hintText:
                                                            'Digite seu email',
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FFAppState()
                                                                    .emailstate
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .error
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FFAppState()
                                                                .ColorPrimaryText,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customBottom,
                                                        contentPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    24.0,
                                                                    0.0,
                                                                    24.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: null,
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      validator: _model
                                                          .emailentrarControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (FFAppState().QuemNavega !=
                                                  'Usuário')
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                40.0,
                                                                16.0,
                                                                40.0,
                                                                0.0),
                                                    child: SizedBox(
                                                      width: 300.0,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .docentrarCNPJController,
                                                        focusNode: _model
                                                            .docentrarCNPJFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.docentrarCNPJController',
                                                          const Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () async {
                                                            var shouldSetState =
                                                                false;
                                                            if (_model.docentrarCNPJController
                                                                        .text !=
                                                                    '') {
                                                              _model.docEntryResultCNPJ =
                                                                  await actions
                                                                      .verifyCPFOrCNPJ(
                                                                _model
                                                                    .docentrarCNPJController
                                                                    .text,
                                                              );
                                                              shouldSetState =
                                                                  true;
                                                              if (_model
                                                                      .docEntryResultCNPJ ==
                                                                  'CPF/CNPJ verificado') {
                                                                _model.docResultExist =
                                                                    await actions
                                                                        .checkDocumentExists2fields(
                                                                  'users',
                                                                  'email',
                                                                  _model
                                                                      .emailentrarController
                                                                      .text,
                                                                  'cpf_cnpj',
                                                                  _model
                                                                      .docentrarCNPJController
                                                                      .text,
                                                                  null,
                                                                  null,
                                                                  'ativo',
                                                                  true,
                                                                );
                                                                shouldSetState =
                                                                    true;
                                                                if (_model
                                                                        .docResultExist ==
                                                                    true) {
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .cpfcnpjstate =
                                                                        false;
                                                                  });
                                                                  setState(() {
                                                                    _model.cpfcnpjready =
                                                                        true;
                                                                  });
                                                                  if (shouldSetState) {
                                                                    setState(
                                                                        () {});
                                                                  }
                                                                  return;
                                                                } else {
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .cpfcnpjstate =
                                                                        true;
                                                                  });
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: const Text(
                                                                            'Email & CNPJ não conferem!'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                const Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  setState(() {
                                                                    _model
                                                                        .docentrarCNPJController
                                                                        ?.clear();
                                                                  });
                                                                  if (shouldSetState) {
                                                                    setState(
                                                                        () {});
                                                                  }
                                                                  return;
                                                                }
                                                              } else {
                                                                setState(() {
                                                                  FFAppState()
                                                                          .cpfcnpjstate =
                                                                      true;
                                                                });
                                                                setState(() {
                                                                  _model
                                                                      .docentrarCNPJController
                                                                      ?.clear();
                                                                });
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: const Text(
                                                                          'CNPJ não válido!'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              const Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                if (shouldSetState) {
                                                                  setState(
                                                                      () {});
                                                                }
                                                                return;
                                                              }
                                                            } else {
                                                              setState(() {
                                                                FFAppState()
                                                                        .cpfcnpjstate =
                                                                    true;
                                                              });
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: const Text(
                                                                        'CNPJ não preenchido!'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: const Text(
                                                                            'Ok'),
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

                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                          },
                                                        ),
                                                        readOnly: _model
                                                                .emailcpfcnpj ==
                                                            true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'CNPJ',
                                                          labelStyle: TextStyle(
                                                            color: FFAppState()
                                                                .ColorPrefereceSecondary,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 16.0,
                                                          ),
                                                          hintText:
                                                              'Digite o CNPJ',
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FFAppState()
                                                                      .cpfcnpjstate
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .error
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FFAppState()
                                                                  .ColorPrimaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .customBottom,
                                                          contentPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      24.0,
                                                                      0.0,
                                                                      24.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: null,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        validator: _model
                                                            .docentrarCNPJControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          _model
                                                              .docentrarCNPJMask
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (_model.emailcpfcnpj == true)
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                40.0,
                                                                16.0,
                                                                40.0,
                                                                0.0),
                                                    child: SizedBox(
                                                      width: 300.0,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .passwordentrarController,
                                                        focusNode: _model
                                                            .passwordentrarFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.passwordentrarController',
                                                          const Duration(
                                                              milliseconds:
                                                                  1000),
                                                          () async {
                                                            if (_model.passwordentrarController
                                                                        .text !=
                                                                    '') {
                                                              setState(() {
                                                                FFAppState()
                                                                        .passworstate =
                                                                    false;
                                                              });
                                                              return;
                                                            } else {
                                                              setState(() {
                                                                FFAppState()
                                                                        .passworstate =
                                                                    true;
                                                              });
                                                              return;
                                                            }
                                                          },
                                                        ),
                                                        obscureText: !_model
                                                            .passwordentrarVisibility,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Senha',
                                                          labelStyle: TextStyle(
                                                            color: FFAppState()
                                                                .ColorPrefereceSecondary,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 16.0,
                                                          ),
                                                          hintText:
                                                              'Digite sua senha',
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FFAppState()
                                                                      .passworstate
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .error
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FFAppState()
                                                                  .ColorPrimaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .customBottom,
                                                          contentPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      24.0,
                                                                      0.0,
                                                                      24.0),
                                                          suffixIcon: InkWell(
                                                            onTap: () =>
                                                                setState(
                                                              () => _model
                                                                      .passwordentrarVisibility =
                                                                  !_model
                                                                      .passwordentrarVisibility,
                                                            ),
                                                            focusNode: FocusNode(
                                                                skipTraversal:
                                                                    true),
                                                            child: Icon(
                                                              _model.passwordentrarVisibility
                                                                  ? Icons
                                                                      .visibility_outlined
                                                                  : Icons
                                                                      .visibility_off_outlined,
                                                              color: FFAppState()
                                                                  .ColorPrimaryText,
                                                              size: 18.0,
                                                            ),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        validator: _model
                                                            .passwordentrarControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (_model.emailcpfcnpj == false)
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                40.0,
                                                                32.0,
                                                                40.0,
                                                                0.0),
                                                    child: FFButtonWidget(
                                                      onPressed:
                                                          (_model.emailready ==
                                                                      false) ||
                                                                  (_model.cpfcnpjready ==
                                                                      false)
                                                              ? null
                                                              : () async {
                                                                  setState(() {
                                                                    _model.emailcpfcnpj =
                                                                        true;
                                                                  });
                                                                },
                                                      text: 'Continue',
                                                      options: FFButtonOptions(
                                                        width: 300.0,
                                                        height: 52.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            const Color(0xFF00800F),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0xFF5F9845),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        disabledColor:
                                                            const Color(0xFF76808B),
                                                        disabledTextColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        hoverColor:
                                                            const Color(0x8000800F),
                                                      ),
                                                      showLoadingIndicator:
                                                          false,
                                                    ),
                                                  ),
                                                ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    if (_model.emailcpfcnpj ==
                                                        false)
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.00, 1.00),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      180.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                  'HomePage');
                                                            },
                                                            text: 'Voltar',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_return,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .customStarPrimary,
                                                              size: 30.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 120.0,
                                                              height: 40.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                      ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .customBottom,
                                                            ),
                                                            showLoadingIndicator:
                                                                false,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              if (_model.emailcpfcnpj == true)
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                40.0,
                                                                32.0,
                                                                40.0,
                                                                0.0),
                                                    child: StreamBuilder<
                                                        List<UsersRecord>>(
                                                      stream: queryUsersRecord(
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<UsersRecord>
                                                            buttonEntrarUsersRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final buttonEntrarUsersRecord =
                                                            buttonEntrarUsersRecordList
                                                                    .isNotEmpty
                                                                ? buttonEntrarUsersRecordList
                                                                    .first
                                                                : null;
                                                        return FFButtonWidget(
                                                          onPressed: _model.passwordentrarController
                                                                          .text ==
                                                                      ''
                                                              ? null
                                                              : () async {
                                                                  GoRouter.of(
                                                                          context)
                                                                      .prepareAuthEvent();

                                                                  final user =
                                                                      await authManager
                                                                          .signInWithEmail(
                                                                    context,
                                                                    _model
                                                                        .emailentrarController
                                                                        .text,
                                                                    _model
                                                                        .passwordentrarController
                                                                        .text,
                                                                  );
                                                                  if (user ==
                                                                      null) {
                                                                    return;
                                                                  }

                                                                  if (loggedIn ==
                                                                      true) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text(currentUserEmail),
                                                                          content:
                                                                              const Text('Logado'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: const Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .usuariologado =
                                                                          true;
                                                                      FFAppState()
                                                                              .QuemNavega =
                                                                          () {
                                                                        if ((valueOrDefault(currentUserDocument?.userTipo, '') == 'Empresa') ||
                                                                            (valueOrDefault(currentUserDocument?.usuarioTipo, '') ==
                                                                                'Principal') ||
                                                                            (valueOrDefault(currentUserDocument?.usuarioTipo, '') ==
                                                                                'Administrativo')) {
                                                                          return 'Empresa';
                                                                        } else if (valueOrDefault(currentUserDocument?.usuarioTipo,
                                                                                '') ==
                                                                            'Advisor') {
                                                                          return 'Advisor';
                                                                        } else {
                                                                          return 'Usuário';
                                                                        }
                                                                      }();
                                                                    });
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('Quem Navega'),
                                                                          content:
                                                                              Text(FFAppState().QuemNavega),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: const Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (valueOrDefault(
                                                                            currentUserDocument?.userTipo,
                                                                            '') ==
                                                                        'Empresa') {
                                                                      setState(
                                                                          () {
                                                                        FFAppState().docRefUsers =
                                                                            currentUserReference;
                                                                      });

                                                                      context
                                                                          .pushNamedAuth(
                                                                        'Dashboard',
                                                                        context
                                                                            .mounted,
                                                                        queryParameters:
                                                                            {
                                                                          'refUserEmpresa':
                                                                              serializeParam(
                                                                            currentUserReference,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      return;
                                                                    } else {
                                                                      if ((valueOrDefault(currentUserDocument?.usuarioTipo, '') ==
                                                                              'Principal') ||
                                                                          (valueOrDefault(currentUserDocument?.usuarioTipo, '') ==
                                                                              'Administrador')) {
                                                                        setState(
                                                                            () {
                                                                          FFAppState().docRefUsers =
                                                                              currentUserDocument?.userVinculado;
                                                                        });

                                                                        context
                                                                            .pushNamedAuth(
                                                                          'Dashboard',
                                                                          context
                                                                              .mounted,
                                                                          queryParameters:
                                                                              {
                                                                            'refUserEmpresa':
                                                                                serializeParam(
                                                                              FFAppState().docRefUsers,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );

                                                                        return;
                                                                      } else {
                                                                        if (valueOrDefault(currentUserDocument?.usuarioTipo,
                                                                                '') ==
                                                                            'Advisor') {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().docRefUsers =
                                                                                currentUserDocument?.userVinculado;
                                                                          });

                                                                          context
                                                                              .pushNamedAuth(
                                                                            'DashboardAdvisor',
                                                                            context.mounted,
                                                                            queryParameters:
                                                                                {
                                                                              'refUserEmpresa': serializeParam(
                                                                                FFAppState().docRefUsers,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );

                                                                          return;
                                                                        } else {
                                                                          if (currentUserDocument?.userVinculado !=
                                                                              null) {
                                                                            setState(() {
                                                                              FFAppState().docRefUsers = currentUserDocument?.userVinculado;
                                                                            });

                                                                            context.pushNamedAuth(
                                                                              'DashboardCliente',
                                                                              context.mounted,
                                                                              queryParameters: {
                                                                                'refUserAdvisor': serializeParam(
                                                                                  FFAppState().docRefUsers?.id,
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          } else {
                                                                            context.pushNamedAuth(
                                                                              'DashboardCliente',
                                                                              context.mounted,
                                                                              queryParameters: {
                                                                                'refUserAdvisor': serializeParam(
                                                                                  null,
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          }

                                                                          return;
                                                                        }
                                                                      }
                                                                    }
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .passworstate =
                                                                          true;
                                                                    });
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('ERRO'),
                                                                          content:
                                                                              const Text('Senha não confere!'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: const Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .passwordentrarController
                                                                          ?.clear();
                                                                    });
                                                                    return;
                                                                  }
                                                                },
                                                          text: 'Entrar',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 300.0,
                                                            height: 52.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: const Color(
                                                                0xFF00800F),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelLargeFamily),
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Color(
                                                                  0xFF5F9845),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            disabledColor:
                                                                const Color(
                                                                    0xFF76808B),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              Container(
                                                width: 300.0,
                                                height: 50.0,
                                                decoration: const BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.00, 0.00),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      if ((_model.emailready ==
                                                              true) &&
                                                          (_model.cpfcnpjready ==
                                                              true))
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (FFAppState()
                                                                      .QuemNavega ==
                                                                  'Empresa') {
                                                                context
                                                                    .pushNamed(
                                                                  'RecuperarSenha',
                                                                  queryParameters:
                                                                      {
                                                                    'email':
                                                                        serializeParam(
                                                                      _model
                                                                          .emailentrarController
                                                                          .text,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'cnpj':
                                                                        serializeParam(
                                                                      _model
                                                                          .docentrarCNPJController
                                                                          .text,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              } else {
                                                                context
                                                                    .pushNamed(
                                                                  'RecuperarSenha',
                                                                  queryParameters:
                                                                      {
                                                                    'email':
                                                                        serializeParam(
                                                                      _model
                                                                          .emailentrarController
                                                                          .text,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              }
                                                            },
                                                            child: Text(
                                                              'Esqueceu sua senha?',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                color: FFAppState()
                                                                    .ColorPrefereceSecondary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w200,
                                                                fontSize: 14.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
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
                                      ],
                                    ),
                                  ),
                                  if (FFAppState().QuemNavega == 'Usuário')
                                    wrapWithModel(
                                      model: _model.loginMidiaModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: const LoginMidiaWidget(),
                                    ),
                                ],
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.00, 0.00),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.00, 0.00),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: Text(
                                                  'Bem Vindo!',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMediumFamily,
                                                        color: FFAppState()
                                                            .ColorPrimaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      40.0, 32.0, 40.0, 0.0),
                                              child: SizedBox(
                                                width: 300.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .emailcadastrarController,
                                                  focusNode: _model
                                                      .emailcadastrarFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.emailcadastrarController',
                                                    const Duration(
                                                        milliseconds: 2000),
                                                    () async {
                                                      var shouldSetState =
                                                          false;
                                                      if (_model.emailcadastrarController
                                                                  .text !=
                                                              '') {
                                                        _model.emailCadastrarResult =
                                                            await actions
                                                                .validateEmailA(
                                                          _model
                                                              .emailcadastrarController
                                                              .text,
                                                        );
                                                        shouldSetState = true;
                                                        if (_model
                                                                .emailCadastrarResult ==
                                                            true) {
                                                          _model.emailCadastrarexist =
                                                              await actions
                                                                  .getDocumentCount(
                                                            'users',
                                                            'email',
                                                            _model
                                                                .emailcadastrarController
                                                                .text,
                                                          );
                                                          shouldSetState =
                                                              true;
                                                          if (_model
                                                                  .emailCadastrarexist ==
                                                              0) {
                                                            setState(() {
                                                              FFAppState()
                                                                      .emailstate =
                                                                  false;
                                                            });
                                                            setState(() {
                                                              _model.emailready =
                                                                  true;
                                                            });
                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                            return;
                                                          } else {
                                                            setState(() {
                                                              FFAppState()
                                                                      .emailstate =
                                                                  true;
                                                            });
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Email já cadastrado!'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: const Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            setState(() {
                                                              _model
                                                                  .emailcadastrarController
                                                                  ?.clear();
                                                            });
                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                            return;
                                                          }
                                                        } else {
                                                          setState(() {
                                                            FFAppState()
                                                                    .emailstate =
                                                                true;
                                                          });
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: const Text(
                                                                    'Email não válido!'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: const Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                          setState(() {
                                                            _model
                                                                .emailcadastrarController
                                                                ?.clear();
                                                          });
                                                          if (shouldSetState) {
                                                            setState(() {});
                                                          }
                                                          return;
                                                        }
                                                      } else {
                                                        setState(() {
                                                          FFAppState()
                                                                  .emailstate =
                                                              true;
                                                        });
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Email não preenchido!'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        setState(() {
                                                          _model
                                                              .emailcadastrarController
                                                              ?.clear();
                                                        });
                                                        if (shouldSetState) {
                                                          setState(() {});
                                                        }
                                                        return;
                                                      }

                                                      if (shouldSetState) {
                                                        setState(() {});
                                                      }
                                                    },
                                                  ),
                                                  readOnly:
                                                      _model.emailcpfcnpj ==
                                                          true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'End. de Email ',
                                                    labelStyle: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 16.0,
                                                    ),
                                                    hintText:
                                                        'Digite seu email',
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FFAppState()
                                                                    .emailstate ==
                                                                true
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .error
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .success,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FFAppState()
                                                            .ColorPrimaryText,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .customBottom,
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                24.0,
                                                                0.0,
                                                                24.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: null,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  validator: _model
                                                      .emailcadastrarControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            if (FFAppState().QuemNavega !=
                                                'Usuário')
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(40.0, 16.0,
                                                          40.0, 0.0),
                                                  child: SizedBox(
                                                    width: 300.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .doccadastrarCNPJController,
                                                      focusNode: _model
                                                          .doccadastrarCNPJFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.doccadastrarCNPJController',
                                                        const Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          var shouldSetState =
                                                              false;
                                                          if (_model.doccadastrarCNPJController
                                                                      .text !=
                                                                  '') {
                                                            _model.docCNPJEntryResult =
                                                                await actions
                                                                    .verifyCPFOrCNPJ(
                                                              _model
                                                                  .doccadastrarCNPJController
                                                                  .text,
                                                            );
                                                            shouldSetState =
                                                                true;
                                                            if (_model
                                                                    .docCNPJEntryResult ==
                                                                'CPF/CNPJ verificado') {
                                                              _model.docCNPJResultExist =
                                                                  await actions
                                                                      .getDocumentCount(
                                                                'users',
                                                                'cpf_cnpj',
                                                                _model
                                                                    .doccadastrarCNPJController
                                                                    .text,
                                                              );
                                                              shouldSetState =
                                                                  true;
                                                              if (_model
                                                                      .docCNPJResultExist ==
                                                                  0) {
                                                                setState(() {
                                                                  FFAppState()
                                                                          .cpfcnpjstate =
                                                                      false;
                                                                });
                                                                setState(() {
                                                                  _model.cpfcnpjready =
                                                                      true;
                                                                });
                                                                if (shouldSetState) {
                                                                  setState(
                                                                      () {});
                                                                }
                                                                return;
                                                              } else {
                                                                setState(() {
                                                                  FFAppState()
                                                                          .cpfcnpjstate =
                                                                      true;
                                                                });
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: const Text(
                                                                          'CNPJ já cadastrado!'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              const Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                setState(() {
                                                                  _model
                                                                      .doccadastrarCNPJController
                                                                      ?.clear();
                                                                });
                                                                if (shouldSetState) {
                                                                  setState(
                                                                      () {});
                                                                }
                                                                return;
                                                              }
                                                            } else {
                                                              setState(() {
                                                                FFAppState()
                                                                        .cpfcnpjstate =
                                                                    true;
                                                              });
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: const Text(
                                                                        'CNPJ não válido!'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: const Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                              setState(() {
                                                                _model
                                                                    .doccadastrarCNPJController
                                                                    ?.clear();
                                                              });
                                                              if (shouldSetState) {
                                                                setState(() {});
                                                              }
                                                              return;
                                                            }
                                                          } else {
                                                            setState(() {
                                                              FFAppState()
                                                                      .cpfcnpjstate =
                                                                  true;
                                                            });
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'CNPJ não preenchido!'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: const Text(
                                                                          'Ok'),
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

                                                          if (shouldSetState) {
                                                            setState(() {});
                                                          }
                                                        },
                                                      ),
                                                      readOnly:
                                                          _model.emailcpfcnpj ==
                                                              true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'CNPJ',
                                                        labelStyle: TextStyle(
                                                          color: FFAppState()
                                                              .ColorPrefereceSecondary,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 16.0,
                                                        ),
                                                        hintText:
                                                            'Digite seu CNPJ',
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FFAppState()
                                                                        .cpfcnpjstate ==
                                                                    true
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .error
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FFAppState()
                                                                .ColorPrimaryText,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customBottom,
                                                        contentPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    24.0,
                                                                    0.0,
                                                                    24.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: null,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      validator: _model
                                                          .doccadastrarCNPJControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        _model
                                                            .doccadastrarCNPJMask
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (_model.emailcpfcnpj == true)
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(40.0, 16.0,
                                                          40.0, 0.0),
                                                  child: SizedBox(
                                                    width: 300.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .passwordcadastrarController,
                                                      focusNode: _model
                                                          .passwordcadastrarFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.passwordcadastrarController',
                                                        const Duration(
                                                            milliseconds: 1000),
                                                        () async {
                                                          if (_model.passwordcadastrarController
                                                                      .text !=
                                                                  '') {
                                                            setState(() {
                                                              FFAppState()
                                                                      .passworstate =
                                                                  false;
                                                            });
                                                            return;
                                                          } else {
                                                            setState(() {
                                                              FFAppState()
                                                                      .passworstate =
                                                                  true;
                                                            });
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Senha não Preenchida!'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: const Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            return;
                                                          }
                                                        },
                                                      ),
                                                      obscureText: !_model
                                                          .passwordcadastrarVisibility,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Senha',
                                                        labelStyle: TextStyle(
                                                          color: FFAppState()
                                                              .ColorPrefereceSecondary,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 16.0,
                                                        ),
                                                        hintText:
                                                            'Digite sua senha',
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FFAppState()
                                                                    .passworstate
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .error
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FFAppState()
                                                                .ColorPrimaryText,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customBottom,
                                                        contentPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    24.0,
                                                                    0.0,
                                                                    24.0),
                                                        suffixIcon: InkWell(
                                                          onTap: () => setState(
                                                            () => _model
                                                                    .passwordcadastrarVisibility =
                                                                !_model
                                                                    .passwordcadastrarVisibility,
                                                          ),
                                                          focusNode: FocusNode(
                                                              skipTraversal:
                                                                  true),
                                                          child: Icon(
                                                            _model.passwordcadastrarVisibility
                                                                ? Icons
                                                                    .visibility_outlined
                                                                : Icons
                                                                    .visibility_off_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 18.0,
                                                          ),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      validator: _model
                                                          .passwordcadastrarControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (_model.emailcpfcnpj == true)
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(40.0, 16.0,
                                                          40.0, 0.0),
                                                  child: SizedBox(
                                                    width: 300.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .passwordrepetircadastrarController,
                                                      focusNode: _model
                                                          .passwordrepetircadastrarFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.passwordrepetircadastrarController',
                                                        const Duration(
                                                            milliseconds: 1000),
                                                        () async {
                                                          if (_model.passwordrepetircadastrarController
                                                                      .text !=
                                                                  '') {
                                                            if (_model
                                                                    .passwordcadastrarController
                                                                    .text ==
                                                                _model
                                                                    .passwordrepetircadastrarController
                                                                    .text) {
                                                              setState(() {
                                                                FFAppState()
                                                                        .passworstate =
                                                                    false;
                                                              });
                                                              return;
                                                            } else {
                                                              setState(() {
                                                                FFAppState()
                                                                        .passworstate =
                                                                    true;
                                                              });
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: const Text(
                                                                        'Senhas '),
                                                                    content: const Text(
                                                                        'não são iguais!'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: const Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                              setState(() {
                                                                _model
                                                                    .passwordcadastrarController
                                                                    ?.clear();
                                                                _model
                                                                    .passwordrepetircadastrarController
                                                                    ?.clear();
                                                              });
                                                              return;
                                                            }
                                                          } else {
                                                            setState(() {
                                                              FFAppState()
                                                                      .passworstate =
                                                                  true;
                                                            });
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Repetir Senha não Preenchido!'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: const Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            return;
                                                          }
                                                        },
                                                      ),
                                                      obscureText: !_model
                                                          .passwordrepetircadastrarVisibility,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Repetir Senha',
                                                        labelStyle: TextStyle(
                                                          color: FFAppState()
                                                              .ColorPrefereceSecondary,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 16.0,
                                                        ),
                                                        hintText:
                                                            'Repita sua senha',
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FFAppState()
                                                                    .passworstate
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .error
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FFAppState()
                                                                .ColorPrimaryText,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customBottom,
                                                        contentPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    24.0,
                                                                    0.0,
                                                                    24.0),
                                                        suffixIcon: InkWell(
                                                          onTap: () => setState(
                                                            () => _model
                                                                    .passwordrepetircadastrarVisibility =
                                                                !_model
                                                                    .passwordrepetircadastrarVisibility,
                                                          ),
                                                          focusNode: FocusNode(
                                                              skipTraversal:
                                                                  true),
                                                          child: Icon(
                                                            _model.passwordrepetircadastrarVisibility
                                                                ? Icons
                                                                    .visibility_outlined
                                                                : Icons
                                                                    .visibility_off_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 18.0,
                                                          ),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      validator: _model
                                                          .passwordrepetircadastrarControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (!_model.emailcpfcnpj)
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(40.0, 32.0,
                                                          40.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: (_model
                                                                    .emailready ==
                                                                false) ||
                                                            (_model.cpfcnpjready ==
                                                                false)
                                                        ? null
                                                        : () async {
                                                            setState(() {
                                                              _model.emailcpfcnpj =
                                                                  true;
                                                            });
                                                          },
                                                    text: 'Continue',
                                                    options: FFButtonOptions(
                                                      width: 300.0,
                                                      height: 52.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: const Color(0xFF00800F),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFF5F9845),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      disabledColor:
                                                          const Color(0xFF76808B),
                                                      disabledTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      hoverColor:
                                                          const Color(0x8000800F),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (_model.emailcpfcnpj == false)
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.00, 1.00),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(0.0, 16.0,
                                                          180.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                          'HomePage');
                                                    },
                                                    text: 'Voltar',
                                                    icon: Icon(
                                                      Icons.keyboard_return,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .customStarPrimary,
                                                      size: 30.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 120.0,
                                                      height: 40.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customBottom,
                                                    ),
                                                    showLoadingIndicator: false,
                                                  ),
                                                ),
                                              ),
                                            if (_model.emailcpfcnpj == true)
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(40.0, 32.0,
                                                          40.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: (_model.passwordcadastrarController
                                                                        .text ==
                                                                    '') ||
                                                            (_model.passwordrepetircadastrarController
                                                                        .text ==
                                                                    '')
                                                        ? null
                                                        : () async {
                                                            GoRouter.of(context)
                                                                .prepareAuthEvent();
                                                            if (_model
                                                                    .passwordcadastrarController
                                                                    .text !=
                                                                _model
                                                                    .passwordrepetircadastrarController
                                                                    .text) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                const SnackBar(
                                                                  content: Text(
                                                                    'Passwords don\'t match!',
                                                                  ),
                                                                ),
                                                              );
                                                              return;
                                                            }

                                                            final user =
                                                                await authManager
                                                                    .createAccountWithEmail(
                                                              context,
                                                              _model
                                                                  .emailcadastrarController
                                                                  .text,
                                                              _model
                                                                  .passwordcadastrarController
                                                                  .text,
                                                            );
                                                            if (user == null) {
                                                              return;
                                                            }

                                                            await UsersRecord
                                                                .collection
                                                                .doc(user.uid)
                                                                .update(
                                                                    createUsersRecordData(
                                                                  createdTime:
                                                                      getCurrentTimestamp,
                                                                  ativo: true,
                                                                  usuarioTipo:
                                                                      FFAppState()
                                                                          .QuemNavega,
                                                                  cpfCnpj: FFAppState()
                                                                              .QuemNavega ==
                                                                          'Empresa'
                                                                      ? _model
                                                                          .docentrarCNPJController
                                                                          .text
                                                                      : null,
                                                                  userTipo:
                                                                      FFAppState()
                                                                          .QuemNavega,
                                                                  perfilEmpresa:
                                                                      true,
                                                                ));

                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Usuário Cadastrado!'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: const Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            setState(() {
                                                              FFAppState()
                                                                      .usuariologado =
                                                                  true;
                                                              FFAppState()
                                                                      .docRefUsers =
                                                                  currentUserReference;
                                                            });
                                                            if (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.userTipo,
                                                                    '') ==
                                                                'Empresa') {
                                                              setState(() {
                                                                FFAppState()
                                                                        .docRefUsers =
                                                                    currentUserReference;
                                                              });

                                                              context
                                                                  .pushNamedAuth(
                                                                'Dashboard',
                                                                context.mounted,
                                                                queryParameters:
                                                                    {
                                                                  'refUserEmpresa':
                                                                      serializeParam(
                                                                    currentUserReference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );

                                                              return;
                                                            } else {
                                                              context
                                                                  .pushNamedAuth(
                                                                'DashboardCliente',
                                                                context.mounted,
                                                                queryParameters:
                                                                    {
                                                                  'refUserAdvisor':
                                                                      serializeParam(
                                                                    null,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );

                                                              return;
                                                            }
                                                          },
                                                    text: 'Cadastrar',
                                                    options: FFButtonOptions(
                                                      width: 300.0,
                                                      height: 52.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: const Color(0xFF00800F),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFF5F9845),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      disabledColor:
                                                          const Color(0xFF76808B),
                                                      disabledTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      hoverColor:
                                                          const Color(0x8000800F),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
