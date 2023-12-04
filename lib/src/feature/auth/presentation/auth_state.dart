import 'package:flutter/material.dart';
import 'package:foodivoire/presentation/home.dart';
import 'package:foodivoire/src/feature/language/presentation/views/select_lang.dart';
import 'package:foodivoire/src/shared/interceptor/http.client.interceptor.dart';

class AuthStateView extends StatefulWidget {
  const AuthStateView({super.key});

  @override
  State<AuthStateView> createState() => _AuthStateViewState();
}

class _AuthStateViewState extends State<AuthStateView> {
  String? isUser;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    try {
      var user = await storage.read(key: 'refreshToken');
      setState(() {
        isUser = user;
      });
    } catch (e) {
      print('Error reading user token: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isUser == null) {
      return const SelectLanguage();
    } else if (isUser!.isNotEmpty) {
      return const HomeView();
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
