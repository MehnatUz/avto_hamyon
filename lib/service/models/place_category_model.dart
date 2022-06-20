// To parse this JSON data, do
//
//     final placeCategory = placeCategoryFromJson(jsonString);

import 'dart:convert';

PlaceCategory placeCategoryFromJson(String str) =>
    PlaceCategory.fromJson(json.decode(str));

String placeCategoryToJson(PlaceCategory data) => json.encode(data.toJson());

class PlaceCategory {
  PlaceCategory({
    this.count = 0,
    this.next = '',
    this.previous = '',
    this.results = const [],
  });

  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  factory PlaceCategory.fromJson(Map<String, dynamic> json) => PlaceCategory(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.title,
    this.image,
  });

  int? id;
  String? title;
  String? image;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
      };
}
