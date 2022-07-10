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
    this.next,
    this.previous,
    this.results = const [],
  });

  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
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
    required this.id,
    required this.owner,
    required this.title,
    required this.slug,
    required this.category,
    required this.addressTitle,
    required this.mondayFrom,
    required this.toMonday,
    required this.saturdayFrom,
    required this.toSaturday,
    required this.sundayFrom,
    required this.toSunday,
    required this.paymentTypes,
    required this.serviceTypes,
    required this.region,
    required this.cityOrDistrict,
    required this.lat,
    required this.long,
    required this.email,
    required this.phoneNumber,
    required this.description,
    required this.comments,
    required this.averageReview,
    required this.viewCount,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
  });

  int id;
  String owner;
  String title;
  String slug;
  Category category;
  String addressTitle;
  String mondayFrom;
  String toMonday;
  String saturdayFrom;
  String toSaturday;
  dynamic sundayFrom;
  dynamic toSunday;
  List<Region> paymentTypes;
  List<dynamic> serviceTypes;
  Region region;
  CityOrDistrict cityOrDistrict;
  String lat;
  String long;
  dynamic email;
  String phoneNumber;
  String description;
  List<dynamic> comments;
  int averageReview;
  int viewCount;
  String image1;
  dynamic image2;
  dynamic image3;
  dynamic image4;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] ?? -1,
        owner: json["owner"] ?? '',
        title: json["title"] ?? '',
        slug: json["slug"] ?? '',
        category: Category.fromJson(json["category"]),
        addressTitle: json["address_title"] ?? '',
        mondayFrom: json["monday_from"] ?? '',
        toMonday: json["to_monday"] ?? '',
        saturdayFrom: json["saturday_from"] ?? '',
        toSaturday: json["to_saturday"] ?? '',
        sundayFrom: json["sunday_from"] ?? '',
        toSunday: json["to_sunday"],
        paymentTypes: List<Region>.from(
            json["payment_types"].map((x) => Region.fromJson(x))),
        serviceTypes: List<dynamic>.from(json["service_types"].map((x) => x)),
        region: Region.fromJson(json["region"]),
        cityOrDistrict: CityOrDistrict.fromJson(json["city_or_district"]),
        lat: json["lat"] ?? '',
        long: json["long"] ?? '',
        email: json["email"] ?? '',
        phoneNumber: json["phone_number"] ?? '',
        description: json["description"] ?? '',
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        averageReview: json["average_review"],
        viewCount: json["view_count"] ?? 0,
        image1: json["image_1"] ??
            'https://images.unsplash.com/photo-1629281066736-ff3a1e6b36d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        image2: json["image_2"] ??
            'https://images.unsplash.com/photo-1629281066736-ff3a1e6b36d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        image3: json["image_3"] ??
            'https://images.unsplash.com/photo-1629281066736-ff3a1e6b36d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        image4: json["image_4"] ??
            'https://images.unsplash.com/photo-1629281066736-ff3a1e6b36d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "title": title,
        "slug": slug,
        "category": category.toJson(),
        "address_title": addressTitle,
        "monday_from": mondayFrom,
        "to_monday": toMonday,
        "saturday_from": saturdayFrom ?? 'ma\'lumot mavjud emas',
        "to_saturday": toSaturday ?? 'ma\'lumot mavjud emas',
        "sunday_from": sundayFrom,
        "to_sunday": toSunday,
        "payment_types":
            List<dynamic>.from(paymentTypes.map((x) => x.toJson())),
        "service_types": List<dynamic>.from(serviceTypes.map((x) => x)),
        "region": region.toJson(),
        "city_or_district": cityOrDistrict.toJson(),
        "lat": lat,
        "long": long,
        "email": email,
        "phone_number": phoneNumber,
        "description": description,
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "average_review": averageReview,
        "view_count": viewCount,
        "image_1": image1,
        "image_2": image2,
        "image_3": image3,
        "image_4": image4,
      };
}

class Category {
  Category({
    this.id = -1,
    this.title = '',
    this.slug = '',
    this.image,
  });

  int id;
  String title;
  String slug;
  dynamic image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "image": image,
      };
}

class CityOrDistrict {
  CityOrDistrict({
    required this.region,
    this.id = -1,
    this.title = '',
  });

  Region region;
  int id;
  String title;

  factory CityOrDistrict.fromJson(Map<String, dynamic> json) => CityOrDistrict(
        region: Region.fromJson(json["region"]),
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "region": region.toJson(),
        "id": id,
        "title": title,
      };
}

class Region {
  Region({
    this.id = -1,
    this.title = '',
  });

  int id;
  String title;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json["id"],
        title: json["title"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
