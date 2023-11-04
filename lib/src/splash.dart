import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/language/presentation/views/select_lang.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:foodivoire/src/shared/utils/images.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Adjust the duration as needed
    );

    _animation = Tween<double>(
      begin: 0.1, // Start with a smaller size
      end: 1.0, // Actual size
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();

    Timer(const Duration(milliseconds: 4000), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const SelectLanguage();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Container(
            width: 200, // Adjust width and height as needed
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(CustomImages.lgo),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
