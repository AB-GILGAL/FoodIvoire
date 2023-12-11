import 'dart:convert';
import 'dart:developer';

import 'package:foodivoire/src/feature/menu/data/api/api_service.dart';
import 'package:foodivoire/src/feature/order/domain/utilities/order_model.dart';
import 'package:foodivoire/src/shared/constant/base_url.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';

Future<void> placeOrder(OrderModel order) async {
  print('object');
  const url = "$baseUrl/orders";
  try {
    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json', // Set the content type
      },
      body: json.encode(order),
    );
    
    // Log the response body
    log(response.body);
    
    if (response.statusCode != 200) {
      log(response.body);
      throw CustomException('Failed to place order');
    }
      log('done');

  } catch (e) {
    print(e);
  }
}
