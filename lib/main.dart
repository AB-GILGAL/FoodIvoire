import 'package:flutter/material.dart';
import 'package:foodivoire/src/config/theme/light_theme.dart';
import 'package:foodivoire/src/feature/Vendors/presentation/dependency/vendor_dependency.dart';
import 'package:foodivoire/src/feature/Vendors/presentation/provider/vendor_provider.dart';
import 'package:foodivoire/src/feature/auth/presentation/dependency/auth_dependencies.dart';
import 'package:foodivoire/src/feature/auth/presentation/provider/auth_provider.dart';
import 'package:foodivoire/src/feature/menu/presentation/dependency/menu_dependency.dart';
import 'package:foodivoire/src/shared/interceptor/http.client.interceptor.dart';
import 'package:foodivoire/src/splash.dart';
import 'package:foodivoire/src/feature/language/presentation/provider/lang_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  setStorageLocator();
  injectAuthDependencies();
  injectRestaurantDependencies();
  injectMenuDependencies();
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
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => authProvider,
        ),
        ChangeNotifierProvider<RestaurantProvider>(
          create: (context) => restaurantProvider,
        )
      ],
      child:
          MaterialApp(theme: LightTheme.themeData(), home: const SplashView()),
    );
  }
}
