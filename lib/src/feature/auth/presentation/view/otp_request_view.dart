import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:foodivoire/src/feature/auth/presentation/otp_validation.dart';
import 'package:foodivoire/src/shared/utils/colors.dart';

class OTPRequestView extends StatelessWidget {
  const OTPRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const Center(child: Text('Enter your phone number')),
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
                          isDense: true,
                          hintText: 'Phone number',
                          border: InputBorder.none),
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
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
