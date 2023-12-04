import 'dart:convert';
import 'dart:developer';

import 'package:foodivoire/src/shared/constant/base_url.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/interceptor/http.client.interceptor.dart';

class LikesApiService {
  Future customerLikes(int menuId) async {
    final url = '$baseUrl/customers/like/menu/$menuId'; // Change const to final
    try {
      final response = await client.put(
        url,
      );
      log(response.body.toString());
      if (response.statusCode != 200) {
        var errorMessage = json.decode(response.body)['errors'];
        throw CustomException(errorMessage ?? 'Unable to like menu item. Try again');
      }
    } catch (e) {
      rethrow;
    }
  }
}
