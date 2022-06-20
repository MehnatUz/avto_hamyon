import 'package:avto_hamyon/service/models/car_brand_model.dart';
import 'package:avto_hamyon/service/models/car_model_model.dart';
import 'package:avto_hamyon/service/models/oil_model.dart';

abstract class BaseCarRepository {
  Future<CarBrandModel> getCarBrands();

  Future<CarModelModel> getCarModels(int id);

  Future<OilModel> getOilModels();

}
