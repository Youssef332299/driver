import 'dart:convert';

import 'package:driver/core/constants/constants.dart';
import 'package:http/http.dart' as http;

class PlaceDataModel {
  List<AddressComponent> addressComponents;
  String adrAddress;
  String formattedAddress;
  Geometry geometry;
  String icon;
  String iconBackgroundColor;
  String iconMaskBaseUri;
  String name;
  List<Photo> photos;
  String placeId;
  String reference;
  List<String> types;
  String url;
  int utcOffset;
  String vicinity;

  PlaceDataModel({
    required this.addressComponents,
    required this.adrAddress,
    required this.formattedAddress,
    required this.geometry,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconMaskBaseUri,
    required this.name,
    required this.photos,
    required this.placeId,
    required this.reference,
    required this.types,
    required this.url,
    required this.utcOffset,
    required this.vicinity,
  });

  factory PlaceDataModel.fromJson(Map<String, dynamic> json) {
    return PlaceDataModel(
      addressComponents: (json['address_components'] as List?)
          ?.map((e) => AddressComponent.fromJson(e))
          .toList() ??
          [],
      adrAddress: json['adr_address'] ?? '',
      formattedAddress: json['formatted_address'] ?? '',
      geometry: Geometry.fromJson(json['geometry']),
      icon: json['icon'] ?? '',
      iconBackgroundColor: json['icon_background_color'] ?? '',
      iconMaskBaseUri: json['icon_mask_base_uri'] ?? '',
      name: json['name'] ?? '',
      photos: (json['photos'] as List?)
          ?.map((e) => Photo.fromJson(e))
          .toList() ??
          [],
      placeId: json['place_id'] ?? '',
      reference: json['reference'] ?? '',
      types: (json['types'] as List?)?.map((e) => e.toString()).toList() ?? [],
      url: json['url'] ?? '',
      utcOffset: json['utc_offset'] ?? 0,
      vicinity: json['vicinity'] ?? '',
    );
  }
}

class AddressComponent {
  String longName;
  String shortName;
  List<String> types;

  AddressComponent({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  factory AddressComponent.fromJson(Map<String, dynamic> json) {
    return AddressComponent(
      longName: json['long_name'] ?? '',
      shortName: json['short_name'] ?? '',
      types: (json['types'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }
}

class Geometry {
  LocationPlaceModel location;
  Viewport viewport;

  Geometry({
    required this.location,
    required this.viewport,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      location: LocationPlaceModel.fromJson(json['location']),
      viewport: Viewport.fromJson(json['viewport']),
    );
  }
}

class LocationPlaceModel {
  double lat;
  double lng;

  LocationPlaceModel({
    required this.lat,
    required this.lng,
  });

  factory LocationPlaceModel.fromJson(Map<String, dynamic> json) {
    return LocationPlaceModel(
      lat: (json['lat'] ?? 0).toDouble(),
      lng: (json['lng'] ?? 0).toDouble(),
    );
  }
}

class Viewport {
  LocationPlaceModel northeast;
  LocationPlaceModel southwest;

  Viewport({
    required this.northeast,
    required this.southwest,
  });

  factory Viewport.fromJson(Map<String, dynamic> json) {
    return Viewport(
      northeast: LocationPlaceModel.fromJson(json['northeast']),
      southwest: LocationPlaceModel.fromJson(json['southwest']),
    );
  }
}

class Photo {
  int height;
  List<String> htmlAttributions;
  String photoReference;
  int width;

  Photo({
    required this.height,
    required this.htmlAttributions,
    required this.photoReference,
    required this.width,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      height: json['height'] ?? 0,
      htmlAttributions: (json['html_attributions'] as List?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      photoReference: json['photo_reference'] ?? '',
      width: json['width'] ?? 0,
    );
  }
}

Future<PlaceDataModel> getPlaceData({required String placeId}) async {
  const String baseUrl = 'https://maps.googleapis.com/maps/api/place/details/json';
  final response = await http.get(Uri.parse('$baseUrl?key=$kAppKey&place_id=$placeId'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);

    if (data['result'] != null) {
      return PlaceDataModel.fromJson(data['result']);
    } else {
      throw Exception('Place data is null');
    }
  } else {
    throw Exception('Failed to load place details');
  }
}
