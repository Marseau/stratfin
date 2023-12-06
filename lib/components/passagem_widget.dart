import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'passagem_model.dart';
export 'passagem_model.dart';

class PassagemWidget extends StatefulWidget {
  const PassagemWidget({
    super.key,
    required this.parameter1,
  });

  final String? parameter1;

  @override
  _PassagemWidgetState createState() => _PassagemWidgetState();
}

class _PassagemWidgetState extends State<PassagemWidget> {
  late PassagemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PassagemModel());

    _model.textCNPJController ??= TextEditingController();
    _model.textCNPJFocusNode ??= FocusNode();

    _model.resetepasswordController ??=
        TextEditingController(text: widget.parameter1);
    _model.resetepasswordFocusNode ??= FocusNode();

    _model.textFieldCPFController ??= TextEditingController();
    _model.textFieldCPFFocusNode ??= FocusNode();

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
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // This row exists for when the "app bar" is hidden on desktop, having a way back for the user can work well.
        if (responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
        ))
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FFAppState().ColorPreferencePrimary,
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.00, -1.00),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Back',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
          child: Text(
            'Esqueceu sua Senha?',
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
        ),
        if (FFAppState().QuemNavega == 'Usuario')
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
            child: Text(
              'Enviaremos um e-mail com um link para redefinir sua senha, confira abaixo  o e-mail associado à sua conta.',
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                    color: FFAppState().ColorPrimaryText,
                    fontWeight: FontWeight.w300,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).labelMediumFamily),
                  ),
            ),
          ),
        if (FFAppState().QuemNavega == 'Empresa')
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
            child: Text(
              'Enviaremos um e-mail com um link para redefinir sua senha, confira abaixo o e-mail e o CNPJ associados à sua conta.',
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                    color: FFAppState().ColorPrimaryText,
                    fontWeight: FontWeight.w300,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).labelMediumFamily),
                  ),
            ),
          ),
        if (FFAppState().QuemNavega == 'Consultor')
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
            child: Text(
              'Enviaremos um e-mail com um link para redefinir sua senha, confira abaixo o e-mail e seu CPF associados à sua conta.',
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                    color: FFAppState().ColorPrimaryText,
                    fontWeight: FontWeight.w300,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).labelMediumFamily),
                  ),
            ),
          ),
        if (FFAppState().QuemNavega == 'Empresa')
          Align(
            alignment: const AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(40.0, 32.0, 40.0, 0.0),
              child: SizedBox(
                width: 300.0,
                child: TextFormField(
                  controller: _model.textCNPJController,
                  focusNode: _model.textCNPJFocusNode,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'CNPJ',
                    labelStyle: const TextStyle(
                      color: Color(0xFF00800F),
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                    ),
                    hintText: 'Entre com seu CNPJ',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).success,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryText,
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
                    fillColor: FlutterFlowTheme.of(context).customBottom,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 24.0),
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).labelMediumFamily,
                        color: FlutterFlowTheme.of(context).secondary,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).labelMediumFamily),
                      ),
                  textAlign: TextAlign.start,
                  maxLines: null,
                  keyboardType: TextInputType.number,
                  cursorColor: FlutterFlowTheme.of(context).accent1,
                  validator:
                      _model.textCNPJControllerValidator.asValidator(context),
                  inputFormatters: [_model.textCNPJMask],
                ),
              ),
            ),
          ),
        Align(
          alignment: const AlignmentDirectional(0.00, 0.00),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40.0, 32.0, 40.0, 0.0),
            child: SizedBox(
              width: 300.0,
              child: TextFormField(
                controller: _model.resetepasswordController,
                focusNode: _model.resetepasswordFocusNode,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'End. de Email ',
                  labelStyle: const TextStyle(
                    color: Color(0xFF00800F),
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                  ),
                  hintText: 'Entre com seu email',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).success,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryText,
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
                  fillColor: FlutterFlowTheme.of(context).customBottom,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 24.0),
                ),
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).labelMediumFamily,
                      color: FlutterFlowTheme.of(context).secondary,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelMediumFamily),
                    ),
                textAlign: TextAlign.start,
                maxLines: null,
                keyboardType: TextInputType.emailAddress,
                cursorColor: FlutterFlowTheme.of(context).accent1,
                validator: _model.resetepasswordControllerValidator
                    .asValidator(context),
              ),
            ),
          ),
        ),
        if (FFAppState().QuemNavega == 'Consultor')
          Align(
            alignment: const AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(40.0, 32.0, 40.0, 0.0),
              child: SizedBox(
                width: 300.0,
                child: TextFormField(
                  controller: _model.textFieldCPFController,
                  focusNode: _model.textFieldCPFFocusNode,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'CPF',
                    labelStyle: const TextStyle(
                      color: Color(0xFF00800F),
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                    ),
                    hintText: 'Entre com seu CPF',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).success,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryText,
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
                    fillColor: FlutterFlowTheme.of(context).customBottom,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 24.0),
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).labelMediumFamily,
                        color: FlutterFlowTheme.of(context).secondary,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).labelMediumFamily),
                      ),
                  textAlign: TextAlign.start,
                  maxLines: null,
                  keyboardType: TextInputType.number,
                  cursorColor: FlutterFlowTheme.of(context).accent1,
                  validator: _model.textFieldCPFControllerValidator
                      .asValidator(context),
                  inputFormatters: [_model.textFieldCPFMask],
                ),
              ),
            ),
          ),
        Align(
          alignment: const AlignmentDirectional(0.00, 0.00),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40.0, 32.0, 40.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                if (_model.resetepasswordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Email required!',
                      ),
                    ),
                  );
                  return;
                }
                await authManager.resetPassword(
                  email: _model.resetepasswordController.text,
                  context: context,
                );
              },
              text: 'Envie Link',
              options: FFButtonOptions(
                width: 300.0,
                height: 52.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: const Color(0xFF00800F),
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      color: FlutterFlowTheme.of(context).alternate,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 3.0,
                borderSide: const BorderSide(
                  color: Color(0xFF5F9845),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
        Text(
          FFAppState().QuemNavega,
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
      ],
    );
  }
}
