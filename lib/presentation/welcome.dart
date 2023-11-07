import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/auth/presentation/view/otp_request_view.dart';
import 'package:foodivoire/src/shared/utils/colors.dart';
import 'package:foodivoire/src/shared/utils/images.dart';
import 'package:provider/provider.dart';

import '../src/feature/language/presentation/provider/lang_provider.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
        body: Container(
            height: MediaQuery.sizeOf(context).height * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(CustomeImages.foodivuah),
                  fit: BoxFit.cover),
            ),
            child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 3,
                  sigmaY: 3,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: lightGreen,
                        backgroundImage: AssetImage(CustomeImages.foood),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: languageProvider.isEnglish ? "Welcome to " : "Akwaba sur ",
        style: const TextStyle(
          fontSize: 20,
          color: white,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.black54,
        ),
      ),
      const TextSpan(
        text: "FOOD IVOIRE",
        style: TextStyle(
          fontSize: 20,
          color: orange,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.black54,
        ),
      ),
    ],
  ),
),

                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.04,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            languageProvider.isEnglish
                                ? "Welcome to our app dedicated to promoting Ivorian gastronomy during the CAN! Discover the best local dishes, find nearby restaurants and share your opinions."
                                : "Bienvenue sur notre application dédiée à la promotion de la gastronomie ivoirienne pendant la CAN ! Découvrez les meilleurs plats locaux, trouvez des restaurants à proximité et partagez vos avis. ",
                            style: const TextStyle(
                                fontSize: 15,
                                color: white,
                                height: 1.5,
                                letterSpacing: 2),
                                textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const OTPRequestView();
                              },
                            ));
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(green),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                            child: Text(languageProvider.isEnglish
                                ? 'Get started'
                                : "c’est parti!",
                                style: TextStyle(
                                  fontSize: 20
                                ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
