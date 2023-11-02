import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/auth/presentation/view/otp_request_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const OTPRequestView(),
    );
  }
}
