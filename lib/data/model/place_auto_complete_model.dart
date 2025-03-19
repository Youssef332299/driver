import 'dart:convert';
import 'package:driver/core/constants/constants.dart';
import 'package:http/http.dart' as http;

class PlaceAutoCompleteModel {
  String description;
  List<MatchedSubstring> matchedSubstrings;
  String placeId;
  String reference;
  StructuredFormatting structuredFormatting;
  List<Term> terms;
  List<String> types;

  PlaceAutoCompleteModel({
    required this.description,
    required this.matchedSubstrings,
    required this.placeId,
    required this.reference,
    required this.structuredFormatting,
    required this.terms,
    required this.types,
  });

  factory PlaceAutoCompleteModel.fromJson(Map<String, dynamic> json) {
    return PlaceAutoCompleteModel(
      description: json['description'] ?? '',
      matchedSubstrings: (json['matched_substrings'] as List?)
              ?.map((item) => MatchedSubstring.fromJson(item))
              .toList() ??
          [],
      placeId: json['place_id'] ?? '',
      reference: json['reference'] ?? '',
      structuredFormatting: json['structured_formatting'] != null
          ? StructuredFormatting.fromJson(json['structured_formatting'])
          : StructuredFormatting(
              mainText: '', mainTextMatchedSubstrings: [], secondaryText: ''),
      terms: (json['terms'] as List?)
              ?.map((item) => Term.fromJson(item))
              .toList() ??
          [],
      types: List<String>.from(json['types'] ?? []),
    );
  }
}

class MatchedSubstring {
  int length;
  int offset;

  MatchedSubstring({
    required this.length,
    required this.offset,
  });

  factory MatchedSubstring.fromJson(Map<String, dynamic> json) {
    return MatchedSubstring(
      length: json['length'],
      offset: json['offset'],
    );
  }
}

class StructuredFormatting {
  String mainText;
  List<MatchedSubstring> mainTextMatchedSubstrings;
  String secondaryText;
  List<MatchedSubstring>? secondaryTextMatchedSubstrings;

  StructuredFormatting({
    required this.mainText,
    required this.mainTextMatchedSubstrings,
    required this.secondaryText,
    this.secondaryTextMatchedSubstrings,
  });

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) {
    return StructuredFormatting(
      mainText: json['main_text'] ?? '',
      mainTextMatchedSubstrings: (json['main_text_matched_substrings'] as List?)
              ?.map((item) => MatchedSubstring.fromJson(item))
              .toList() ??
          [],
      secondaryText: json['secondary_text'] ?? '',
      secondaryTextMatchedSubstrings:
          (json['secondary_text_matched_substrings'] as List?)
              ?.map((item) => MatchedSubstring.fromJson(item))
              .toList(),
    );
  }
}

class Term {
  int offset;
  String value;

  Term({
    required this.offset,
    required this.value,
  });

  factory Term.fromJson(Map<String, dynamic> json) {
    return Term(
      offset: json['offset'] ?? 0,
      value: json['value'] ?? '',
    );
  }
}

Future<List<PlaceAutoCompleteModel>> getPredictions({required String input}) async {
  const String baseUrl = 'https://maps.googleapis.com/maps/api/place';

  var response = await http.get(Uri.parse('$baseUrl/autocomplete/json?key=$kAppKey&input=$input'));
  if (response.statusCode == 200) {
    List<PlaceAutoCompleteModel> place = [];
    var data = jsonDecode(response.body)['predictions'];
    for (var item in data) {
      place.add(PlaceAutoCompleteModel.fromJson(item));
    }
    return place;
  } else {
    throw Exception();
  }
}