import 'package:flutter/material.dart';
import 'package:foodivoire/presentation/welcome.dart';
import 'package:foodivoire/src/shared/utils/colors.dart';
import 'package:foodivoire/src/shared/utils/images.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  String selectLanguage = "Français";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .15,
                child: Image(
                    fit: BoxFit.cover, image: AssetImage(CustomeImages.log)),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              const Text(
                "Choisissez -votre langue",
                style: TextStyle(fontSize: 20.6),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Container(
                height: 40,
                width: MediaQuery.sizeOf(context).width* 0.6,
                decoration: BoxDecoration(
                  color: orange,
                  borderRadius: BorderRadius.circular(5)
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
                    value: selectLanguage,
                      items: const [
                        DropdownMenuItem(
                          value: "Français",
                          child: Text("Français"),
                        ),
                        DropdownMenuItem(
                          value: "English",
                          child: Text("English"),
                        ),
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          selectLanguage = newValue!;
                        });
                      }),
                ),
              ),
             
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const WelcomeView();
                      },
                    ));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(green),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
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
