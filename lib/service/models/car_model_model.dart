class CarModelModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  CarModelModel({this.count, this.next, this.previous, this.results});

  CarModelModel.fromJson(Map<String, dynamic> json) {
    count = json['count'] ?? 0;
    next = json['next'] ?? '';
    previous = json['previous'] ?? '';
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  int? brand;
  String? title;
  String? image;

  Results({
    this.id,
    this.brand,
    this.title,
    this.image,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    brand = json['brand'] ?? 0;
    title = json['title'] ?? '';
    image = json['image'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (brand != null) {
      data['brand'] = brand;
    }
    data['title'] = title;
    data['image'] = image;

    return data;
  }
}

// class Brand {
//   int? id;
//   String? title;
//   String? slug;
//   String? image;
//
//   Brand({this.id, this.title, this.slug, this.image});
//
//   Brand.fromJson(Map<String, dynamic> json) {
//     id = json['id'] ?? 0;
//     title = json['title'] ?? '';
//     slug = json['slug'] ?? '';
//     image = json['image'] ?? '';
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['slug'] = slug;
//     data['image'] = image;
//     return data;
//   }
// }
