import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodivoire/main.dart';
import 'package:foodivoire/src/feature/auth/domain/utilities/allergies_model.dart';
import 'package:foodivoire/src/feature/auth/domain/utilities/user_model.dart'
    as user;
import 'package:foodivoire/src/shared/constant/base_url.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/interceptor/http.client.interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          await getSession();
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

  Future getSession()async{
    const url = "$baseUrl/auth/session";
    try {
      final response = await client.get(url);
      if(response.statusCode != 200){
        throw CustomException('Failed to get session');
      }
      final userSession = json.decode(response.body)['data']['id'];
    await  storage.write(key: 'session', value: userSession); 
   log( 'Session: ${await storage.read(key: 'session')}');
          } catch (e) {
      log("$e");
    }

  }


  //fetch user data
 static Future fetchUserData(String id)async{
    final url = "$baseUrl/customers/$id";
    try {
      final response = await client.get(url);
      if(response.statusCode!=200){
        throw CustomException('Failed to get user data');
      }
      final user = json.decode(response.body);
      final userData = storage.write(key: 'userData', value: user);
    } catch (e) {
      log("$e");
    }

  }

 static Future logOut() async {
    try {
  await storage.deleteAll();
} on Exception catch (e) {
  log('Failed to log out');
}
  }
}
