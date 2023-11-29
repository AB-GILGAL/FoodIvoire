import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:foodivoire/src/feature/auth/domain/usecase/verify_otp.dart';
import 'package:foodivoire/src/feature/auth/domain/utilities/allergies_model.dart';
import 'package:foodivoire/src/feature/auth/domain/utilities/user_model.dart'
    as user;
import 'package:foodivoire/src/shared/constant/base_url.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/interceptor/http.client.interceptor.dart';
import 'package:http/http.dart' as http;

class AuthApiService {
  Future requestOTP(String telephone) async {
    const url = '$baseUrl/auth/send-otp';
    try {
      print(telephone);
      final response = await Dio().post(url, data: {
        "username": telephone,
      });
      print(response.data);
      if (response.statusCode != 200) {
        throw CustomException('Failed to request otp');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> loginCustomer(String telephone, String otp) async {
    const url = '$baseUrl/auth/login';
    try {
      log("username: $telephone");
      log("otp: $otp");
      final response = await client.post(
        url,
        body: {
          "username": telephone,
          "otp": otp,
        },
      );
      log(response.body.toString());
      if (response.statusCode != 200) {
        log(response.reasonPhrase.toString());
        throw CustomException(' OTP verification failed. Try again');
      }
      bool isUser = json.decode(response.body)['data']['isCustomer'];
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
      print(e);
      rethrow;
    }
  }

  Future createCustomer(user.User user) async {
    const url = '$baseUrl/customers';
    try {
      final response = await client.post(url, body: user.toJson());
      if (response.statusCode != 200) {
        var errorMessage = json.decode(response.body)['errors'];
        log(errorMessage);
        throw CustomException(errorMessage);
      }
      final refreshToken = json.decode(response.body)['data']['refreshToken'];
      storage.write(key: 'refreshToken', value: refreshToken);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
