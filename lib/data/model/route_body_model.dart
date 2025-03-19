import 'dart:convert';

RouteBodyModel routeBodyModelFromJson(String str) => RouteBodyModel.fromJson(json.decode(str));

String routeBodyModelToJson(RouteBodyModel data) => json.encode(data.toJson());

class RouteBodyModel {
  Origin origin;
  Origin destination;
  String travelMode;
  String routingPreference;
  bool computeAlternativeRoutes;
  RouteModifiers routeModifiers;
  String languageCode;
  String units;

  RouteBodyModel({
    required this.origin,
    required this.destination,
    required this.travelMode,
    required this.routingPreference,
    required this.computeAlternativeRoutes,
    required this.routeModifiers,
    required this.languageCode,
    required this.units,
  });

  factory RouteBodyModel.fromJson(Map<String, dynamic> json) => RouteBodyModel(
    origin: Origin.fromJson(json["origin"]),
    destination: Origin.fromJson(json["destination"]),
    travelMode: json["travelMode"],
    routingPreference: json["routingPreference"],
    computeAlternativeRoutes: json["computeAlternativeRoutes"],
    routeModifiers: RouteModifiers.fromJson(json["routeModifiers"]),
    languageCode: json["languageCode"],
    units: json["units"],
  );

  Map<String, dynamic> toJson() => {
    "origin": origin.toJson(),
    "destination": destination.toJson(),
    "travelMode": travelMode,
    "routingPreference": routingPreference,
    "computeAlternativeRoutes": computeAlternativeRoutes,
    "routeModifiers": routeModifiers.toJson(),
    "languageCode": languageCode,
    "units": units,
  };
}

class Origin {
  LocationModel location;

  Origin({
    required this.location,
  });

  factory Origin.fromJson(Map<String, dynamic> json) => Origin(
    location: LocationModel.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
  };
}

class LocationModel {
  LatLongModel latLng;

  LocationModel({
    required this.latLng,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    latLng: LatLongModel.fromJson(json["latLng"]),
  );

  Map<String, dynamic> toJson() => {
    "latLng": latLng.toJson(),
  };
}

class LatLongModel {
  double latitude;
  double longitude;

  LatLongModel({
    required this.latitude,
    required this.longitude,
  });

  factory LatLongModel.fromJson(Map<String, dynamic> json) => LatLongModel(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class RouteModifiers {
  bool avoidTolls;
  bool avoidHighways;
  bool avoidFerries;

  RouteModifiers({
    required this.avoidTolls,
    required this.avoidHighways,
    required this.avoidFerries,
  });

  factory RouteModifiers.fromJson(Map<String, dynamic> json) => RouteModifiers(
    avoidTolls: json["avoidTolls"],
    avoidHighways: json["avoidHighways"],
    avoidFerries: json["avoidFerries"],
  );

  Map<String, dynamic> toJson() => {
    "avoidTolls": avoidTolls,
    "avoidHighways": avoidHighways,
    "avoidFerries": avoidFerries,
  };
}
