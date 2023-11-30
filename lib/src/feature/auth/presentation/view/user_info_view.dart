import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/auth/presentation/view/preference.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:provider/provider.dart';

import '../../../language/presentation/provider/lang_provider.dart';
import '../widgets/common_button.dart';

class UserInfoView extends StatefulWidget {
  const UserInfoView({Key? key}) : super(key: key);

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
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
                  ? 'Please enter your details'
                  : 'Veuillez saisir vos informations',
              style: Theme.of(context).textTheme.bodyMedium,
            )),
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
                  child: TextField(
                    controller: firstNameController,
                    decoration: const InputDecoration(
                        isDense: true, border: InputBorder.none),
                    keyboardType: TextInputType.name,
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
                  child: TextField(
                    controller: lastNameController,
                    decoration: const InputDecoration(
                        isDense: true, border: InputBorder.none),
                    keyboardType: TextInputType.name,
                    // Add necessary logic to capture the entered phone number
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CommonButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PreferencePage(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                  ),
                ));
              },
              child: Text(languageProvider.isEnglish ? 'Next' : 'Suivant'),
            )
          ],
        ),
      ),
    );
  }
}
