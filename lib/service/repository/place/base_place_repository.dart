import 'package:avto_hamyon/service/models/place_category_model.dart';
import 'package:avto_hamyon/service/models/place_model.dart';

abstract class BasePlaceRepository {
  Future<PlaceCategory> getPlaceCategories();

  Future<PlaceModel> getPlaces();


}
