import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'convidar_model.dart';
export 'convidar_model.dart';

class ConvidarWidget extends StatefulWidget {
  const ConvidarWidget({
    super.key,
    this.emailEmissor,
    this.conviteEmpresa,
  });

  final String? emailEmissor;
  final bool? conviteEmpresa;

  @override
  _ConvidarWidgetState createState() => _ConvidarWidgetState();
}

class _ConvidarWidgetState extends State<ConvidarWidget> {
  late ConvidarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConvidarModel());

    _model.emailNewCadastroController ??= TextEditingController();
    _model.emailNewCadastroFocusNode ??= FocusNode();

    _model.nomecompletoNewCadastroController ??= TextEditingController();
    _model.nomecompletoNewCadastroFocusNode ??= FocusNode();

    _model.razaoSocialNewCadastroController ??= TextEditingController();
    _model.razaoSocialNewCadastroFocusNode ??= FocusNode();

    _model.cPFNewCadastroController ??= TextEditingController();
    _model.cPFNewCadastroFocusNode ??= FocusNode();

    _model.cNPJNewCadastroController ??= TextEditingController();
    _model.cNPJNewCadastroFocusNode ??= FocusNode();

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
          Container(
            width: 320.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).tertiary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(1.00, 0.00),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(1.00, 0.00),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 16.0, 8.0),
                          child: FlutterFlowIconButton(
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20.0,
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
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 16.0, 20.0, 0.0),
                          child: SizedBox(
                            width: 300.0,
                            child: TextFormField(
                              controller: _model.emailNewCadastroController,
                              focusNode: _model.emailNewCadastroFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.emailNewCadastroController',
                                const Duration(milliseconds: 2000),
                                () async {
                                  var shouldSetState = false;
                                  if (_model.emailNewCadastroController.text !=
                                          '') {
                                    _model.emailNewCadastroResult =
                                        await actions.validateEmailA(
                                      _model.emailNewCadastroController.text,
                                    );
                                    shouldSetState = true;
                                    if (_model.emailNewCadastroResult == true) {
                                      _model.emailNewCadastro =
                                          await actions.getDocumentCount(
                                        'users',
                                        'email',
                                        _model.emailNewCadastroController.text,
                                      );
                                      shouldSetState = true;
                                      setState(() {
                                        _model.docResult =
                                            _model.emailNewCadastro;
                                      });
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title:
                                                const Text('Número de Docs em users'),
                                            content: Text(
                                                _model.docResult!.toString()),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      if (_model.emailNewCadastro == 0) {
                                        _model.emailNewCadastroConvidadosResult =
                                            await actions.getDocumentCount(
                                          'convidados',
                                          'email',
                                          _model
                                              .emailNewCadastroController.text,
                                        );
                                        shouldSetState = true;
                                        setState(() {
                                          _model.docResult = _model
                                              .emailNewCadastroConvidadosResult;
                                        });
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: const Text('Docs em convidados'),
                                              content: Text(
                                                  _model.docResult!.toString()),
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
                                        if (_model
                                                .emailNewCadastroConvidadosResult ==
                                            0) {
                                          setState(() {
                                            FFAppState().emailstate = false;
                                          });
                                          if (shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Usuário já convidado!'),
                                                        content: const Text(
                                                            'Se quiser que reenvie o convite pressione Confirme abaixo ou Cancele'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                const Text('Cancele'),
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
                                            _model.docConvidados =
                                                await queryConvidadosRecordOnce(
                                              queryBuilder:
                                                  (convidadosRecord) =>
                                                      convidadosRecord.where(
                                                'email',
                                                isEqualTo: _model
                                                    .emailNewCadastroController
                                                    .text,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            shouldSetState = true;
                                            setState(() {
                                              _model.docStateConvidados = _model
                                                  .docConvidados?.reference;
                                            });
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Segue docReference'),
                                                  content: Text(_model
                                                      .docStateConvidados!.id),
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
                                            if (_model.docConvidados?.enviado ==
                                                false) {
                                              Navigator.pop(context);
                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                              return;
                                            } else {
                                              await _model
                                                  .docConvidados!.reference
                                                  .update(
                                                      createConvidadosRecordData(
                                                enviado: false,
                                              ));
                                              Navigator.pop(context);
                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                              return;
                                            }
                                          } else {
                                            setState(() {
                                              _model.emailNewCadastroController
                                                  ?.clear();
                                            });
                                            Navigator.pop(context);
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          }
                                        }
                                      } else {
                                        setState(() {
                                          FFAppState().emailstate = true;
                                        });
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title:
                                                  const Text('Email já cadastrado!'),
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
                                          _model.emailNewCadastroController
                                              ?.clear();
                                        });
                                        if (shouldSetState) setState(() {});
                                        return;
                                      }
                                    } else {
                                      setState(() {
                                        FFAppState().emailstate = true;
                                      });
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Email não válido!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      setState(() {
                                        _model.emailNewCadastroController
                                            ?.clear();
                                      });
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }
                                  } else {
                                    setState(() {
                                      FFAppState().emailstate = true;
                                    });
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Email não preenchido!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (shouldSetState) setState(() {});
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email*',
                                labelStyle: TextStyle(
                                  color: FlutterFlowTheme.of(context).success,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16.0,
                                ),
                                hintText: 'Digite o  email',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FFAppState().emailstate
                                        ? FlutterFlowTheme.of(context).error
                                        : FlutterFlowTheme.of(context).success,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FFAppState().ColorPrimaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 24.0, 0.0, 24.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w300,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              textAlign: TextAlign.start,
                              maxLines: null,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: FlutterFlowTheme.of(context).accent1,
                              validator: _model
                                  .emailNewCadastroControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      if (widget.conviteEmpresa == false)
                        Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 16.0, 20.0, 0.0),
                            child: SizedBox(
                              width: 300.0,
                              child: TextFormField(
                                controller:
                                    _model.nomecompletoNewCadastroController,
                                focusNode:
                                    _model.nomecompletoNewCadastroFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Nome Completo *',
                                  labelStyle: TextStyle(
                                    color: FFAppState().ColorPrefereceSecondary,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.0,
                                  ),
                                  hintText: 'Digite o nome completo',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FFAppState().ColorPrimaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).tertiary,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 24.0, 0.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily),
                                    ),
                                textAlign: TextAlign.start,
                                maxLines: null,
                                cursorColor:
                                    FlutterFlowTheme.of(context).accent1,
                                validator: _model
                                    .nomecompletoNewCadastroControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      if (widget.conviteEmpresa == true)
                        Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 16.0, 20.0, 0.0),
                            child: SizedBox(
                              width: 300.0,
                              child: TextFormField(
                                controller:
                                    _model.razaoSocialNewCadastroController,
                                focusNode:
                                    _model.razaoSocialNewCadastroFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Razão Social*',
                                  labelStyle: TextStyle(
                                    color: FFAppState().ColorPrefereceSecondary,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.0,
                                  ),
                                  hintText: 'Digite a razão Social',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FFAppState().ColorPrimaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).tertiary,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 24.0, 0.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily),
                                    ),
                                textAlign: TextAlign.start,
                                maxLines: null,
                                cursorColor:
                                    FlutterFlowTheme.of(context).accent1,
                                validator: _model
                                    .razaoSocialNewCadastroControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 16.0, 20.0, 0.0),
                          child: SizedBox(
                            width: 300.0,
                            child: TextFormField(
                              controller: _model.cPFNewCadastroController,
                              focusNode: _model.cPFNewCadastroFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.cPFNewCadastroController',
                                const Duration(milliseconds: 2000),
                                () async {
                                  var shouldSetState = false;
                                  _model.validCpfResult =
                                      await actions.verifyCPFOrCNPJ(
                                    _model.cPFNewCadastroController.text,
                                  );
                                  shouldSetState = true;
                                  if (_model.validCpfResult ==
                                      'CPF/CNPJ verificado') {
                                    setState(() {
                                      FFAppState().cpfcnpjstate = true;
                                    });
                                    if (shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('CPF inválido'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (shouldSetState) setState(() {});
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'CPF*',
                                labelStyle: TextStyle(
                                  color: FFAppState().ColorPrefereceSecondary,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16.0,
                                ),
                                hintText: 'Digite o CPF',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).success,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FFAppState().ColorPrimaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 24.0, 0.0, 24.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w300,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              textAlign: TextAlign.start,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              cursorColor: FlutterFlowTheme.of(context).accent1,
                              validator: _model
                                  .cPFNewCadastroControllerValidator
                                  .asValidator(context),
                              inputFormatters: [_model.cPFNewCadastroMask],
                            ),
                          ),
                        ),
                      ),
                      if (widget.conviteEmpresa == true)
                        Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 16.0, 20.0, 0.0),
                            child: SizedBox(
                              width: 300.0,
                              child: TextFormField(
                                controller: _model.cNPJNewCadastroController,
                                focusNode: _model.cNPJNewCadastroFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.cNPJNewCadastroController',
                                  const Duration(milliseconds: 2000),
                                  () async {
                                    var shouldSetState = false;
                                    _model.validCnpjResult =
                                        await actions.verifyCPFOrCNPJ(
                                      _model.cNPJNewCadastroController.text,
                                    );
                                    shouldSetState = true;
                                    if (_model.validCnpjResult ==
                                        'CPF/CNPJ verificado') {
                                      setState(() {
                                        FFAppState().cpfcnpjstate = true;
                                      });
                                      if (shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('CNPJ Inválido'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (shouldSetState) setState(() {});
                                  },
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'CNPJ*',
                                  labelStyle: TextStyle(
                                    color: FFAppState().ColorPrefereceSecondary,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.0,
                                  ),
                                  hintText: 'Digite o CNPJ',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FFAppState().ColorPrimaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).tertiary,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 24.0, 0.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily),
                                    ),
                                textAlign: TextAlign.start,
                                maxLines: null,
                                keyboardType: TextInputType.number,
                                cursorColor:
                                    FlutterFlowTheme.of(context).accent1,
                                validator: _model
                                    .cNPJNewCadastroControllerValidator
                                    .asValidator(context),
                                inputFormatters: [_model.cNPJNewCadastroMask],
                              ),
                            ),
                          ),
                        ),
                      if (widget.conviteEmpresa == false)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 16.0, 20.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model
                                    .dropDownuserUserCadastroValueController ??=
                                FormFieldController<String>(null),
                            options: List<String>.from(
                                ['Administrativo', 'Advisor', 'Principal']),
                            optionLabels: const [
                              'Administrativo',
                              'Advisor',
                              'Principal'
                            ],
                            onChanged: (val) => setState(() =>
                                _model.dropDownuserUserCadastroValue = val),
                            width: 300.0,
                            height: 60.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FFAppState().ColorPrefereceSecondary,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w300,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            hintText: 'Selecione uma opção',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context).tertiary,
                            elevation: 0.0,
                            borderColor: FlutterFlowTheme.of(context).success,
                            borderWidth: 1.0,
                            borderRadius: 12.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 4.0, 10.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                      Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 32.0, 20.0, 32.0),
                          child: StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
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
                              List<UsersRecord>
                                  buttonUserConvidarUsersRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final buttonUserConvidarUsersRecord =
                                  buttonUserConvidarUsersRecordList.isNotEmpty
                                      ? buttonUserConvidarUsersRecordList.first
                                      : null;
                              return FFButtonWidget(
                                onPressed: () async {
                                  var shouldSetState = false;
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.dropDownuserUserCadastroValue ==
                                      null) {
                                    return;
                                  }

                                  await ConvidadosRecord.collection
                                      .doc()
                                      .set(createConvidadosRecordData(
                                        email: _model
                                            .emailNewCadastroController.text,
                                        nomeCompleto: widget
                                                    .conviteEmpresa ==
                                                false
                                            ? _model
                                                .nomecompletoNewCadastroController
                                                .text
                                            : _model
                                                .razaoSocialNewCadastroController
                                                .text,
                                        cpfCnpj: widget.conviteEmpresa == false
                                            ? _model
                                                .cPFNewCadastroController.text
                                            : _model
                                                .cNPJNewCadastroController.text,
                                        status: 'Convidado',
                                        usuarioTipo: _model
                                                        .dropDownuserUserCadastroValue ==
                                                    null ||
                                                _model.dropDownuserUserCadastroValue ==
                                                    ''
                                            ? 'Empresa'
                                            : _model
                                                .dropDownuserUserCadastroValue,
                                        enviado: false,
                                        emailEmissor: widget.emailEmissor,
                                        userConvite: FFAppState().docRefUsers,
                                      ));
                                  _model.newConvidadoResult =
                                      await actions.getDocumentCount(
                                    'convidados',
                                    'email',
                                    _model.emailNewCadastroController.text,
                                  );
                                  shouldSetState = true;
                                  if (_model.newConvidadoResult! > 0) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Convidado Criado!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    setState(() {
                                      _model.emailNewCadastroController
                                          ?.clear();
                                      _model.nomecompletoNewCadastroController
                                          ?.clear();
                                      _model.razaoSocialNewCadastroController
                                          ?.clear();
                                      _model.cPFNewCadastroController?.clear();
                                      _model.cNPJNewCadastroController?.clear();
                                    });
                                    Navigator.pop(context);
                                    if (shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Convidado não criado!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (shouldSetState) setState(() {});
                                },
                                text: 'Convidar',
                                options: FFButtonOptions(
                                  width: 300.0,
                                  height: 52.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: const Color(0xFF00800F),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelLargeFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily),
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Color(0xFF5F9845),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              );
                            },
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
    );
  }
}
