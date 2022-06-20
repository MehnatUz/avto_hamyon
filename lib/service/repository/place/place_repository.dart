/*
*
* */
import 'package:avto_hamyon/const.dart';
import 'package:avto_hamyon/service/models/place_category_model.dart';
import 'package:avto_hamyon/service/models/place_model.dart';
import 'package:avto_hamyon/service/repository/place/base_place_repository.dart';
import 'package:dio/dio.dart';

class PlaceRepository extends BasePlaceRepository {
  final Dio _httpClient = Dio();

  @override
  Future<PlaceCategory> getPlaceCategories() async {
    final response = await _httpClient.get(base_url + url_categories);
    if (response.statusCode == 200) {
      var responsePlaceCategory = placeCategoryFromJson(response.toString());
      print('PLACE CATEGORIES IS => ${responsePlaceCategory.count}\n');
      return responsePlaceCategory;
    } else {
      throw Exception('ERROR IS' + response.data.toString());
    }
  }

  @override
  Future<PlaceModel> getPlaces() async {
    final response = await _httpClient.get(base_url + url_places);
    if (response.statusCode == 200) {
      var responsePlace = placeModelFromJson(response.toString());
      print('PLACES IS => ${responsePlace.count}\n');
      return responsePlace;
    } else {
      throw Exception('ERROR IS' + response.data.toString());
    }
  }
}
