// To parse this JSON data, do
//
//     final placeModel = placeModelFromJson(jsonString);

import 'dart:convert';

PlaceModel placeModelFromJson(String str) =>
    PlaceModel.fromJson(json.decode(str));

String placeModelToJson(PlaceModel data) => json.encode(data.toJson());

class PlaceModel {
  PlaceModel({
    this.count = 0,
    this.next = '',
    this.previous,
    this.results = const [],
  });

  int count;
  String next;
  dynamic previous;
  List<Result> results;

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        count: json["count"] ?? '',
        next: json["next"] ?? '',
        previous: json["previous"] ?? '',
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
    required this.id,
    required this.title,
    required this.slug,
    required this.category,
    required this.addressTitle,
    required this.description,
    required this.viewCount,
    required this.image1,
  });

  int id;
  String title;
  String slug;
  Category category;
  String addressTitle;
  String description;
  int viewCount;
  String image1;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        slug: json["slug"] ?? '',
        category: Category.fromJson(json["category"]),
        addressTitle: json["address_title"] ?? '',
        description: json["description"] ?? '',
        viewCount: json["view_count"] ?? 0,
        image1: json["image_1"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "category": category,
        "address_title": addressTitle,
        "description": description ?? '',
        "view_count": viewCount,
        "image_1": image1 ?? '',
      };
}

class Category {
  Category({
    required this.id,
    required this.title,
    required this.image,
  });

  int id;
  String title;
  String image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
      };
}
