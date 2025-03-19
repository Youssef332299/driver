import 'dart:convert';

PolylineModel polylineModelFromJson(String str) => PolylineModel.fromJson(json.decode(str));
String polylineModelToJson(PolylineModel data) => json.encode(data.toJson());


class PolylineModel {
  List<Route> routes;

  PolylineModel({
    required this.routes,
  });

  factory PolylineModel.fromJson(Map<String, dynamic> json) => PolylineModel(
    routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
  };
}

class Route {
  int distanceMeters;
  String duration;
  PolylineData polyline;

  Route({
    required this.distanceMeters,
    required this.duration,
    required this.polyline,
  });

  factory Route.fromJson(Map<String, dynamic> json) => Route(
    distanceMeters: json["distanceMeters"],
    duration: json["duration"],
    polyline: PolylineData.fromJson(json["polyline"]),
  );

  Map<String, dynamic> toJson() => {
    "distanceMeters": distanceMeters,
    "duration": duration,
    "polyline": polyline.toJson(),
  };
}

class PolylineData {
  String encodedPolyline;

  PolylineData({
    required this.encodedPolyline,
  });

  factory PolylineData.fromJson(Map<String, dynamic> json) => PolylineData(
    encodedPolyline: json["encodedPolyline"],
  );

  Map<String, dynamic> toJson() => {
    "encodedPolyline": encodedPolyline,
  };
}
