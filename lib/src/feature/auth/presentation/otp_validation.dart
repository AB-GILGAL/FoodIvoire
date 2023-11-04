import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/auth/presentation/view/user_info_view.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:provider/provider.dart';

import '../../language/presentation/provider/lang_provider.dart';

class OTPValidationView extends StatelessWidget {
  const OTPValidationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Food Ivoire',
                style: TextStyle(
                  fontSize: 28,
                  color: green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
                child: Text(
              languageProvider.isEnglish
                  ? 'Please enter the code sent by SMS to\nphone number'
                  : 'Veuillez saisir le code envoyé par SMS au\ntelephone',
              textAlign: TextAlign.center,
            )),
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration:
                    InputDecoration(isDense: true, border: InputBorder.none),
                keyboardType: TextInputType.phone,
                // Add necessary logic to capture the entered phone number
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UserInfoView(),
                ));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(green),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              child: Text(languageProvider.isEnglish ? 'Next' : 'Suivant'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(grey),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
              child: Text(languageProvider.isEnglish
                  ? 'Send another code'
                  : 'Envoyer un autre code'),
            ),
          ],
        ),
      ),
    );
  }
}
