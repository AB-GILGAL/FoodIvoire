import 'dart:developer';

import 'package:foodivoire/main.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/popular_menu_model.dart';
import 'package:foodivoire/src/shared/constant/base_url.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/interceptor/http.client.interceptor.dart';



HttpClientWithInterceptor client = getIt<HttpClientWithInterceptor>();

class PopularMenuApiService {

  //fetch available Popular Menus
  Future<List<PopularMenuDataModel>> fetchPopularMenus(
   
  ) async {
    try {
      const url =
          "$baseUrl/menu/popular";
      final response = await client.get(url);
      if (response.statusCode != 200) {
        log(response.body);
        throw CustomException('${response.reasonPhrase}');
      }
      return popularMenuModelFromJson(response.body).data.data;
    } catch (e) {
      rethrow;
    }
  }
}