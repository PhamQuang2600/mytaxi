import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mytaxi/src/widget/home_menu.dart';
import 'package:mytaxi/src/widget/rider_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Stack(children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(20.989932, 105.8386086), zoom: 11),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Text(
                      "Taxi App",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: TextButton(
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      child: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    ),
                    actions: [
                      Icon(
                        Icons.notifications_outlined,
                        color: Colors.black,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: RiderPicker(),
                  )
                ],
              ),
            ),
          ])),
      drawer: Drawer(child: HomeMenu()),
    );
  }
}
