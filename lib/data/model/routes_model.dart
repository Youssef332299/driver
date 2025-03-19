class RoutesModel {
  List<Routes>? routes;

  RoutesModel({this.routes});

  RoutesModel.fromJson(Map<String, dynamic> json) {
    if (json['routes'] != null) {
      routes = <Routes>[];
      json['routes'].forEach((v) {
        routes!.add(Routes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (routes != null) {
      data['routes'] = routes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Routes {
  int? distanceMeters;
  String? duration;
  Polylines? polyline;

  Routes({this.distanceMeters, this.duration, this.polyline});

  Routes.fromJson(Map<String, dynamic> json) {
    distanceMeters = json['distanceMeters'];
    duration = json['duration'];
    polyline = json['polyline'] != null
        ? Polylines.fromJson(json['polyline'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['distanceMeters'] = distanceMeters;
    data['duration'] = duration;
    if (polyline != null) {
      data['polyline'] = polyline!.toJson();
    }
    return data;
  }
}

class Polylines {
  String? encodedPolyline;

  Polylines({this.encodedPolyline});

  Polylines.fromJson(Map<String, dynamic> json) {
    encodedPolyline = json['encodedPolyline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['encodedPolyline'] = encodedPolyline;
    return data;
  }
}