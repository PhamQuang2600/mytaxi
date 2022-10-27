import 'package:flutter/material.dart';
import 'package:mytaxi/src/resources/home_page.dart';
import 'package:mytaxi/src/resources/login_page.dart';

class MyTaxi extends StatelessWidget {
  const MyTaxi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
