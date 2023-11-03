import 'package:flutter/material.dart';
import 'package:foodivoire/splash.dart';
import 'package:foodivoire/src/feature/language/presentation/provider/lang_provider.dart';
import 'package:provider/provider.dart';

void main() {
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LanguageProvider>(
      create: (context) => LanguageProvider()..initPrefs(),)
      ],
      child: const MaterialApp(
        
        home: SplashView()
      ),
    );
  }
}
