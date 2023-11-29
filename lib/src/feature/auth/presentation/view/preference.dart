// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/auth/domain/utilities/user_model.dart'
    as user;
import 'package:foodivoire/src/feature/auth/presentation/provider/auth_provider.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';
import 'package:provider/provider.dart';

import 'package:foodivoire/presentation/home.dart';
import 'package:foodivoire/src/feature/auth/data/api/api_service.dart';
import 'package:foodivoire/src/feature/auth/domain/utilities/allergies_model.dart';

import '../../../../shared/constant/colors.dart';
import '../../../language/presentation/provider/lang_provider.dart';

class PreferencePage extends StatefulWidget {
  const PreferencePage({
    Key? key,
    // required this.firstName,
    // required this.lastName,
  }) : super(key: key);
  // final String firstName;
  // final String lastName;

  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  Future<List<Allergy>>? allergies;
  Future<List<Allergy>>? preferences;
  fetchAlergies() {
    final allg = AuthApiService.allergies();
    setState(() {
      allergies = allg;
    });
  }

  fetchPreferences() {
    final prfc = AuthApiService.preferences();
    setState(()  {
      preferences = prfc;
    });
  }

  @override
  void initState() {
    fetchAlergies();
    fetchPreferences();
    super.initState();
  }

  List<String> allergiesToDB = ['salt'];
  List<String> preferencesToDB = ['Beans'];

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
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              _buildDescription(
                  "💖 ${languageProvider.isEnglish ? 'Preferences' : 'Préferences'}"),
              _buildStaggeredGrid(
                  9, 'Preference', preferences!), // Preference Builder
              _buildDescription(
                  "🚫 ${languageProvider.isEnglish ? 'Allergies' : 'Allégires'}"),
              _buildStaggeredGrid(
                  9, 'Allergy', allergies!), // Allergies Builder
              SizedBox(
                height: MediaQuery.sizeOf(context).width * 0.05,
              ),
              SizedBox(
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
                  onPressed: () async {
                    // final customer = user.User(
                    //   lastName: widget.lastName,
                    //   firstName: widget.firstName,
                    //   allergies: allergiesToDB,
                    //   preferences: preferencesToDB,
                    // );
                    // await context
                    //     .read<AuthProvider>()
                    //     .createCustomer(customer)
                    //     .then((value) {
                    //   value.fold(
                    //       (l) => print(l),
                    //       (r) => 
                    Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomeView()));
                    // });
                  },
                  child: Text(languageProvider.isEnglish ? 'Next' : 'Suivant'),
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

  Widget _buildStaggeredGrid(int itemCount, String label, Future future) {
    return FutureBuilder<dynamic>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the Future is still running, show a loading indicator.
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // If there's an error, show an error message.
          return Text('Error: ${snapshot.error}');
        } else {
          // If the Future is complete and no errors occurred, display the data.
          var data = snapshot.data;
          log(snapshot.data!.toString());
          List<Widget> chips = List.generate(
            data.length,
            (index) {
              var dat = data[index];
              return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chip(
                padding: const EdgeInsets.all(10),
                backgroundColor: grey,
                side: const BorderSide(color: grey),
                label: Text(
                 dat.name
                ),
              ),
            );}  );

          return Wrap(
            children: chips,
          );
        }
      },
    );
  }
}
