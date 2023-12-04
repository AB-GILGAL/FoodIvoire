import 'dart:convert';
import 'dart:developer';

import 'package:foodivoire/src/shared/constant/base_url.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/interceptor/http.client.interceptor.dart';

class CommentApiService {
 

  Future<void> customerComment (String comment, int restaurantId) async {
    const url = '$baseUrl/customers/comment/restaurant';
    try {
      final response = await client.post(
        url,
        body: {
          "comment": comment,
          "restaurantId": '$restaurantId',
        },
      );
      log(response.body.toString());
      if (response.statusCode != 200) {
        var errorMessage = json.decode(response.body)['errors'];

        throw CustomException(errorMessage['restaurantId'] + errorMessage['comment'] ??
            'Comment failed. Try again');
      }
    
    } catch (e) {
      rethrow;
    }
  }

 
}
