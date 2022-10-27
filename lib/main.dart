import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mytaxi/src/app.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyD7sO92KOM2JVcqiAz_XQWdn7ZdevDuna0",
          appId: "1:422277174920:android:bd374d31fd38d2ccd9313d",
          messagingSenderId: "422277174920",
          projectId: "mytaxiapp-3a1dd",
          databaseURL:
              "https://mytaxiapp-3a1dd-default-rtdb.asia-southeast1.firebasedatabase.app"));
  runApp(MyTaxi());
}
