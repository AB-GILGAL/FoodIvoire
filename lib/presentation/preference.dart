import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodivoire/presentation/home.dart';
import 'package:provider/provider.dart';

import '../src/feature/language/presentation/provider/lang_provider.dart';
import '../src/shared/utils/colors.dart';

class PreferencePage extends StatelessWidget {
  const PreferencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        foregroundColor: black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Text(
                languageProvider.isEnglish
                    ? 'Select your preferences and allegories'
                    : 'Sélectionné vos préfences et allegires',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              _buildDescription(
                  "💖${languageProvider.isEnglish ? 'Preferences' : 'Préferences'}"),
              _buildStaggeredGrid(9,'Allergy'), // Preference Builder
              _buildDescription(
                  "🚫${languageProvider.isEnglish ? 'Allergies' : 'Allégires'}"),
              _buildStaggeredGrid(9,'Preference'), // Allergies Builder
              SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              .1,
                                        ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(green),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () {Navigator.of(context).push((MaterialPageRoute(builder: (context) => HomeView(),)));},
                    child: Text(languageProvider.isEnglish ? 'Next' : 'Suivant'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescription(String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildStaggeredGrid(int itemCount,String label) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      // ),
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        // Build your grid items here
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // color: orange,
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Center(
              child: Text('$label ${index+1}'), // Example: Text widget as child
            ),
          ),
        );
      },
    );
  }
}