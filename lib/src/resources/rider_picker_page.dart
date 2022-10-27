import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mytaxi/src/bloc/place_bloc.dart';
import 'package:mytaxi/src/model/place_item_res.dart';

class RidePickerPage extends StatefulWidget {
  const RidePickerPage({super.key});

  @override
  State<RidePickerPage> createState() => _RidePickerPageState();
}

class _RidePickerPageState extends State<RidePickerPage> {
  var _address;
  var placeBloc = new PlaceBloc();

  void dispose() {
    placeBloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _address = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: Container(
                height: 50,
                width: double.infinity,
                child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 60,
                        child: Center(child: Icon(Icons.location_on_sharp)),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        top: 40,
                        height: 60,
                        child: Center(
                            child: TextButton(
                          onPressed: () => _address.text = "",
                          child: Icon(Icons.close),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 50, left: 30),
                        child: TextField(
                          controller: _address,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (str) {
                            placeBloc.searchPlace(str);
                          },
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: StreamBuilder(
                stream: placeBloc.addressStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data == "start") {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<PlaceItemRes> places = snapshot.data;
                    return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(places.elementAt(index).name),
                            subtitle: Text(places.elementAt(index).address),
                            onTap: () {},
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                              height: 1,
                              color: Colors.white,
                            ),
                        itemCount: places.length);
                  } else {
                    return Container();
                  }
                }),
          ),
        ]),
      ),
    );
  }
}
