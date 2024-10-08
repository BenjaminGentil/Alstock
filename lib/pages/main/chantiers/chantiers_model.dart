import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/chantiers/ajouter_chantier/ajouter_chantier_widget.dart';
import '/pages/main/navigation/navigation_widget.dart';
import 'dart:math';
import 'chantiers_widget.dart' show ChantiersWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChantiersModel extends FlutterFlowModel<ChantiersWidget> {
  ///  Local state fields for this page.

  bool see = true;

  ///  State fields for stateful widgets in this page.

  // Model for Navigation component.
  late NavigationModel navigationModel1;
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
    navigationModel2.dispose();
  }
}
