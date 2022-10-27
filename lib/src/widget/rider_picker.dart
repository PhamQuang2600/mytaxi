import 'package:flutter/material.dart';
import 'package:mytaxi/src/resources/rider_picker_page.dart';

class RiderPicker extends StatefulWidget {
  const RiderPicker({super.key});

  @override
  State<RiderPicker> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RiderPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(blurRadius: 5, color: Colors.black, offset: Offset(0, 5))
          ]),
      child: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RidePickerPage()));
              },
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 40,
                        child: Icon(Icons.location_pin),
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          width: 40,
                          height: 30,
                          child: Center(
                            child: Icon(Icons.close),
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 50),
                        child: Text(
                          "Phan Đình Giót",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      )
                    ]),
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 40,
                        child: Icon(Icons.near_me),
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          width: 40,
                          height: 30,
                          child: Center(
                            child: Icon(Icons.close),
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 50),
                        child: Text(
                          "Phan Đình Giót",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
