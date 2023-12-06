import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(3.0, 3.0),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 30.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: const Offset(0.6, 0.6),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: const Offset(0.6, 0.6),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentUserEmail != '') {
        setState(() {
          FFAppState().usuariologado = true;
        });
      } else {
        setState(() {
          FFAppState().usuariologado = false;
        });
      }
    });

    _model.textController ??= TextEditingController(text: currentUserEmail);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).customStarSecond,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRecord> homePageUsersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final homePageUsersRecord = homePageUsersRecordList.isNotEmpty
            ? homePageUsersRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).customStarSecond,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  elevation: 3.0,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).secondary
                        ],
                        stops: const [0.0, 1.0],
                        begin: const AlignmentDirectional(0.0, -1.0),
                        end: const AlignmentDirectional(0, 1.0),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 1240),
                      curve: Curves.easeIn,
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).customStarPrimary,
                            FlutterFlowTheme.of(context).customStarSecond
                          ],
                          stops: const [0.0, 0.4],
                          begin: const AlignmentDirectional(0.0, -1.0),
                          end: const AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                44.0, 50.0, 44.0, 0.0),
                            child: Text(
                              'Obrigado por se juntar a nós! Acesse seu perfil abaixo e comece sua jornada!',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelLargeFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .customStarSecond,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelLargeFamily),
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation']!),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 100.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Logosemfundo.png',
                                  width: 300.0,
                                  height: 300.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation']!),
              ),
              if (responsiveVisibility(
                context: context,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 44.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 16.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  FFAppState().QuemNavega = 'Usuário';
                                });
                                if (FFAppState().usuariologado == true) {
                                  setState(() {
                                    FFAppState().QuemNavega =
                                        homePageUsersRecord!.usuarioTipo;
                                  });
                                  if (FFAppState().QuemNavega == 'Empresa') {
                                    context.pushNamed('Empresa');

                                    return;
                                  } else {
                                    if (FFAppState().QuemNavega ==
                                        'Consultor') {
                                      context.pushNamed('Consultor');

                                      return;
                                    } else {
                                      context.pushNamed(
                                        'UserProfile',
                                        queryParameters: {
                                          'cpf': serializeParam(
                                            '',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );

                                      return;
                                    }
                                  }
                                } else {
                                  context.pushNamed('Login');

                                  return;
                                }
                              },
                              text: 'Usuário',
                              options: FFButtonOptions(
                                width: 230.0,
                                height: 52.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .customStarPrimary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelLargeFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .customStarSecond,
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily),
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .customStarSecond,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 16.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  FFAppState().QuemNavega = 'empresa';
                                });
                                if (FFAppState().usuariologado == true) {
                                  setState(() {
                                    FFAppState().QuemNavega =
                                        homePageUsersRecord!.usuarioTipo;
                                  });
                                  if (FFAppState().QuemNavega == 'Empresa') {
                                    context.pushNamed(
                                      'Dashboard',
                                      queryParameters: {
                                        'refUserEmpresa': serializeParam(
                                          currentUserReference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );

                                    return;
                                  } else {
                                    if (FFAppState().QuemNavega ==
                                        'Consultor') {
                                      context.pushNamed('Consultor');

                                      return;
                                    } else {
                                      context.pushNamed(
                                        'UserProfile',
                                        queryParameters: {
                                          'cpf': serializeParam(
                                            '',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );

                                      return;
                                    }
                                  }
                                } else {
                                  context.pushNamed('Login');

                                  return;
                                }
                              },
                              text: 'Empresa',
                              options: FFButtonOptions(
                                width: 230.0,
                                height: 52.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .customStarSecond,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelLargeFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .customStarPrimary,
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily),
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .customStarPrimary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['rowOnPageLoadAnimation1']!),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Align(
                  alignment: const AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 44.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Align(
                              alignment: const AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 16.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    FFAppState().QuemNavega = 'Usuário';
                                    if (loggedIn) {
                                      if (valueOrDefault(
                                              currentUserDocument?.userTipo,
                                              '') ==
                                          'Empresa') {
                                        setState(() {
                                          FFAppState().QuemNavega = 'Empresa';
                                          FFAppState().docRefUsers =
                                              currentUserReference;
                                        });

                                        context.pushNamed(
                                          'Dashboard',
                                          queryParameters: {
                                            'refUserEmpresa': serializeParam(
                                              FFAppState().docRefUsers,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else if ((valueOrDefault(
                                                  currentUserDocument
                                                      ?.usuarioTipo,
                                                  '') ==
                                              'Administrativo') ||
                                          (valueOrDefault(
                                                  currentUserDocument
                                                      ?.usuarioTipo,
                                                  '') ==
                                              'Principal')) {
                                        setState(() {
                                          FFAppState().QuemNavega = 'Empresa';
                                          FFAppState().docRefUsers =
                                              currentUserDocument
                                                  ?.userVinculado;
                                        });

                                        context.pushNamed(
                                          'Dashboard',
                                          queryParameters: {
                                            'refUserEmpresa': serializeParam(
                                              FFAppState().docRefUsers,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else if (valueOrDefault(
                                              currentUserDocument?.usuarioTipo,
                                              '') ==
                                          'Advisor') {
                                        setState(() {
                                          FFAppState().QuemNavega = 'Advisor';
                                          FFAppState().docRefUsers =
                                              currentUserDocument
                                                  ?.userVinculado;
                                        });

                                        context.pushNamed(
                                          'DashboardAdvisor',
                                          queryParameters: {
                                            'refUserEmpresa': serializeParam(
                                              FFAppState().docRefUsers,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        if (currentUserDocument
                                                ?.userVinculado !=
                                            null) {
                                          setState(() {
                                            FFAppState().QuemNavega = 'Usuário';
                                            FFAppState().docRefUsers =
                                                currentUserDocument
                                                    ?.userVinculado;
                                          });

                                          context.pushNamed(
                                            'DashboardCliente',
                                            queryParameters: {
                                              'refUserAdvisor': serializeParam(
                                                FFAppState().docRefUsers?.id,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          setState(() {
                                            FFAppState().QuemNavega = 'Usuário';
                                          });

                                          context.pushNamed(
                                            'DashboardCliente',
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

                                      return;
                                    } else {
                                      context.pushNamed('Login');

                                      return;
                                    }
                                  },
                                  text: 'Usuário',
                                  options: FFButtonOptions(
                                    width: 230.0,
                                    height: 52.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0x65008F39),
                                    textStyle:
                                        FlutterFlowTheme.of(context).labelLarge,
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Color(0xFF00800F),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Align(
                              alignment: const AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 16.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    FFAppState().QuemNavega = 'Empresa';
                                    if (loggedIn) {
                                      if (valueOrDefault(
                                              currentUserDocument?.userTipo,
                                              '') ==
                                          'Empresa') {
                                        setState(() {
                                          FFAppState().QuemNavega = 'Empresa';
                                          FFAppState().docRefUsers =
                                              currentUserReference;
                                        });

                                        context.pushNamed(
                                          'Dashboard',
                                          queryParameters: {
                                            'refUserEmpresa': serializeParam(
                                              FFAppState().docRefUsers,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else if ((valueOrDefault(
                                                  currentUserDocument
                                                      ?.usuarioTipo,
                                                  '') ==
                                              'Administrativo') ||
                                          (valueOrDefault(
                                                  currentUserDocument
                                                      ?.usuarioTipo,
                                                  '') ==
                                              'Principal')) {
                                        setState(() {
                                          FFAppState().QuemNavega = 'Empresa';
                                          FFAppState().docRefUsers =
                                              currentUserDocument
                                                  ?.userVinculado;
                                        });

                                        context.pushNamed(
                                          'Dashboard',
                                          queryParameters: {
                                            'refUserEmpresa': serializeParam(
                                              FFAppState().docRefUsers,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else if (valueOrDefault(
                                              currentUserDocument?.usuarioTipo,
                                              '') ==
                                          'Advisor') {
                                        setState(() {
                                          FFAppState().QuemNavega = 'Advisor';
                                          FFAppState().docRefUsers =
                                              currentUserDocument
                                                  ?.userVinculado;
                                        });

                                        context.pushNamed(
                                          'DashboardAdvisor',
                                          queryParameters: {
                                            'refUserEmpresa': serializeParam(
                                              FFAppState().docRefUsers,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        if (currentUserDocument
                                                ?.userVinculado !=
                                            null) {
                                          setState(() {
                                            FFAppState().QuemNavega = 'Usuário';
                                            FFAppState().docRefUsers =
                                                currentUserDocument
                                                    ?.userVinculado;
                                          });

                                          context.pushNamed(
                                            'DashboardCliente',
                                            queryParameters: {
                                              'refUserAdvisor': serializeParam(
                                                FFAppState().docRefUsers?.id,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          setState(() {
                                            FFAppState().QuemNavega = 'Usuário';
                                          });

                                          context.pushNamed(
                                            'DashboardCliente',
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

                                      return;
                                    } else {
                                      context.pushNamed('Login');

                                      return;
                                    }
                                  },
                                  text: 'Empresa',
                                  options: FFButtonOptions(
                                    width: 230.0,
                                    height: 52.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF001D60),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                            .divide(const SizedBox(width: 60.0))
                            .around(const SizedBox(width: 60.0)),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['rowOnPageLoadAnimation2']!),
                  ),
                ),
              if (FFAppState().usuariologado == true)
                FFButtonWidget(
                  onPressed: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    setState(() {
                      FFAppState().usuariologado = false;
                      FFAppState().resultadoEmailCpf = false;
                      FFAppState().resultadoEmailCnpj = false;
                    });

                    context.pushNamedAuth('HomePage', context.mounted);
                  },
                  text: 'logout',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textController',
                    const Duration(milliseconds: 100),
                    () => setState(() {}),
                  ),
                  onFieldSubmitted: (_) async {
                    if (currentUserEmail != '') {
                      setState(() {
                        FFAppState().usuariologado = true;
                      });
                    } else {
                      setState(() {
                        FFAppState().usuariologado = false;
                      });
                    }
                  },
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Label here...',
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
