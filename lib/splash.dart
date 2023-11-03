import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodivoire/presentation/select_lang.dart';
import 'package:foodivoire/src/shared/utils/colors.dart';
import 'package:foodivoire/src/shared/utils/images.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

@override
  void initState() {
    Timer(Duration(milliseconds: 4000), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SelectLanguage();
      },));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(CustomeImages.lgo))
          ),
        ),
      ),
    );
  }
}