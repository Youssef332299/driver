import 'dart:convert';
import 'package:driver/core/constants/constants.dart';
import 'package:driver/data/model/route_body_model.dart';
import 'package:driver/data/model/routes_model.dart';
import 'package:http/http.dart' as http;

class RouteServices {

  Future<RoutesModel> fetchRouteData({
    required Origin origin,
    required Origin destination,
    required String travelMode,
  }) async {
    String baseUrl = 'https://routes.googleapis.com/directions/v2:computeRoutes';
    Uri url = Uri.parse(baseUrl);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': kAppKey,
      'X-Goog-FieldMask': 'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline',
    };
    Map<String, dynamic> body = {
      "origin": origin.toJson(),
      "destination": destination.toJson(),
      "computeAlternativeRoutes": false,
      "routeModifiers": RouteModifiers(
        avoidFerries: false,
        avoidHighways: false,
        avoidTolls: false,
      ).toJson(),
      "routingPreference": "TRAFFIC_AWARE",
      "travelMode": travelMode,
      "languageCode": "en-US",
      "units": "IMPERIAL",
    };

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);

        if (decodedJson == null || decodedJson.isEmpty) {
          throw Exception("Received empty response from API");
        }

        return RoutesModel.fromJson(decodedJson);
      } else {
        throw Exception("Failed to fetch route data: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("❌ Error in fetchRouteData: $e");
      rethrow;
    }
  }

}
/*
  "origin":{
    "location":{
      "latLng":{
        "latitude": 37.419734,
        "longitude": -122.0827784
      }
    }
  },
  "destination":{
    "location":{
      "latLng":{
        "latitude": 37.417670,
        "longitude": -122.079595
      }
    }
  },
  "travelMode": "DRIVE",
  "routingPreference": "TRAFFIC_AWARE",
  "computeAlternativeRoutes": false,
  "routeModifiers": {
    "avoidTolls": false,
    "avoidHighways": false,
    "avoidFerries": false
  },
  "languageCode": "en-US",
  "units": "IMPERIAL"
  */