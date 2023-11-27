import 'package:http/http.dart' as http;

Future<void> getthem() async {
  try {
    final url =
        Uri.parse('https://foodivoireapi.drivnapp.net/api/auth/send-otp');
    final response = await http.post(url, body: {'username': '+2330591787845'});

    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
    }
  } catch (e) {
    print(e);
  }
}
