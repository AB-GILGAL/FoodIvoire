import 'dart:developer';

import 'package:foodivoire/main.dart';
import 'package:foodivoire/src/feature/Vendors/domain/entities/vendor_model.dart';
import 'package:foodivoire/src/shared/constant/base_url.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/interceptor/http.client.interceptor.dart';



HttpClientWithInterceptor client = getIt<HttpClientWithInterceptor>();

class RestaurantApiService {
//fetch available Restaurants
  Future<List<RestaurantDataModel>> fetchRestaurants(
   
  ) async {
    try {
      const url =
          "$baseUrl/restaurants";
      final response = await client.get(url);
      if (response.statusCode != 200) {
        log(response.body);
        throw CustomException('${response.reasonPhrase}');
      }
      return restaurantModelFromJson(response.body).data.data;
    } catch (e) {
      rethrow;
    }
  }
}