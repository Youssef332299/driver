// import 'dart:convert';
//
// class PlaceAutocompleteResponse {
//   final String? status;
//   final List<AutocompletePrediction>? predictions;
//
//   PlaceAutocompleteResponse(this.status, this.predictions);
//
//   factory PlaceAutocompleteResponse.fromJson(Map<String, dynamic> json) {
//     return PlaceAutocompleteResponse(
//       json['status'] as String?,
//       json['predictions'] != null
//           ? (json['predictions'] as List)
//           .map<AutocompletePrediction>(
//               (json) => AutocompletePrediction.fromJson(json))
//           .toList()
//           : null,
//     );
//   }
//
//   static PlaceAutocompleteResponse parseAutocompleteResult(String responseBody) {
//     final parsed = json.decode(responseBody).cast<String, dynamic>();
//
//     return PlaceAutocompleteResponse.fromJson(parsed);
//   }
// }
//
// class AutocompletePrediction {
//   final String? description;
//   final String? placeId;
//
//   AutocompletePrediction({this.description, this.placeId});
//
//   factory AutocompletePrediction.fromJson(Map<String, dynamic> json) {
//     return AutocompletePrediction(
//       description: json['description'] as String?,
//       placeId: json['place_id'] as String?,
//     );
//   }
// }
