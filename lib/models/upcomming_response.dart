// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

import 'model.dart';

class Up {
  Up({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Dates dates;
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory Up.fromJson(String str) => Up.fromMap(json.decode(str));

  factory Up.fromMap(Map<String, dynamic> json) => Up(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class DatesUp {
  DatesUp({
    required this.maximum,
    required this.minimum,
  });

  DateTime maximum;
  DateTime minimum;

  factory DatesUp.fromJson(String str) => DatesUp.fromMap(json.decode(str));

  factory DatesUp.fromMap(Map<String, dynamic> json) => DatesUp(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );
}
