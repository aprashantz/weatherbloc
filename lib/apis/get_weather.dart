import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'Weather.dart';
import 'trash.dart';

class Fetch {
  static Future<Weather?> getWeather({String place = "auto:ip"}) async {
    final String key = trash();
    print(place);
    //final String query = "auto:ip";
    final String usedAPI = kIsWeb
        ? "//api.weatherapi.com/v1/current.json?key=$key&q=$place"
        : "http://api.weatherapi.com/v1/current.json?key=$key&q=$place";
    try {
      final response = await http.get(Uri.parse(usedAPI), headers: {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      });
      if (response.statusCode == 200) {
        var decodedResponse = Weather.fromJson(json.decode(response.body));
        return decodedResponse;
      }
      return null;
    } catch (e) {}
  }
}
