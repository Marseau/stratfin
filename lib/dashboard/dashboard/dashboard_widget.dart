import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/container_limpo01_widget.dart';
import '/components/container_limpo_widget.dart';
import '/components/dropdown_produto_widget.dart';
import '/components/dropdownconvidados_list_widget.dart';
import '/components/dropdownusers_list_widget.dart';
import '/dashboard/list_view_search/list_view_search_widget.dart';
import '/dashboard/top_nav_empresa/top_nav_empresa_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({
    super.key,
    required this.refUserEmpresa,
  });

  final DocumentReference? refUserEmpresa;

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget>
    with TickerProviderStateMixin {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool expandableListenerRegistered1 = false;
  bool expandableListenerRegistered2 = false;
  bool expandableListenerRegistered3 = false;
  bool expandableListenerRegistered4 = false;
  bool expandableListenerRegistered5 = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
    _model.expandableController3 = ExpandableController(initialExpanded: false);
    _model.expandableController4 = ExpandableController(initialExpanded: false);
    _model.expandableController5 = ExpandableController(initialExpanded: false);

    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textFieldFocusNode5 ??= FocusNode();

    _model.tabBarEmpresaController = TabController(
      vsync: this,
      length: 8,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.tabBarProdutoController = TabController(
      vsync: this,
      length: 9,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: FFAppState().docRefUsers?.id,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).tertiary,
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
        List<UsersRecord> dashboardUsersRecordList = snapshot.data!;
        final dashboardUsersRecord = dashboardUsersRecordList.isNotEmpty
            ? dashboardUsersRecordList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).tertiary,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (valueOrDefault(
                                  currentUserDocument?.userTipo, '') ==
                              'Empresa') {
                            setState(() {
                              FFAppState().docRefUsers = currentUserReference;
                            });
                          } else {
                            _model.empresaVinculante =
                                await queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'user_vinculante',
                                arrayContains: currentUserReference,
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            setState(() {
                              FFAppState().docRefUsers =
                                  _model.empresaVinculante?.reference;
                            });
                          }

                          setState(() {});
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.15,
                          height: MediaQuery.sizeOf(context).height * 0.9,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).asparagus,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.15,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .alternateSecondaryColor,
                                ),
                                alignment: const AlignmentDirectional(0.00, 0.00),
                                child: Stack(
                                  children: [
                                    if (valueOrDefault(
                                                currentUserDocument?.userTipo,
                                                '') ==
                                            'Empresa'
                                        ? (currentUserPhoto != '')
                                        : (dashboardUsersRecord?.photoUrl !=
                                                null &&
                                            dashboardUsersRecord?.photoUrl !=
                                                ''))
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 16.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                valueOrDefault(
                                                            currentUserDocument
                                                                ?.userTipo,
                                                            '') ==
                                                        'Empresa'
                                                    ? currentUserPhoto
                                                    : dashboardUsersRecord!
                                                        .photoUrl,
                                                width: 100.0,
                                                height: 100.0,
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (!((currentUserPhoto != '') ||
                                        (dashboardUsersRecord?.photoUrl !=
                                                null &&
                                            dashboardUsersRecord?.photoUrl !=
                                                '')))
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 16.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/marca_branca_sem_fundo.png',
                                                width: 100.0,
                                                height: 100.0,
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.65,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .alternateSecondaryColor,
                                ),
                                child: ListView(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    8.0,
                                    0,
                                    0,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternateSecondaryColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Builder(builder: (_) {
                                          if (!expandableListenerRegistered1) {
                                            expandableListenerRegistered1 =
                                                true;
                                            _model.expandableController1
                                                .addListener(
                                              () async {
                                                if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.perfilEmpresa,
                                                        false) ==
                                                    false) {
                                                  await OpcoesEscolhaRecord
                                                      .collection
                                                      .doc()
                                                      .set(
                                                          createOpcoesEscolhaRecordData(
                                                        escolha:
                                                            updateOpcoesVariaveisStruct(
                                                          FFAppState()
                                                              .UserOptions,
                                                          clearUnsetFields:
                                                              false,
                                                          create: true,
                                                        ),
                                                        uid: FFAppState()
                                                            .docRefUsers
                                                            ?.id,
                                                        cor:
                                                            updateCoresDefinicaoStruct(
                                                          FFAppState()
                                                              .ColorOptions,
                                                          clearUnsetFields:
                                                              false,
                                                          create: true,
                                                        ),
                                                      ));

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    perfilEmpresa: true,
                                                  ));
                                                } else {
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 10));
                                                }
                                              },
                                            );
                                          }
                                          return Container(
                                            width: double.infinity,
                                            color: FlutterFlowTheme.of(context)
                                                .alternateSecondaryColor,
                                            child: ExpandableNotifier(
                                              controller:
                                                  _model.expandableController1,
                                              child: ExpandablePanel(
                                                header: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.00, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () {
                                                            print(
                                                                'Dashboardb pressed ...');
                                                          },
                                                          text: 'Dashboard',
                                                          icon: const Icon(
                                                            Icons
                                                                .dashboard_rounded,
                                                            size: 18.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 30.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        24.0,
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
                                                                .alternateSecondaryColor,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            hoverColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternateSecondaryColor,
                                                            hoverTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            hoverElevation: 3.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                collapsed: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternateSecondaryColor,
                                                  ),
                                                ),
                                                expanded: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: SelectionArea(
                                                              child:
                                                                  AutoSizeText(
                                                            'Section 1',
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                            minFontSize: 12.0,
                                                          )),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Section 2',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                theme: const ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: false,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternateSecondaryColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Builder(builder: (_) {
                                          if (!expandableListenerRegistered2) {
                                            expandableListenerRegistered2 =
                                                true;
                                            _model.expandableController2
                                                .addListener(
                                              () async {
                                                if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.perfilEmpresa,
                                                        false) ==
                                                    false) {
                                                  await OpcoesEscolhaRecord
                                                      .collection
                                                      .doc()
                                                      .set(
                                                          createOpcoesEscolhaRecordData(
                                                        escolha:
                                                            updateOpcoesVariaveisStruct(
                                                          FFAppState()
                                                              .UserOptions,
                                                          clearUnsetFields:
                                                              false,
                                                          create: true,
                                                        ),
                                                        uid: FFAppState()
                                                            .docRefUsers
                                                            ?.id,
                                                        cor:
                                                            updateCoresDefinicaoStruct(
                                                          FFAppState()
                                                              .ColorOptions,
                                                          clearUnsetFields:
                                                              false,
                                                          create: true,
                                                        ),
                                                      ));

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    perfilEmpresa: true,
                                                  ));
                                                } else {
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 10));
                                                }
                                              },
                                            );
                                          }
                                          return Container(
                                            width: double.infinity,
                                            color: FlutterFlowTheme.of(context)
                                                .alternateSecondaryColor,
                                            child: ExpandableNotifier(
                                              controller:
                                                  _model.expandableController2,
                                              child: ExpandablePanel(
                                                header: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.00, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            if (valueOrDefault<
                                                                        bool>(
                                                                    currentUserDocument
                                                                        ?.perfilEmpresa,
                                                                    false) ==
                                                                false) {
                                                              await OpcoesEscolhaRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set(
                                                                      createOpcoesEscolhaRecordData(
                                                                    escolha:
                                                                        updateOpcoesVariaveisStruct(
                                                                      FFAppState()
                                                                          .UserOptions,
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                    uid: FFAppState()
                                                                        .docRefUsers
                                                                        ?.id,
                                                                    cor:
                                                                        updateCoresDefinicaoStruct(
                                                                      FFAppState()
                                                                          .ColorOptions,
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                  ));

                                                              await currentUserReference!
                                                                  .update(
                                                                      createUsersRecordData(
                                                                perfilEmpresa:
                                                                    true,
                                                              ));
                                                            } else {
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          10));
                                                            }
                                                          },
                                                          text: 'Info',
                                                          icon: const FaIcon(
                                                            FontAwesomeIcons
                                                                .infoCircle,
                                                            size: 18.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 30.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        24.0,
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
                                                                .alternateSecondaryColor,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            hoverColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternateSecondaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                collapsed: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternateSecondaryColor,
                                                  ),
                                                ),
                                                expanded: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (_model
                                                                      .basicas ==
                                                                  true) {
                                                                setState(() {
                                                                  _model.basicas =
                                                                      false;
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  _model.basicas =
                                                                      true;
                                                                  _model.tabbarempresa =
                                                                      false;
                                                                  _model.usuarios =
                                                                      false;
                                                                  _model.advisor =
                                                                      false;
                                                                  _model.produtoTipo =
                                                                      false;
                                                                  _model.produtoCampanha =
                                                                      false;
                                                                });
                                                              }

                                                              if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.perfilEmpresa,
                                                                      false) ==
                                                                  false) {
                                                                await OpcoesEscolhaRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        createOpcoesEscolhaRecordData(
                                                                      escolha:
                                                                          updateOpcoesVariaveisStruct(
                                                                        FFAppState()
                                                                            .UserOptions,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                      uid: FFAppState()
                                                                          .docRefUsers
                                                                          ?.id,
                                                                      cor:
                                                                          updateCoresDefinicaoStruct(
                                                                        FFAppState()
                                                                            .ColorOptions,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                    ));

                                                                await currentUserReference!
                                                                    .update(
                                                                        createUsersRecordData(
                                                                  perfilEmpresa:
                                                                      true,
                                                                ));
                                                              } else {
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            10));
                                                              }
                                                            },
                                                            text: 'Básicas',
                                                            icon: const FaIcon(
                                                              FontAwesomeIcons
                                                                  .bars,
                                                              size: 18.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 30.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          24.0,
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
                                                                  .alternateSecondaryColor,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternateSecondaryColor,
                                                              hoverTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              hoverElevation:
                                                                  3.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.perfilEmpresa,
                                                                      false) ==
                                                                  false) {
                                                                await OpcoesEscolhaRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        createOpcoesEscolhaRecordData(
                                                                      escolha:
                                                                          updateOpcoesVariaveisStruct(
                                                                        FFAppState()
                                                                            .UserOptions,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                      uid: FFAppState()
                                                                          .docRefUsers
                                                                          ?.id,
                                                                      cor:
                                                                          updateCoresDefinicaoStruct(
                                                                        FFAppState()
                                                                            .ColorOptions,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                    ));

                                                                await currentUserReference!
                                                                    .update(
                                                                        createUsersRecordData(
                                                                  perfilEmpresa:
                                                                      true,
                                                                ));
                                                              } else {
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            10));
                                                              }
                                                            },
                                                            text: 'APP',
                                                            icon: const Icon(
                                                              Icons.touch_app,
                                                              size: 18.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 30.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          24.0,
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
                                                                  .alternateSecondaryColor,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternateSecondaryColor,
                                                              hoverTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              hoverElevation:
                                                                  3.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                theme: ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                  expandIcon:
                                                      Icons.arrow_forward,
                                                  collapseIcon:
                                                      Icons.arrow_downward,
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternateSecondaryColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Builder(builder: (_) {
                                          if (!expandableListenerRegistered3) {
                                            expandableListenerRegistered3 =
                                                true;
                                            _model.expandableController3
                                                .addListener(
                                              () async {
                                                if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.perfilEmpresa,
                                                        false) ==
                                                    false) {
                                                  await OpcoesEscolhaRecord
                                                      .collection
                                                      .doc()
                                                      .set(
                                                          createOpcoesEscolhaRecordData(
                                                        escolha:
                                                            updateOpcoesVariaveisStruct(
                                                          FFAppState()
                                                              .UserOptions,
                                                          clearUnsetFields:
                                                              false,
                                                          create: true,
                                                        ),
                                                        uid: FFAppState()
                                                            .docRefUsers
                                                            ?.id,
                                                        cor:
                                                            updateCoresDefinicaoStruct(
                                                          FFAppState()
                                                              .ColorOptions,
                                                          clearUnsetFields:
                                                              false,
                                                          create: true,
                                                        ),
                                                      ));

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    perfilEmpresa: true,
                                                  ));
                                                } else {
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 10));
                                                }
                                              },
                                            );
                                          }
                                          return Container(
                                            width: double.infinity,
                                            color: FlutterFlowTheme.of(context)
                                                .alternateSecondaryColor,
                                            child: ExpandableNotifier(
                                              controller:
                                                  _model.expandableController3,
                                              child: ExpandablePanel(
                                                header: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.00, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            if (valueOrDefault<
                                                                        bool>(
                                                                    currentUserDocument
                                                                        ?.perfilEmpresa,
                                                                    false) ==
                                                                false) {
                                                              await OpcoesEscolhaRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set(
                                                                      createOpcoesEscolhaRecordData(
                                                                    escolha:
                                                                        updateOpcoesVariaveisStruct(
                                                                      FFAppState()
                                                                          .UserOptions,
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                    uid: FFAppState()
                                                                        .docRefUsers
                                                                        ?.id,
                                                                    cor:
                                                                        updateCoresDefinicaoStruct(
                                                                      FFAppState()
                                                                          .ColorOptions,
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                  ));

                                                              await currentUserReference!
                                                                  .update(
                                                                      createUsersRecordData(
                                                                perfilEmpresa:
                                                                    true,
                                                              ));
                                                            } else {
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          10));
                                                            }
                                                          },
                                                          text: 'Admin',
                                                          icon: const Icon(
                                                            Icons
                                                                .admin_panel_settings_outlined,
                                                            size: 18.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 30.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        24.0,
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
                                                                .alternateSecondaryColor,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            hoverColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternateSecondaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                collapsed: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternateSecondaryColor,
                                                  ),
                                                ),
                                                expanded: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (_model
                                                                      .usuarios ==
                                                                  true) {
                                                                setState(() {
                                                                  _model.usuarios =
                                                                      false;
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  _model.usuarios =
                                                                      true;
                                                                  _model.basicas =
                                                                      false;
                                                                  _model.tabbarempresa =
                                                                      false;
                                                                  _model.advisor =
                                                                      false;
                                                                  _model.produtoTipo =
                                                                      false;
                                                                  _model.produtoCampanha =
                                                                      false;
                                                                });
                                                              }

                                                              if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.perfilEmpresa,
                                                                      false) ==
                                                                  false) {
                                                                await OpcoesEscolhaRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        createOpcoesEscolhaRecordData(
                                                                      escolha:
                                                                          updateOpcoesVariaveisStruct(
                                                                        FFAppState()
                                                                            .UserOptions,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                      uid: FFAppState()
                                                                          .docRefUsers
                                                                          ?.id,
                                                                      cor:
                                                                          updateCoresDefinicaoStruct(
                                                                        FFAppState()
                                                                            .ColorOptions,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                    ));

                                                                await currentUserReference!
                                                                    .update(
                                                                        createUsersRecordData(
                                                                  perfilEmpresa:
                                                                      true,
                                                                ));
                                                              } else {
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            10));
                                                              }
                                                            },
                                                            text: 'Usuários',
                                                            icon: const FaIcon(
                                                              FontAwesomeIcons
                                                                  .solidUser,
                                                              size: 16.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 30.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          24.0,
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
                                                                  .alternateSecondaryColor,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternateSecondaryColor,
                                                              hoverTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              hoverElevation:
                                                                  3.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (_model
                                                                      .tabbarempresa ==
                                                                  true) {
                                                                setState(() {
                                                                  _model.tabbarempresa =
                                                                      false;
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  _model.usuarios =
                                                                      false;
                                                                  _model.basicas =
                                                                      false;
                                                                  _model.tabbarempresa =
                                                                      true;
                                                                  _model.advisor =
                                                                      false;
                                                                  _model.produtoTipo =
                                                                      false;
                                                                  _model.produtoCampanha =
                                                                      false;
                                                                  _model.tabbarproduto =
                                                                      false;
                                                                });
                                                              }

                                                              if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.perfilEmpresa,
                                                                      false) ==
                                                                  false) {
                                                                await OpcoesEscolhaRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        createOpcoesEscolhaRecordData(
                                                                      escolha:
                                                                          updateOpcoesVariaveisStruct(
                                                                        FFAppState()
                                                                            .UserOptions,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                      uid: FFAppState()
                                                                          .docRefUsers
                                                                          ?.id,
                                                                      cor:
                                                                          updateCoresDefinicaoStruct(
                                                                        FFAppState()
                                                                            .ColorOptions,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                    ));

                                                                await currentUserReference!
                                                                    .update(
                                                                        createUsersRecordData(
                                                                  perfilEmpresa:
                                                                      true,
                                                                ));
                                                              } else {
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            10));
                                                              }
                                                            },
                                                            text:
                                                                'Opções Padrão',
                                                            icon: const Icon(
                                                              Icons
                                                                  .keyboard_option_key,
                                                              size: 18.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 30.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          24.0,
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
                                                                  .alternateSecondaryColor,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternateSecondaryColor,
                                                              hoverTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              hoverElevation:
                                                                  3.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (_model
                                                                      .tabbarproduto ==
                                                                  true) {
                                                                setState(() {
                                                                  _model.tabbarproduto =
                                                                      false;
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  _model.usuarios =
                                                                      false;
                                                                  _model.basicas =
                                                                      false;
                                                                  _model.tabbarempresa =
                                                                      false;
                                                                  _model.advisor =
                                                                      false;
                                                                  _model.produtoTipo =
                                                                      false;
                                                                  _model.produtoCampanha =
                                                                      false;
                                                                  _model.tabbarproduto =
                                                                      true;
                                                                });
                                                              }

                                                              if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.perfilEmpresa,
                                                                      false) ==
                                                                  false) {
                                                                await OpcoesEscolhaRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        createOpcoesEscolhaRecordData(
                                                                      escolha:
                                                                          updateOpcoesVariaveisStruct(
                                                                        FFAppState()
                                                                            .UserOptions,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                      uid: FFAppState()
                                                                          .docRefUsers
                                                                          ?.id,
                                                                      cor:
                                                                          updateCoresDefinicaoStruct(
                                                                        FFAppState()
                                                                            .ColorOptions,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                    ));

                                                                await currentUserReference!
                                                                    .update(
                                                                        createUsersRecordData(
                                                                  perfilEmpresa:
                                                                      true,
                                                                ));
                                                              } else {
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            10));
                                                              }
                                                            },
                                                            text:
                                                                'Opções Produto',
                                                            icon: const Icon(
                                                              Icons
                                                                  .keyboard_option_key,
                                                              size: 18.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 30.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          24.0,
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
                                                                  .alternateSecondaryColor,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternateSecondaryColor,
                                                              hoverTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              hoverElevation:
                                                                  3.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                theme: ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                  expandIcon:
                                                      Icons.arrow_forward,
                                                  collapseIcon:
                                                      Icons.arrow_downward,
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternateSecondaryColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Builder(builder: (_) {
                                          if (!expandableListenerRegistered4) {
                                            expandableListenerRegistered4 =
                                                true;
                                            _model.expandableController4
                                                .addListener(
                                              () async {
                                                if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.perfilEmpresa,
                                                        false) ==
                                                    false) {
                                                  await OpcoesEscolhaRecord
                                                      .collection
                                                      .doc()
                                                      .set(
                                                          createOpcoesEscolhaRecordData(
                                                        escolha:
                                                            updateOpcoesVariaveisStruct(
                                                          FFAppState()
                                                              .UserOptions,
                                                          clearUnsetFields:
                                                              false,
                                                          create: true,
                                                        ),
                                                        uid: FFAppState()
                                                            .docRefUsers
                                                            ?.id,
                                                        cor:
                                                            updateCoresDefinicaoStruct(
                                                          FFAppState()
                                                              .ColorOptions,
                                                          clearUnsetFields:
                                                              false,
                                                          create: true,
                                                        ),
                                                      ));

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    perfilEmpresa: true,
                                                  ));
                                                } else {
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 10));
                                                }
                                              },
                                            );
                                          }
                                          return Container(
                                            width: double.infinity,
                                            color: FlutterFlowTheme.of(context)
                                                .alternateSecondaryColor,
                                            child: ExpandableNotifier(
                                              controller:
                                                  _model.expandableController4,
                                              child: ExpandablePanel(
                                                header: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.00, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            if (_model
                                                                    .advisor ==
                                                                true) {
                                                              setState(() {
                                                                _model.advisor =
                                                                    false;
                                                              });
                                                            } else {
                                                              setState(() {
                                                                _model.basicas =
                                                                    false;
                                                                _model.tabbarempresa =
                                                                    false;
                                                                _model.usuarios =
                                                                    false;
                                                                _model.advisor =
                                                                    true;
                                                                _model.produtoTipo =
                                                                    false;
                                                                _model.produtoCampanha =
                                                                    false;
                                                              });
                                                            }

                                                            if (valueOrDefault<
                                                                        bool>(
                                                                    currentUserDocument
                                                                        ?.perfilEmpresa,
                                                                    false) ==
                                                                false) {
                                                              await OpcoesEscolhaRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set(
                                                                      createOpcoesEscolhaRecordData(
                                                                    escolha:
                                                                        updateOpcoesVariaveisStruct(
                                                                      FFAppState()
                                                                          .UserOptions,
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                    uid: FFAppState()
                                                                        .docRefUsers
                                                                        ?.id,
                                                                    cor:
                                                                        updateCoresDefinicaoStruct(
                                                                      FFAppState()
                                                                          .ColorOptions,
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                  ));

                                                              await currentUserReference!
                                                                  .update(
                                                                      createUsersRecordData(
                                                                perfilEmpresa:
                                                                    true,
                                                              ));
                                                            } else {
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          10));
                                                            }
                                                          },
                                                          text: 'Advisor',
                                                          icon: const Icon(
                                                            Icons
                                                                .location_history_sharp,
                                                            size: 18.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 30.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        24.0,
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
                                                                .alternateSecondaryColor,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            hoverColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternateSecondaryColor,
                                                            hoverTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            hoverElevation: 3.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                collapsed: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternateSecondaryColor,
                                                  ),
                                                ),
                                                expanded: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            if (valueOrDefault<
                                                                        bool>(
                                                                    currentUserDocument
                                                                        ?.perfilEmpresa,
                                                                    false) ==
                                                                false) {
                                                              await OpcoesEscolhaRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set(
                                                                      createOpcoesEscolhaRecordData(
                                                                    escolha:
                                                                        updateOpcoesVariaveisStruct(
                                                                      FFAppState()
                                                                          .UserOptions,
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                    uid: FFAppState()
                                                                        .docRefUsers
                                                                        ?.id,
                                                                    cor:
                                                                        updateCoresDefinicaoStruct(
                                                                      FFAppState()
                                                                          .ColorOptions,
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                  ));

                                                              await currentUserReference!
                                                                  .update(
                                                                      createUsersRecordData(
                                                                perfilEmpresa:
                                                                    true,
                                                              ));
                                                            } else {
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          10));
                                                            }
                                                          },
                                                          text: 'Básicas',
                                                          options:
                                                              FFButtonOptions(
                                                            height: 30.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        24.0,
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
                                                                .alternateSecondaryColor,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            hoverColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternateSecondaryColor,
                                                            hoverTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            hoverElevation: 3.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            if (valueOrDefault<
                                                                        bool>(
                                                                    currentUserDocument
                                                                        ?.perfilEmpresa,
                                                                    false) ==
                                                                false) {
                                                              await OpcoesEscolhaRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set(
                                                                      createOpcoesEscolhaRecordData(
                                                                    escolha:
                                                                        updateOpcoesVariaveisStruct(
                                                                      FFAppState()
                                                                          .UserOptions,
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                    uid: FFAppState()
                                                                        .docRefUsers
                                                                        ?.id,
                                                                    cor:
                                                                        updateCoresDefinicaoStruct(
                                                                      FFAppState()
                                                                          .ColorOptions,
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                  ));

                                                              await currentUserReference!
                                                                  .update(
                                                                      createUsersRecordData(
                                                                perfilEmpresa:
                                                                    true,
                                                              ));
                                                            } else {
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          10));
                                                            }
                                                          },
                                                          text: 'Básicas',
                                                          options:
                                                              FFButtonOptions(
                                                            height: 30.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        24.0,
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
                                                                .alternateSecondaryColor,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            hoverColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternateSecondaryColor,
                                                            hoverTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            hoverElevation: 3.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                theme: const ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: false,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternateSecondaryColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Builder(builder: (_) {
                                          if (!expandableListenerRegistered5) {
                                            expandableListenerRegistered5 =
                                                true;
                                            _model.expandableController5
                                                .addListener(
                                              () async {
                                                if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.perfilEmpresa,
                                                        false) ==
                                                    false) {
                                                  await OpcoesEscolhaRecord
                                                      .collection
                                                      .doc()
                                                      .set(
                                                          createOpcoesEscolhaRecordData(
                                                        escolha:
                                                            updateOpcoesVariaveisStruct(
                                                          FFAppState()
                                                              .UserOptions,
                                                          clearUnsetFields:
                                                              false,
                                                          create: true,
                                                        ),
                                                        uid: FFAppState()
                                                            .docRefUsers
                                                            ?.id,
                                                        cor:
                                                            updateCoresDefinicaoStruct(
                                                          FFAppState()
                                                              .ColorOptions,
                                                          clearUnsetFields:
                                                              false,
                                                          create: true,
                                                        ),
                                                      ));

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    perfilEmpresa: true,
                                                  ));
                                                } else {
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 10));
                                                }
                                              },
                                            );
                                          }
                                          return Container(
                                            width: double.infinity,
                                            color: FlutterFlowTheme.of(context)
                                                .alternateSecondaryColor,
                                            child: ExpandableNotifier(
                                              controller:
                                                  _model.expandableController5,
                                              child: ExpandablePanel(
                                                header: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if (valueOrDefault<
                                                                    bool>(
                                                                currentUserDocument
                                                                    ?.perfilEmpresa,
                                                                false) ==
                                                            false) {
                                                          await OpcoesEscolhaRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  createOpcoesEscolhaRecordData(
                                                                escolha:
                                                                    updateOpcoesVariaveisStruct(
                                                                  FFAppState()
                                                                      .UserOptions,
                                                                  clearUnsetFields:
                                                                      false,
                                                                  create: true,
                                                                ),
                                                                uid: FFAppState()
                                                                    .docRefUsers
                                                                    ?.id,
                                                                cor:
                                                                    updateCoresDefinicaoStruct(
                                                                  FFAppState()
                                                                      .ColorOptions,
                                                                  clearUnsetFields:
                                                                      false,
                                                                  create: true,
                                                                ),
                                                              ));

                                                          await currentUserReference!
                                                              .update(
                                                                  createUsersRecordData(
                                                            perfilEmpresa: true,
                                                          ));
                                                        } else {
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      10));
                                                        }
                                                      },
                                                      text: 'Produtos',
                                                      icon: const Icon(
                                                        Icons
                                                            .production_quantity_limits_outlined,
                                                        size: 18.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 30.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    24.0,
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
                                                            .alternateSecondaryColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternateSecondaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                collapsed: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternateSecondaryColor,
                                                  ),
                                                ),
                                                expanded: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (_model
                                                                      .produtoTipo ==
                                                                  true) {
                                                                setState(() {
                                                                  _model.produtoTipo =
                                                                      false;
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  _model.basicas =
                                                                      false;
                                                                  _model.tabbarempresa =
                                                                      false;
                                                                  _model.usuarios =
                                                                      false;
                                                                  _model.advisor =
                                                                      false;
                                                                  _model.produtoTipo =
                                                                      true;
                                                                  _model.produtoCampanha =
                                                                      false;
                                                                  _model.tabbarproduto =
                                                                      false;
                                                                });
                                                              }

                                                              if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.perfilEmpresa,
                                                                      false) ==
                                                                  false) {
                                                                await OpcoesEscolhaRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        createOpcoesEscolhaRecordData(
                                                                      escolha:
                                                                          updateOpcoesVariaveisStruct(
                                                                        FFAppState()
                                                                            .UserOptions,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                      uid: FFAppState()
                                                                          .docRefUsers
                                                                          ?.id,
                                                                      cor:
                                                                          updateCoresDefinicaoStruct(
                                                                        FFAppState()
                                                                            .ColorOptions,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                    ));

                                                                await currentUserReference!
                                                                    .update(
                                                                        createUsersRecordData(
                                                                  perfilEmpresa:
                                                                      true,
                                                                ));
                                                              } else {
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            10));
                                                              }
                                                            },
                                                            text: 'Tipos',
                                                            icon: const Icon(
                                                              Icons
                                                                  .type_specimen,
                                                              size: 18.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 30.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          24.0,
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
                                                                  .alternateSecondaryColor,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternateSecondaryColor,
                                                              hoverTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              hoverElevation:
                                                                  3.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (_model
                                                                      .produtoCampanha ==
                                                                  true) {
                                                                setState(() {
                                                                  _model.produtoCampanha =
                                                                      false;
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  _model.basicas =
                                                                      false;
                                                                  _model.tabbarempresa =
                                                                      false;
                                                                  _model.usuarios =
                                                                      false;
                                                                  _model.advisor =
                                                                      false;
                                                                  _model.produtoCampanha =
                                                                      true;
                                                                  _model.produtoTipo =
                                                                      false;
                                                                });
                                                              }

                                                              if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.perfilEmpresa,
                                                                      false) ==
                                                                  false) {
                                                                await OpcoesEscolhaRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        createOpcoesEscolhaRecordData(
                                                                      escolha:
                                                                          updateOpcoesVariaveisStruct(
                                                                        FFAppState()
                                                                            .UserOptions,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                      uid: FFAppState()
                                                                          .docRefUsers
                                                                          ?.id,
                                                                      cor:
                                                                          updateCoresDefinicaoStruct(
                                                                        FFAppState()
                                                                            .ColorOptions,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                    ));

                                                                await currentUserReference!
                                                                    .update(
                                                                        createUsersRecordData(
                                                                  perfilEmpresa:
                                                                      true,
                                                                ));
                                                              } else {
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            10));
                                                              }
                                                            },
                                                            text: 'Campanhas',
                                                            icon: const Icon(
                                                              Icons
                                                                  .campaign_sharp,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 30.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          24.0,
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
                                                                  .alternateSecondaryColor,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternateSecondaryColor,
                                                              hoverTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              hoverElevation:
                                                                  3.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                theme: ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                  expandIcon:
                                                      Icons.arrow_forward,
                                                  collapseIcon:
                                                      Icons.arrow_downward,
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 8.0)),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.00, 1.00),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.1,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .alternateSecondaryColor,
                                  ),
                                  child: Align(
                                    alignment:
                                        const AlignmentDirectional(-1.00, 0.00),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (loggedIn == true)
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.00, 0.00),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    GoRouter.of(context)
                                                        .prepareAuthEvent();
                                                    await authManager.signOut();
                                                    GoRouter.of(context)
                                                        .clearRedirectLocation();

                                                    context.goNamedAuth(
                                                        'HomePage',
                                                        context.mounted);
                                                  },
                                                  text: 'Log Out',
                                                  icon: const Icon(
                                                    Icons.logout_outlined,
                                                    size: 18.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 30.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternateSecondaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    hoverColor: FlutterFlowTheme
                                                            .of(context)
                                                        .alternateSecondaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.00, 0.00),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  FFAppState().docRefUsers?.id,
                                                  'Null',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.00, 1.00),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.1,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).asparagus,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.00, -1.00),
                              child: StreamBuilder<List<OpcoesEscolhaRecord>>(
                                stream: queryOpcoesEscolhaRecord(
                                  queryBuilder: (opcoesEscolhaRecord) =>
                                      opcoesEscolhaRecord.where(
                                    'uid',
                                    isEqualTo: dashboardUsersRecord?.uid,
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<OpcoesEscolhaRecord>
                                      containerOpcoesEscolhaRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final containerOpcoesEscolhaRecord =
                                      containerOpcoesEscolhaRecordList
                                              .isNotEmpty
                                          ? containerOpcoesEscolhaRecordList
                                              .first
                                          : null;
                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.85,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.9,
                                    decoration: const BoxDecoration(
                                      color: Color(0x9DFFFFFF),
                                    ),
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.1,
                                              decoration: const BoxDecoration(
                                                color: Color(0x9DFFFFFF),
                                              ),
                                              child: wrapWithModel(
                                                model:
                                                    _model.topNavEmpresaModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: const TopNavEmpresaWidget(),
                                              ),
                                            ),
                                            Stack(
                                              children: [
                                                if (_model.basicas == true)
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.85,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.8,
                                                    decoration: const BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.00, -1.00),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 300.0,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                Text(
                                                                          valueOrDefault(currentUserDocument?.userTipo, '') == 'Empresa'
                                                                              ? currentUserEmail
                                                                              : valueOrDefault<String>(
                                                                                  dashboardUsersRecord?.email,
                                                                                  'Null',
                                                                                ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                fontSize: 16.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                Text(
                                                                          valueOrDefault(currentUserDocument?.userTipo, '') == 'Empresa'
                                                                              ? valueOrDefault(currentUserDocument?.cpfCnpj, '')
                                                                              : valueOrDefault<String>(
                                                                                  dashboardUsersRecord?.cpfCnpj,
                                                                                  'Null',
                                                                                ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                fontSize: 16.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    final selectedMedia =
                                                                        await selectMediaWithSourceBottomSheet(
                                                                      context:
                                                                          context,
                                                                      imageQuality:
                                                                          100,
                                                                      allowPhoto:
                                                                          true,
                                                                    );
                                                                    if (selectedMedia !=
                                                                            null &&
                                                                        selectedMedia.every((m) => validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                      setState(() =>
                                                                          _model.isDataUploading =
                                                                              true);
                                                                      var selectedUploadedFiles =
                                                                          <FFUploadedFile>[];

                                                                      var downloadUrls =
                                                                          <String>[];
                                                                      try {
                                                                        selectedUploadedFiles = selectedMedia
                                                                            .map((m) => FFUploadedFile(
                                                                                  name: m.storagePath.split('/').last,
                                                                                  bytes: m.bytes,
                                                                                  height: m.dimensions?.height,
                                                                                  width: m.dimensions?.width,
                                                                                  blurHash: m.blurHash,
                                                                                ))
                                                                            .toList();

                                                                        downloadUrls = (await Future
                                                                                .wait(
                                                                          selectedMedia
                                                                              .map(
                                                                            (m) async =>
                                                                                await uploadData(m.storagePath, m.bytes),
                                                                          ),
                                                                        ))
                                                                            .where((u) =>
                                                                                u !=
                                                                                null)
                                                                            .map((u) =>
                                                                                u!)
                                                                            .toList();
                                                                      } finally {
                                                                        _model.isDataUploading =
                                                                            false;
                                                                      }
                                                                      if (selectedUploadedFiles.length ==
                                                                              selectedMedia
                                                                                  .length &&
                                                                          downloadUrls.length ==
                                                                              selectedMedia.length) {
                                                                        setState(
                                                                            () {
                                                                          _model.uploadedLocalFile =
                                                                              selectedUploadedFiles.first;
                                                                          _model.uploadedFileUrl =
                                                                              downloadUrls.first;
                                                                        });
                                                                      } else {
                                                                        setState(
                                                                            () {});
                                                                        return;
                                                                      }
                                                                    }
                                                                  },
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        1.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          200.0,
                                                                      height:
                                                                          200.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              Image.network(
                                                                            _model.uploadedFileUrl,
                                                                          ).image,
                                                                        ),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                4.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            offset:
                                                                                const Offset(0.0, 2.0),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      alignment: const AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Stack(
                                                                            children: [
                                                                              if (valueOrDefault(currentUserDocument?.userTipo, '') == 'Empresa' ? (currentUserPhoto != '') : (dashboardUsersRecord?.photoUrl != null && dashboardUsersRecord?.photoUrl != ''))
                                                                                AuthUserStreamWidget(
                                                                                  builder: (context) => ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      valueOrDefault(currentUserDocument?.userTipo, '') == 'Empresa' ? currentUserPhoto : dashboardUsersRecord!.photoUrl,
                                                                                      width: 200.0,
                                                                                      height: 200.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (currentUserPhoto == '')
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(0.00, 1.00),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
                                                                                    child: AuthUserStreamWidget(
                                                                                      builder: (context) => Text(
                                                                                        'Upload seu Logo aqui\njpeg ou png',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (currentUserPhoto == '')
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(0.00, 0.00),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                                                                                    child: AuthUserStreamWidget(
                                                                                      builder: (context) => Icon(
                                                                                        Icons.add_photo_alternate_outlined,
                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                        size: 40.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              Align(
                                                                                alignment: const AlignmentDirectional(1.00, -1.00),
                                                                                child: FlutterFlowIconButton(
                                                                                  buttonSize: 46.0,
                                                                                  hoverColor: FlutterFlowTheme.of(context).charcoal,
                                                                                  icon: const Icon(
                                                                                    Icons.close_rounded,
                                                                                    color: Color(0xFF00800F),
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    setState(() {
                                                                                      _model.isDataUploading = false;
                                                                                      _model.uploadedLocalFile = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                      _model.uploadedFileUrl = '';
                                                                                    });
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          40.0,
                                                                          8.0,
                                                                          40.0,
                                                                          0.0),
                                                                  child:
                                                                      AuthUserStreamWidget(
                                                                    builder:
                                                                        (context) =>
                                                                            SizedBox(
                                                                      width:
                                                                          300.0,
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textController1 ??=
                                                                                TextEditingController(
                                                                          text: valueOrDefault(currentUserDocument?.userTipo, '') == 'Empresa'
                                                                              ? currentUserDisplayName
                                                                              : dashboardUsersRecord?.displayName,
                                                                        ),
                                                                        focusNode:
                                                                            _model.textFieldFocusNode1,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelText:
                                                                              'Razão Social *',
                                                                          labelStyle:
                                                                              const TextStyle(
                                                                            color:
                                                                                Color(0xFF00800F),
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                          enabledBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).success,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          errorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).customBottom,
                                                                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              8.0,
                                                                              0.0,
                                                                              8.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.w300,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                            ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).accent1,
                                                                        validator: _model
                                                                            .textController1Validator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            40.0,
                                                                            8.0,
                                                                            40.0,
                                                                            0.0),
                                                                    child:
                                                                        AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              SizedBox(
                                                                        width:
                                                                            300.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.textController2 ??=
                                                                              TextEditingController(
                                                                            text: valueOrDefault(currentUserDocument?.userTipo, '') == 'Empresa'
                                                                                ? valueOrDefault(currentUserDocument?.apelido, '')
                                                                                : dashboardUsersRecord?.apelido,
                                                                          ),
                                                                          focusNode:
                                                                              _model.textFieldFocusNode2,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'Nome Fantasia*',
                                                                            labelStyle:
                                                                                const TextStyle(
                                                                              color: Color(0xFF00800F),
                                                                              fontWeight: FontWeight.normal,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                            enabledBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).success,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            errorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).customBottom,
                                                                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                8.0,
                                                                                0.0,
                                                                                8.0),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).accent1,
                                                                          validator: _model
                                                                              .textController2Validator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            40.0,
                                                                            8.0,
                                                                            40.0,
                                                                            0.0),
                                                                    child:
                                                                        AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              SizedBox(
                                                                        width:
                                                                            300.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.textController3 ??=
                                                                              TextEditingController(
                                                                            text: valueOrDefault(currentUserDocument?.userTipo, '') == 'Empresa'
                                                                                ? currentPhoneNumber
                                                                                : dashboardUsersRecord?.phoneNumber,
                                                                          ),
                                                                          focusNode:
                                                                              _model.textFieldFocusNode3,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'Telefone*',
                                                                            labelStyle:
                                                                                const TextStyle(
                                                                              color: Color(0xFF00800F),
                                                                              fontWeight: FontWeight.normal,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                            enabledBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).success,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            errorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).customBottom,
                                                                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                8.0,
                                                                                0.0,
                                                                                8.0),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).accent1,
                                                                          validator: _model
                                                                              .textController3Validator
                                                                              .asValidator(context),
                                                                          inputFormatters: [
                                                                            _model.textFieldMask3
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            40.0,
                                                                            8.0,
                                                                            40.0,
                                                                            0.0),
                                                                    child:
                                                                        AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              SizedBox(
                                                                        width:
                                                                            300.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.textController4 ??=
                                                                              TextEditingController(
                                                                            text: valueOrDefault(currentUserDocument?.userTipo, '') == 'Empresa'
                                                                                ? valueOrDefault(currentUserDocument?.nomeResponsavel, '')
                                                                                : dashboardUsersRecord?.nomeResponsavel,
                                                                          ),
                                                                          focusNode:
                                                                              _model.textFieldFocusNode4,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'Nome do Responsável*',
                                                                            labelStyle:
                                                                                const TextStyle(
                                                                              color: Color(0xFF00800F),
                                                                              fontWeight: FontWeight.normal,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                            enabledBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).success,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            errorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).customBottom,
                                                                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                8.0,
                                                                                0.0,
                                                                                8.0),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).accent1,
                                                                          validator: _model
                                                                              .textController4Validator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            40.0,
                                                                            8.0,
                                                                            40.0,
                                                                            0.0),
                                                                    child:
                                                                        AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              SizedBox(
                                                                        width:
                                                                            300.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.textController5 ??=
                                                                              TextEditingController(
                                                                            text: valueOrDefault(currentUserDocument?.userTipo, '') == 'Empresa'
                                                                                ? valueOrDefault(currentUserDocument?.bio, '')
                                                                                : dashboardUsersRecord?.bio,
                                                                          ),
                                                                          focusNode:
                                                                              _model.textFieldFocusNode5,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'Bio *',
                                                                            labelStyle:
                                                                                const TextStyle(
                                                                              color: Color(0xFF00800F),
                                                                              fontWeight: FontWeight.normal,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                            enabledBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).success,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            errorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).customBottom,
                                                                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                8.0,
                                                                                0.0,
                                                                                8.0),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          maxLines:
                                                                              4,
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).accent1,
                                                                          validator: _model
                                                                              .textController5Validator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            40.0,
                                                                            16.0,
                                                                            40.0,
                                                                            0.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        if (valueOrDefault(currentUserDocument?.userTipo,
                                                                                '') ==
                                                                            'Empresa') {
                                                                          await currentUserReference!
                                                                              .update(createUsersRecordData(
                                                                            displayName:
                                                                                _model.textController1.text,
                                                                            phoneNumber:
                                                                                _model.textController3.text,
                                                                            photoUrl:
                                                                                _model.uploadedFileUrl,
                                                                            bio:
                                                                                _model.textController5.text,
                                                                            apelido:
                                                                                _model.textController2.text,
                                                                            nomeResponsavel:
                                                                                _model.textController4.text,
                                                                          ));
                                                                          return;
                                                                        } else {
                                                                          await dashboardUsersRecord!
                                                                              .reference
                                                                              .update(createUsersRecordData(
                                                                            displayName:
                                                                                _model.textController1.text,
                                                                            phoneNumber:
                                                                                _model.textController3.text,
                                                                            photoUrl:
                                                                                _model.uploadedFileUrl,
                                                                            bio:
                                                                                _model.textController5.text,
                                                                            apelido:
                                                                                _model.textController2.text,
                                                                            nomeResponsavel:
                                                                                _model.textController4.text,
                                                                          ));
                                                                          return;
                                                                        }
                                                                      },
                                                                      text:
                                                                          'Atualizar',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            50.0,
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: const Color(
                                                                            0xFF00800F),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Color(0xFF5F9845),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
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
                                                if (_model.usuarios == true)
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.85,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.8,
                                                    decoration: const BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .dropdownconvidadosListModel1,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                const DropdownconvidadosListWidget(
                                                              adicionar: true,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .dropdownusersListModel1,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                const DropdownusersListWidget(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (_model.tabbarempresa ==
                                                    true)
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.85,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.8,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              _model.activetab =
                                                                  _model
                                                                      .tabBarProdutoCurrentIndex;
                                                              _model.activetabNome =
                                                                  '';
                                                            });
                                                          },
                                                          child: Column(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const Alignment(
                                                                        0.0, 0),
                                                                child: TabBar(
                                                                  isScrollable:
                                                                      true,
                                                                  labelColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .asparagus,
                                                                  unselectedLabelColor:
                                                                      const Color(
                                                                          0xFF00000F),
                                                                  labelPadding:
                                                                      const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        fontSize:
                                                                            18.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                      ),
                                                                  unselectedLabelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                      ),
                                                                  indicatorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .asparagus,
                                                                  indicatorWeight:
                                                                      2.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  tabs: const [
                                                                    Tab(
                                                                      text:
                                                                          'PESSOAL',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'RELAÇÃO',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'DEPENDENTES',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'PROFISSIONAL',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'BENS',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'OBJETIVO',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'SEGURO',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'PRAZO',
                                                                    ),
                                                                  ],
                                                                  controller: _model
                                                                      .tabBarEmpresaController,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    TabBarView(
                                                                  controller: _model
                                                                      .tabBarEmpresaController,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.3,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel1,
                                                                                updateCallback: () => setState(() {}),
                                                                                updateOnChange: true,
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'PERFIL',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'suitabilities',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.suitabilities,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.3,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel2,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'IRPF',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'IRPF',
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.irpf,
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.32,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel3,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'GÊNERO (aposentadoria)',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'generos',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.generos,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.6,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel4,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'ESTADO CIVIL',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'estado_civil',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.estadoCivil,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.6,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel5,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'REGIME DE UNIÃO',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'regimeuniao',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.regimeuniao,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.6,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel6,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'DEPENDENTES',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'dependentes',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.dependentes,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.6,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel7,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'PROFISSIONAL',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'vinculoprofissional',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.vinculoprofissional,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.6,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel8,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'ATIVO',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'ativotipo',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.ativotipo,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.6,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel9,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'PASSIVO',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'passivotipo',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.passivotipo,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.32,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel10,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'CONSUMO PATRIMÔNIO',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'consumopatrimonio',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.consumopatrimonio,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.3,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel11,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'STATUS PATRIMÔNIO',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'statuspatrimonio',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.statuspatrimonio,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.32,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel12,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'PROJETO DE VIDA',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'projetosvida',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.projetosvida,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.6,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel13,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'EMPRESA',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'seguroempresa',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.seguroempresa,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.6,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel14,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'TIPO',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'segurotipo',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.segurotipo,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.6,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel15,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'PAGAMENTO',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'pagamento',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.pagamento,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.6,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel16,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'RECEBIMENTO',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'recebimento',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.recebimento,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
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
                                                if (_model.advisor == true)
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.85,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.8,
                                                    decoration: const BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        wrapWithModel(
                                                          model: _model
                                                              .dropdownAdvisorListModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              const ContainerLimpo01Widget(),
                                                        ),
                                                        Expanded(
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .containerLimpoModel,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                const ContainerLimpoWidget(
                                                              tituloContainer:
                                                                  'Advisor  Resumo',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (_model.produtoTipo == true)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.85,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.8,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          wrapWithModel(
                                                            model: _model
                                                                .dropdownProdutoModel,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            updateOnChange:
                                                                true,
                                                            child:
                                                                const DropdownProdutoWidget(),
                                                          ),
                                                        ]
                                                            .divide(const SizedBox(
                                                                width: 16.0))
                                                            .around(const SizedBox(
                                                                width: 16.0)),
                                                      ),
                                                    ),
                                                  ),
                                                if (_model.produtoCampanha ==
                                                    true)
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.85,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.8,
                                                    decoration: const BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .dropdownconvidadosListModel2,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                const DropdownconvidadosListWidget(
                                                              adicionar: true,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .dropdownusersListModel2,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                const DropdownusersListWidget(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (_model.tabbarproduto ==
                                                    true)
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.85,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.8,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              _model.activetab =
                                                                  _model
                                                                      .tabBarProdutoCurrentIndex;
                                                              _model.activetabNome =
                                                                  '';
                                                            });
                                                          },
                                                          child: Column(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const Alignment(
                                                                        0.0, 0),
                                                                child: TabBar(
                                                                  isScrollable:
                                                                      true,
                                                                  labelColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .asparagus,
                                                                  unselectedLabelColor:
                                                                      const Color(
                                                                          0xFF00000F),
                                                                  labelPadding:
                                                                      const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        fontSize:
                                                                            18.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                      ),
                                                                  unselectedLabelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                      ),
                                                                  indicatorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .asparagus,
                                                                  indicatorWeight:
                                                                      2.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  tabs: const [
                                                                    Tab(
                                                                      text:
                                                                          'BÁSICO',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'RISCO',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'LIQUIDEZ',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'LEGAL/FISCAL',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'BAIXO',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'BAIXO/MÉDIO',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'MÉDIO/ALTO',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'ALTO',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'MUITO ALTO',
                                                                    ),
                                                                  ],
                                                                  controller: _model
                                                                      .tabBarProdutoController,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    TabBarView(
                                                                  controller: _model
                                                                      .tabBarProdutoController,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.6,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel17,
                                                                                updateCallback: () => setState(() {}),
                                                                                updateOnChange: true,
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'OBJETIVOS',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'Objetivo_Investimento',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.objetivoInvestimento,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.6,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel18,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'PROTEÇÃO CAPITAL',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'Nivel_Protecao_Capital',
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.nivelProtecaoCapital,
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.6,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel19,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'RISCO ASSOCIADO',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'Risco_Associado',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.riscoAssociado,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.6,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel20,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'RATING',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'Rating',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.rating,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel21,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'LIQUIDEZ',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'Liquidez',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.liquidez,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel22,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'HORIZONTE',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'Horizonte_Investimento',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.horizonteInvestimento,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.3,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel23,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'VOLATILIDADE',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'Volatilidade',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.volatilidade,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel24,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'IMPOSTOS  & TAXAS',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'Impostos_Taxas',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.impostosTaxas,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel25,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'REGULAMENTAÇÃO',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'Regulamentação',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.regulamentacao,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.3,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel26,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'BENEFÍCIOS FISCAIS',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'Beneficios_Fiscais',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.beneficiosFiscais,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel27,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'CONSÓRCIO',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'Consorcio',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.consorcio,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel28,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'TÍTULOS CAPITALIZAÇÃO',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'Titulos_Capitalizacao',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.titulosCapitalizacao,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.3,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel29,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'POUPANÇA /CONTAS EXTRAS',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'ContaEmergencia_Poupanca',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.contaEmergenciaPoupanca,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel30,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'RENDA FIXA',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'Renda_Fixa',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.rendaFixa,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel31,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'PREVIDÊNCIA PRIVADA',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'Previdencia_Privada',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.previdenciaPrivada,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.35,
                                                                              height: MediaQuery.sizeOf(context).height * 0.32,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    offset: const Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: wrapWithModel(
                                                                                model: _model.listViewSearchModel32,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: ListViewSearchWidget(
                                                                                  titulolistview: 'FUNDOS DE PENSÃO',
                                                                                  colecao: 'opcoes_escolha',
                                                                                  campoNome: 'escolha',
                                                                                  listaNome: 'Fundo_Pensao',
                                                                                  docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                  listaCampoItem: containerOpcoesEscolhaRecord?.escolha.fundoPensao,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel33,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'CÂMBIO',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'Cambio',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.cambio,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel34,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'INVEST. ALTERNATIVO',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'Investimentos_Alternativos',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.investimentosAlternativos,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel35,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'CROWDFUNDING',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'Crowndfunding_Investimento',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.crowdfundingInvestimento,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel36,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'FUNDOS DE INVESTIMENTO',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'Fundos_Investimento',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.fundosInvestimento,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel37,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'RENDA VARIÁVEL',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'Renda_Variavel',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.rendaVariavel,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel38,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'PRIVATE EQUITY',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'PrivateEquity',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.privateEquity,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel39,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'VENTURE CAPITAL',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'venture_capital',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.ventureCapital,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.6,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel40,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'DERIVATIVOS',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'Derivativos',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.derivativos,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                height: MediaQuery.sizeOf(context).height * 0.6,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      offset: const Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: wrapWithModel(
                                                                                  model: _model.listViewSearchModel41,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ListViewSearchWidget(
                                                                                    titulolistview: 'CRIPTOMOEDAS',
                                                                                    colecao: 'opcoes_escolha',
                                                                                    campoNome: 'escolha',
                                                                                    listaNome: 'Criptomoeda',
                                                                                    docReference: containerOpcoesEscolhaRecord?.reference,
                                                                                    listaCampoItem: containerOpcoesEscolhaRecord?.escolha.criptomoeda,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
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
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
