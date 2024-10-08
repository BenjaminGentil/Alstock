import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBjQTvgO9FrmqklvB6sb-o1ZO-DG_9CHy8",
            authDomain: "alstockv2.firebaseapp.com",
            projectId: "alstockv2",
            storageBucket: "alstockv2.appspot.com",
            messagingSenderId: "538339246387",
            appId: "1:538339246387:web:9694cb4efdd465cf46be46",
            measurementId: "G-C2PH0PCZ6B"));
  } else {
    await Firebase.initializeApp();
  }
}
