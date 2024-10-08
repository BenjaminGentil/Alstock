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
import 'un_chantier_widget.dart' show UnChantierWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UnChantierModel extends FlutterFlowModel<UnChantierWidget> {
  ///  Local state fields for this page.

  bool see = true;

  ///  State fields for stateful widgets in this page.

  // Model for Navigation component.
  late NavigationModel navigationModel1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for Navigation component.
  late NavigationModel navigationModel2;

  @override
  void initState(BuildContext context) {
    navigationModel1 = createModel(context, () => NavigationModel());
    navigationModel2 = createModel(context, () => NavigationModel());
  }

  @override
  void dispose() {
    navigationModel1.dispose();
    tabBarController?.dispose();
    navigationModel2.dispose();
  }
}
