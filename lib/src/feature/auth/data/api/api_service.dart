import 'package:foodivoire/src/shared/constant/base_url.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/interceptor/http.client.interceptor.dart';
import 'package:http/http.dart' as http;

class AuthApiService {
  Future requestOTP(String telephone) async {
    const url = '$baseUrl/auth/send-otp';
    try {
      print(telephone);
      final response = await http.post(Uri.parse(url), body: {
        "username": telephone,
      });
      print(response.reasonPhrase);
      if (response.statusCode != 200) {
        throw CustomException('Failed to request otp');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future verifyOTP(String otp) async {
    final url = '$baseUrl/auth/verify/$otp';
    try {
      final response = await client.post(url);
      if (response.statusCode != 200) {
        throw CustomException(' OTP verification failed. Try again');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
