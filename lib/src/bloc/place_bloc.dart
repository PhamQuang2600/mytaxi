import 'dart:async';

import 'package:mytaxi/src/repository/place_service.dart';

class PlaceBloc {
  StreamController _address = new StreamController();
  Stream get addressStream => _address.stream;

  void searchPlace(String keyword) {
    _address.sink.add("start");
    PlaceService.serchPlace(keyword)
        .then((rs) => _address.sink.add(rs))
        .catchError(() => _address.sink.add("stop"));
  }

  void dispose() {
    _address.close();
  }
}
