import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  late SharedPreferences _prefs;
  static const String _isEnglishKey = 'isEnglish';

  bool _isEnglish = false;
  bool get isEnglish => _isEnglish;

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _isEnglish = _prefs.getBool(_isEnglishKey) ?? true;
    notifyListeners();
  }

  Future<void> toggleLanguage() async {
    _isEnglish = !_isEnglish;
    await _prefs.setBool(_isEnglishKey, _isEnglish);
    notifyListeners();
  }
}
