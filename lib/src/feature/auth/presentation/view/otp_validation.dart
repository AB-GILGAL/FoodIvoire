import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodivoire/presentation/home.dart';
import 'package:foodivoire/src/feature/auth/presentation/view/user_info_view.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:provider/provider.dart';

import '../../../language/presentation/provider/lang_provider.dart';
import '../provider/auth_provider.dart';

class OTPValidationView extends StatefulWidget {
  const OTPValidationView({Key? key, required this.telephone})
      : super(key: key);
  final String telephone;

  @override
  State<OTPValidationView> createState() => _OTPValidationViewState();
}

class _OTPValidationViewState extends State<OTPValidationView> {
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Food Ivoire',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: green),
              ),
            ),
            const SizedBox(height: 20),
            Center(
                child: Text(
              languageProvider.isEnglish
                  ? 'Please enter the code sent by SMS to\nphone number'
                  : 'Veuillez saisir le code envoyé par SMS au\ntelephone',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
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
              child: TextField(
                controller: otpController,
                decoration: const InputDecoration(
                    isDense: true, border: InputBorder.none),
                keyboardType: TextInputType.phone,
                // Add necessary logic to capture the entered phone number
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await context
                    .read<AuthProvider>()
                    .loginCustomer(otpController.text, widget.telephone)
                    .then((value) {
                  value.fold((failure) {
                    log(failure.message);
                  }, (success) {
                    success
                        ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeView(),
                          ))
                        : Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const UserInfoView(),
                          ));
                  });
                });
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
              onPressed: () async {},
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
