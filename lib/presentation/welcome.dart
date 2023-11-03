import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodivoire/presentation/home.dart';
import 'package:foodivoire/shared/utils/colors.dart';
import 'package:foodivoire/shared/utils/images.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage(CustomeImages.foodivuah),
          fit: BoxFit.cover
        ),),
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
              height: MediaQuery.sizeOf(context).height*0.02,
            ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Akwaba sur ",
                      style: TextStyle(
                        fontSize: 20.6,
                        color: white,
                        fontWeight: FontWeight.w600,
                        backgroundColor: Colors.black54,
                      ),
                    ),
                    Text(
                      "FOOD IVOIRE",
                      style: TextStyle(
                        fontSize: 20.6,
                        color: orange,
                        fontWeight: FontWeight.w600,
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ],
                ),
                SizedBox(
              height: MediaQuery.sizeOf(context).height*0.04,
            ),
                 Container(
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10)
                  ),
                   child: const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Text(
                          "Bienvenue sur notre application dédiée à la promotion de la gastronomie ivoirienne pendant la CAN ! Découvrez les meilleurs plats locaux, trouvez des restaurants à proximité et partagez vos avis. ",
                          style: TextStyle(
                            fontSize: 12,
                            color: white,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            letterSpacing: 2
                          ),
                        ),
                   ),
                 ),
                  SizedBox(
              height: MediaQuery.sizeOf(context).height*0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeView();
                  },));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(green),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Text("c’est parti!"),
                ),
              ),
            ),
          

        
      
      
    
        ],
      ),
          )
        )
      )
    );
  }
}
