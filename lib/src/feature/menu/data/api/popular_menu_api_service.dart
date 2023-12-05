import 'dart:developer';

import 'package:foodivoire/main.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';
import 'package:foodivoire/src/shared/constant/base_url.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/interceptor/http.client.interceptor.dart';



HttpClientWithInterceptor client = getIt<HttpClientWithInterceptor>();

class PopularMenuApiService {

  //fetch available Popular Menus
  Future<List<MenuDataModel>> fetchPopularMenus(
   
  ) async {
    try {
      const url =
          "$baseUrl/menu/popular";
      final response = await client.get(url);
        log(response.body);

      if (response.statusCode != 200) {
        log(response.body);
        throw CustomException('${response.reasonPhrase}');
      }
      return menuModelFromJson(response.body).data?.data??[];
    } catch (e) {
      rethrow;
    }
  }
}