import 'package:flutter/material.dart';
import 'package:foodivoire/presentation/welcome.dart';
import 'package:foodivoire/src/feature/language/presentation/provider/lang_provider.dart';
import 'package:foodivoire/src/shared/utils/colors.dart';
import 'package:foodivoire/src/shared/utils/images.dart';
import 'package:provider/provider.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(CustomeImages.log),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                languageProvider.isEnglish
                    ? "Choose your language"
                    : "Choisissez -votre langue",
                style: TextStyle(fontSize: 20.6),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  color: orange,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: DropdownButton<String>(
                    iconEnabledColor: white,
                    style: const TextStyle(
                      color: white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    dropdownColor: black.withOpacity(0.8),
                    value: languageProvider.isEnglish ? 'English' : 'Français',
                    items: [
                      'Français',
                      'English',
                    ].map((String language) {
                      return DropdownMenuItem(
                        value: language,
                        child: Text(language),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue == 'English') {
                        languageProvider.toggleLanguage(); // Toggle language
                      } else {
                        languageProvider.toggleLanguage(); // Toggle language
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const WelcomeView();
                        },
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(green),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Continue"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
