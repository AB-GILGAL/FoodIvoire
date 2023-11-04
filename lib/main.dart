import 'package:flutter/material.dart';
import 'package:foodivoire/src/config/theme/light_theme.dart';
import 'package:foodivoire/src/splash.dart';
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
      child:  MaterialApp(
        theme: LightTheme.themeData(),
        home:const SplashView()
      ),
    );
  }
}
