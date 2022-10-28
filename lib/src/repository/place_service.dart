import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/place_item_res.dart';

class PlaceService {
  static Future<List<PlaceItemRes>> serchPlace(String keyword) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/textsearch/json?key=AIzaSyBlSuSfRqIbWuz22gEuvo8z5j4cRWOxhe8&query=${Uri.encodeQueryComponent(keyword)}";
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      return PlaceItemRes.fromJson(json.decode(res.body));
    } else {
      return [];
    }
  }
}
