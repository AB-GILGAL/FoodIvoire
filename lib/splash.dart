import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/language/presentation/views/select_lang.dart';
import 'package:foodivoire/src/shared/utils/colors.dart';
import 'package:foodivoire/src/shared/utils/images.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double _imageSize = 50.0; // Initial image size
  final double _finalImageSize = 500.0; // Final image size

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const SelectLanguage();
      },));
    });

    // Start the image size animation
    _startImageSizeAnimation();
  }

  // Function to start the image size animation
  void _startImageSizeAnimation() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _imageSize = _finalImageSize;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeOut,
          width: _imageSize,
          height: _imageSize,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(CustomeImages.lgo),
            ),
          ),
        ),
      ),
    );
  }
}
