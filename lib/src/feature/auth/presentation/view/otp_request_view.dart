import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:foodivoire/src/feature/auth/presentation/otp_validation.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:provider/provider.dart';

import '../../../language/presentation/provider/lang_provider.dart';

class OTPRequestView extends StatelessWidget {
  const OTPRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        foregroundColor: black,
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
                child: Text(languageProvider.isEnglish
                    ? 'Enter your phone number'
                    : 'Saisissez votre numéro de telephone')),
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  CountryCodePicker(
                    onChanged: print, // Handle country code selection
                    initialSelection: 'GH', // Initial country code
                    favorite: ['+1', 'US'], // Favorite country codes
                    showFlagMain: false,
                    showCountryOnly: false,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  ),
                  VerticalDivider(
                    color: green,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          isDense: true, border: InputBorder.none),
                      keyboardType: TextInputType.phone,
                      // Add necessary logic to capture the entered phone number
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OTPValidationView(),
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
              child:  Text(languageProvider.isEnglish?'Next':'Suivant'),
            ),
          ],
        ),
      ),
    );
  }
}
