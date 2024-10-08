import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/chantiers/nouveau_message/nouveau_message_widget.dart';
import '/pages/main/navigation/navigation_widget.dart';
import 'dart:math';
import 'une_tache_widget.dart' show UneTacheWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class UneTacheModel extends FlutterFlowModel<UneTacheWidget> {
  ///  Local state fields for this page.

  bool see = true;

  ///  State fields for stateful widgets in this page.

  // Model for Navigation component.
  late NavigationModel navigationModel1;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
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
