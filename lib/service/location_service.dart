import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationService {
  final String key = 'AIzaSyAF84Hza8ksm_SlPMvji9lHnKrSy1RV1_0';
  //map api
  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=AIzaSyAF84Hza8ksm_SlPMvji9lHnKrSy1RV1_0';
    //https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inpttype=textquery&key=$key=AIzaSyAF84Hza8ksm_SlPMvji9lHnKrSy1RV1_0
    //AIzaSyDv70Rhg7eVEAPNNuIzHtJ1O-ijS6adlR0

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var placeId = json['candidates'][0]['place_id'] as String;

    //print(placeId);
    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=AIzaSyAF84Hza8ksm_SlPMvji9lHnKrSy1RV1_0';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;

    print(results);
    return results;
  }

  Future<Map<String, dynamic>> getDirections(String origin, String destination) async {
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=AIzaSyAF84Hza8ksm_SlPMvji9lHnKrSy1RV1_0';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);

    var results = {
      'bounds_ne': json['routes'][0]['bounds']['northeast'],
      'bounds_sw': json['routes'][0]['bounds']['southwest'],
      'start_location': json['routes'][0]['legs'][0]['start_location'],
      'end_location': json['routes'][0]['legs'][0]['end_location'],
      'polyline': json['routes'][0]['overview_polyline']['points'],
      'polyline_decoded':PolylinePoints()
      .decodePolyline(json['routes'][0]['overview_polyline']['points']),
    };
    print(results);

    //print(json);

    return results;
  }
}
