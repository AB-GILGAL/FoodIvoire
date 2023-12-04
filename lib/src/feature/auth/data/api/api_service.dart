import 'dart:convert';
import 'dart:developer';

import 'package:foodivoire/src/feature/auth/domain/utilities/allergies_model.dart';
import 'package:foodivoire/src/feature/auth/domain/utilities/user_model.dart'
    as user;
import 'package:foodivoire/src/shared/constant/base_url.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/interceptor/http.client.interceptor.dart';

class AuthApiService {
  Future requestOTP(String telephone) async {
    const url = '$baseUrl/auth/send-otp';
    try {
      final response = await client.post(url, body: {
        "username": telephone,
      });
      if (response.statusCode != 200) {
        var errorMessage = json.decode(response.body)['errors']['username'];
        throw CustomException(errorMessage ?? 'Failed to request otp');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> loginCustomer(String telephone, String otp) async {
    const url = '$baseUrl/auth/login';
    try {
      final response = await client.post(
        url,
        body: {
          "username": telephone,
          "otp": otp,
        },
      );
      log(response.body.toString());
      if (response.statusCode != 200) {
        var errorMessage = json.decode(response.body)['errors'];

        throw CustomException(errorMessage['otp'] + errorMessage['username'] ??
            'OTP verification failed. Try again');
      }
      final refreshToken = json.decode(response.body)['data']['refreshToken'];
      storage.write(key: 'refreshToken', value: refreshToken);
      bool isUser = json.decode(response.body)['data']['accessToken'] != null
          ? true
          : json.decode(response.body)['data']['isCustomer'];
      return isUser;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Allergy>> allergies() async {
    const url = '$baseUrl/allergies';
    try {
      final response = await client.get(url);
      if (response.statusCode != 200) {
        throw CustomException('Failed to get list of allergies');
      }
      return allergiesModelFromJson(response.body).data.allergy;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Allergy>> preferences() async {
    const url = '$baseUrl/preferences';
    try {
      final response = await client.get(url);
      if (response.statusCode != 200) {
        throw CustomException('Failed to get list of preferences');
      }
      return allergiesModelFromJson(response.body).data.allergy;
    } catch (e) {
      rethrow;
    }
  }

  Future createCustomer(user.User user) async {
    const url = '$baseUrl/customers';
    try {
      final response = await client.post(url, body: user.toJson());
      if (response.statusCode != 200) {
        var errorMessage = json.decode(response.body)['errors'];
        throw CustomException(errorMessage ?? 'Account creation failed.');
      }
      final refreshToken = json.decode(response.body)['data']['refreshToken'];
      storage.write(key: 'refreshToken', value: refreshToken);
    } catch (e) {
      rethrow;
    }
  }
}
