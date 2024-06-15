import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  @protected
  late final SharedPreferences _prefs;

  SharedPreferences get prefs => _prefs;

  Future<void> initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> fistLook() async {
    await _prefs.setBool('fistLook', true);
  }

  bool getFistLookValue() {
    return _prefs.getBool('fistLook') ?? true;
  }
}
