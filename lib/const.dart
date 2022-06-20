import 'package:avto_hamyon/service/models/car_brand_model.dart';
import 'package:avto_hamyon/service/models/car_model_model.dart';
import 'package:avto_hamyon/service/models/place_category_model.dart';
import 'package:avto_hamyon/service/models/place_model.dart';

String version = 'v1';

String base_url = 'https://avtohamyon.uz/';
String url_brands = 'api/$version/car/brands/';
String url_models = 'api/$version/car/models/';
String url_oil = 'api/$version/car/oils/';
String url_categories = 'api/$version/main/categories';
String url_places = 'api/$version/main/places';
String url_register = 'api/$version/auth/register/';
String url_confirm = 'api/$version/auth/confirmation/';

PlaceModel places = PlaceModel();
PlaceCategory placesCategories = PlaceCategory();
CarBrandModel brands = CarBrandModel();
CarModelModel models = CarModelModel();
