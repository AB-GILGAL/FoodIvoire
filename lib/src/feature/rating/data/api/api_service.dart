import 'dart:convert';
import 'dart:developer';

import 'package:foodivoire/src/shared/constant/base_url.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/interceptor/http.client.interceptor.dart';

class RatingApiService {
 

  Future<void> customerRating (int scale, int restaurantId) async {
    const url = '$baseUrl/customers/rate/restaurant';
    try {
      final response = await client.put(
        url,
        body: {
          "scale": '$scale',
          "restaurantId": '$restaurantId',
        },
      );
      log(response.body.toString());
      if (response.statusCode != 200) {
        var errorMessage = json.decode(response.body)['errors'];

        throw CustomException(errorMessage['restaurantId'] + errorMessage['scale'] ??
            'Comment failed. Try again');
      }
    
    } catch (e) {
      rethrow;
    }
  }

 
}
