import 'dart:convert';

import 'package:avto_hamyon/const.dart';
import 'package:avto_hamyon/service/models/car_brand_model.dart';
import 'package:avto_hamyon/service/models/car_model_model.dart';
import 'package:avto_hamyon/service/models/oil_model.dart';
import 'package:avto_hamyon/service/repository/car/base_car_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CarRepository extends BaseCarRepository {
  final Dio _httpClient = Dio();

  @override
  Future<CarBrandModel> getCarBrands() async {
    final response = await _httpClient.get(base_url + url_brands);
    if (response.statusCode == 200) {
      var responseBrands =
          CarBrandModel.fromJson(json.decode(response.toString()));
      print('BRANDS IS => ${responseBrands.count}\n');

      return responseBrands;
    } else {
      throw Exception('ERROR IS' + response.data.toString());
    }
  }

  @override
  Future<CarModelModel> getCarModels(int id) async {
    final response = await _httpClient.get(base_url + url_models);
    if (response.statusCode == 200) {
      var responseModels =
          CarModelModel.fromJson(json.decode(response.toString()));
      if (kDebugMode) {
        print('MODELS IS => ${responseModels.count}\n');
      }
      return responseModels;
    } else {
      throw Exception('ERROR IS' + response.data.toString());
    }
  }

  @override
  Future<OilModel> getOilModels() async {
    final response = await _httpClient.get(base_url + url_oil);
    if (response.statusCode == 200) {
      var responseOil = OilModel.fromJson(json.decode(response.toString()));
      print('OILS IS => ${responseOil.count}\n');
      return responseOil;
    } else {
      throw Exception('ERROR IS' + response.data.toString());
    }
  }
}
