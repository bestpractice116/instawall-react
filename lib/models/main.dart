import 'dart:convert';
import 'photo.dart';

Main resultFromMap(String str) => Main.fromMap(json.decode(str));

String resultToMap(Main data) => json.encode(data.toMap());

class Main {
  List<Photo> results;

  Main({
    required this.results,
  });

  factory Main.fromMap(Map<String, dynamic> json) => Main(
        results: List<Photo>.from(json["results"].map((x) => Photo.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}
