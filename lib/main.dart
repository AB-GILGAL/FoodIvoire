import 'package:flutter/material.dart';
import 'package:foodivoire/src/config/theme/light_theme.dart';
import 'package:foodivoire/src/shared/interceptor/http.client.interceptor.dart';
import 'package:foodivoire/src/splash.dart';
import 'package:foodivoire/src/feature/language/presentation/provider/lang_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  // setStorageLocator();
  runApp(const MainApp());
}
final getIt = GetIt.instance;
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LanguageProvider>(
          create: (context) => LanguageProvider()..initPrefs(),
        )
      ],
      child:
          MaterialApp(theme: LightTheme.themeData(), home: const SplashView()),
    );
  }
}
