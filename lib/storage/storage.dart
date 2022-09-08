import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final storageProvider = Provider((ref) => Storage());

class Storage {
  String KEY = 'key';

  Future<bool> savePageValue(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(KEY, value);
  }

  Future<bool> getPageValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(KEY) ?? false;
  }
}
