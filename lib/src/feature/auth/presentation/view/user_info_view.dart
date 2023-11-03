import 'package:flutter/material.dart';
import 'package:foodivoire/presentation/preference.dart';
import 'package:foodivoire/src/feature/auth/presentation/otp_validation.dart';
import 'package:foodivoire/src/shared/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../../language/presentation/provider/lang_provider.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
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
                child: Text(languageProvider.isEnglish
                    ? 'Please enter your details'
                    : 'Veuillez saisir vos informations')),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(languageProvider.isEnglish ? 'Name' : 'Nom'),
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                        isDense: true, border: InputBorder.none),
                    keyboardType: TextInputType.name,
                    // Add necessary logic to capture the entered phone number
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(languageProvider.isEnglish ? 'Surname' : 'Prénom'),
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                        isDense: true, border: InputBorder.none),
                    keyboardType: TextInputType.name,
                    // Add necessary logic to capture the entered phone number
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  PreferencePage(),
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
          ],
        ),
      ),
    );
  }
}
