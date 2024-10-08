import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/chantiers/ajouter_tache/ajouter_tache_widget.dart';
import '/pages/main/navigation/navigation_widget.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'un_chantier_model.dart';
export 'un_chantier_model.dart';

class UnChantierWidget extends StatefulWidget {
  const UnChantierWidget({
    super.key,
    required this.chantier,
  });

  final ChantierRecord? chantier;

  @override
  State<UnChantierWidget> createState() => _UnChantierWidgetState();
}

class _UnChantierWidgetState extends State<UnChantierWidget>
    with TickerProviderStateMixin {
  late UnChantierModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnChantierModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'navigationOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'navigationOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1330.0.ms,
            begin: Offset(51.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            print('FloatingActionButton pressed ...');
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          label: Builder(
            builder: (context) => Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showDialog(
                    barrierColor: Color(0x7E000000),
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: GestureDetector(
                          onTap: () => FocusScope.of(dialogContext).unfocus(),
                          child: AjouterTacheWidget(
                            chantier: widget!.chantier!.reference,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                      topLeft: Radius.circular(100.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 70.0,
                      ),
                    ],
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
          ),
        ),
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.navigationModel2,
            updateCallback: () => safeSetState(() {}),
            child: NavigationWidget(),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (_model.see &&
                        responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                        ))
                      wrapWithModel(
                        model: _model.navigationModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: NavigationWidget(),
                      )
                          .animateOnPageLoad(
                              animationsMap['navigationOnPageLoadAnimation']!)
                          .animateOnActionTrigger(
                            animationsMap[
                                'navigationOnActionTriggerAnimation']!,
                          ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 20.0, 10.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              scaffoldKey.currentState!
                                                  .openDrawer();
                                            },
                                            child: Icon(
                                              Icons.dehaze,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 45.0,
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                        ))
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.see = !_model.see;
                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.dehaze,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 45.0,
                                            ),
                                          ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  widget!.chantier?.titre,
                                                  'Titre',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  widget!.chantier?.adresse,
                                                  'Titre',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .warning,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 30.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 14.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(50.0),
                                            topRight: Radius.circular(50.0),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                20.0,
                                                                20.0,
                                                                10.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            FutureBuilder<int>(
                                                          future:
                                                              querySuiviDeChantierRecordCount(
                                                            parent:
                                                                currentUserDocument
                                                                    ?.entreprise,
                                                            queryBuilder:
                                                                (suiviDeChantierRecord) =>
                                                                    suiviDeChantierRecord
                                                                        .where(
                                                              'Chantier',
                                                              isEqualTo: widget!
                                                                  .chantier
                                                                  ?.reference,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            int columnCount =
                                                                snapshot.data!;

                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            FutureBuilder<int>(
                                                                              future: querySuiviDeChantierRecordCount(
                                                                                parent: currentUserDocument?.entreprise,
                                                                                queryBuilder: (suiviDeChantierRecord) => suiviDeChantierRecord
                                                                                    .where(
                                                                                      'Chantier',
                                                                                      isEqualTo: widget!.chantier?.reference,
                                                                                    )
                                                                                    .where(
                                                                                      'Statut',
                                                                                      isEqualTo: "Terminée",
                                                                                    ),
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
                                                                                int chartCount = snapshot.data!;

                                                                                return Container(
                                                                                  width: 895.0,
                                                                                  height: 230.0,
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      FlutterFlowPieChart(
                                                                                        data: FFPieChartData(
                                                                                          values: [
                                                                                            columnCount,
                                                                                            chartCount
                                                                                          ],
                                                                                          colors: [
                                                                                            FlutterFlowTheme.of(context).secondary,
                                                                                            Color(0xFF6F28CB)
                                                                                          ],
                                                                                          radius: [
                                                                                            100.0,
                                                                                            100.0
                                                                                          ],
                                                                                        ),
                                                                                        donutHoleRadius: 0.0,
                                                                                        donutHoleColor: Colors.transparent,
                                                                                        sectionLabelType: PieChartSectionLabelType.percent,
                                                                                        sectionLabelStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(1.0, 1.0),
                                                                                        child: FlutterFlowChartLegendWidget(
                                                                                          entries: [
                                                                                            LegendEntry(FlutterFlowTheme.of(context).secondary, 'Tâches totales'),
                                                                                            LegendEntry(Color(0xFF6F28CB), 'Tâches éffectuées'),
                                                                                          ],
                                                                                          width: 100.0,
                                                                                          height: 50.0,
                                                                                          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          textPadding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                          borderWidth: 1.0,
                                                                                          borderColor: Colors.black,
                                                                                          indicatorSize: 10.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      height: 827.0,
                                                      child: Column(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                Alignment(
                                                                    0.0, 0),
                                                            child: TabBar(
                                                              labelColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              unselectedLabelColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              unselectedLabelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              indicatorColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              tabs: [
                                                                Tab(
                                                                  text:
                                                                      'A faire',
                                                                ),
                                                                Tab(
                                                                  text:
                                                                      'En cours',
                                                                ),
                                                                Tab(
                                                                  text:
                                                                      'Terminée',
                                                                ),
                                                              ],
                                                              controller: _model
                                                                  .tabBarController,
                                                              onTap: (i) async {
                                                                [
                                                                  () async {},
                                                                  () async {},
                                                                  () async {}
                                                                ][i]();
                                                              },
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: TabBarView(
                                                              controller: _model
                                                                  .tabBarController,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              StreamBuilder<List<SuiviDeChantierRecord>>(
                                                                            stream:
                                                                                querySuiviDeChantierRecord(
                                                                              parent: currentUserDocument?.entreprise,
                                                                              queryBuilder: (suiviDeChantierRecord) => suiviDeChantierRecord
                                                                                  .where(
                                                                                    'Statut',
                                                                                    isEqualTo: 'A faire',
                                                                                  )
                                                                                  .where(
                                                                                    'Chantier',
                                                                                    isEqualTo: widget!.chantier?.reference,
                                                                                  ),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<SuiviDeChantierRecord> listViewSuiviDeChantierRecordList = snapshot.data!;

                                                                              return ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: listViewSuiviDeChantierRecordList.length,
                                                                                itemBuilder: (context, listViewIndex) {
                                                                                  final listViewSuiviDeChantierRecord = listViewSuiviDeChantierRecordList[listViewIndex];
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 10.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        context.pushNamed(
                                                                                          'UneTache',
                                                                                          queryParameters: {
                                                                                            'suividechantier': serializeParam(
                                                                                              listViewSuiviDeChantierRecord,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'suividechantier': listViewSuiviDeChantierRecord,
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Container(
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 0.0, 10.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      listViewSuiviDeChantierRecord.titre,
                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      'Description : ${listViewSuiviDeChantierRecord.description}',
                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      'A faire pour le : ${dateTimeFormat("dd/MM/yyyy", listViewSuiviDeChantierRecord.dateRendu)}',
                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            color: FlutterFlowTheme.of(context).warning,
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
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
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              StreamBuilder<List<SuiviDeChantierRecord>>(
                                                                            stream:
                                                                                querySuiviDeChantierRecord(
                                                                              parent: currentUserDocument?.entreprise,
                                                                              queryBuilder: (suiviDeChantierRecord) => suiviDeChantierRecord
                                                                                  .where(
                                                                                    'Statut',
                                                                                    isEqualTo: 'En cours',
                                                                                  )
                                                                                  .where(
                                                                                    'Chantier',
                                                                                    isEqualTo: widget!.chantier?.reference,
                                                                                  ),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<SuiviDeChantierRecord> listViewSuiviDeChantierRecordList = snapshot.data!;

                                                                              return ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: listViewSuiviDeChantierRecordList.length,
                                                                                itemBuilder: (context, listViewIndex) {
                                                                                  final listViewSuiviDeChantierRecord = listViewSuiviDeChantierRecordList[listViewIndex];
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 10.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        context.pushNamed(
                                                                                          'UneTache',
                                                                                          queryParameters: {
                                                                                            'suividechantier': serializeParam(
                                                                                              listViewSuiviDeChantierRecord,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'suividechantier': listViewSuiviDeChantierRecord,
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Container(
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 0.0, 10.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      listViewSuiviDeChantierRecord.titre,
                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      'Description : ${listViewSuiviDeChantierRecord.description}',
                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      'A faire pour le : ${dateTimeFormat("dd/MM/yyyy", listViewSuiviDeChantierRecord.dateRendu)}',
                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            color: FlutterFlowTheme.of(context).warning,
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
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
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              StreamBuilder<List<SuiviDeChantierRecord>>(
                                                                            stream:
                                                                                querySuiviDeChantierRecord(
                                                                              parent: currentUserDocument?.entreprise,
                                                                              queryBuilder: (suiviDeChantierRecord) => suiviDeChantierRecord
                                                                                  .where(
                                                                                    'Statut',
                                                                                    isEqualTo: 'Terminée',
                                                                                  )
                                                                                  .where(
                                                                                    'Chantier',
                                                                                    isEqualTo: widget!.chantier?.reference,
                                                                                  ),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<SuiviDeChantierRecord> listViewSuiviDeChantierRecordList = snapshot.data!;

                                                                              return ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: listViewSuiviDeChantierRecordList.length,
                                                                                itemBuilder: (context, listViewIndex) {
                                                                                  final listViewSuiviDeChantierRecord = listViewSuiviDeChantierRecordList[listViewIndex];
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 10.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        context.pushNamed(
                                                                                          'UneTache',
                                                                                          queryParameters: {
                                                                                            'suividechantier': serializeParam(
                                                                                              listViewSuiviDeChantierRecord,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'suividechantier': listViewSuiviDeChantierRecord,
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Container(
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 0.0, 10.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      listViewSuiviDeChantierRecord.titre,
                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      'Description : ${listViewSuiviDeChantierRecord.description}',
                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      'A faire pour le : ${dateTimeFormat("dd/MM/yyyy", listViewSuiviDeChantierRecord.dateRendu)}',
                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            color: FlutterFlowTheme.of(context).warning,
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
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
                                                                    ),
                                                                  ],
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
                                          ],
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
