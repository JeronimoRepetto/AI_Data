import 'dart:io';

import 'package:ai_data/core/app/storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends LocalStorageService {
  SharedPreferencesService({required this.preferences});
  static const themeModeKey = 'themeModeKey';
  static const firstInitKey = 'firstInit';
  static const tokenKey = 'tokenKey';
  static const localeKey = 'localeKey';
  static const appLanguage = 'app_laguage';

  final SharedPreferences preferences;

  @override
  void setTheme(String mode) {
    preferences.setString(themeModeKey, mode);
  }

  @override
  String? getTheme() {
    return preferences.getString(themeModeKey);
  }

  @override
  bool isFirstInit() {
    return preferences.getBool(firstInitKey) ?? true;
  }

  @override
  String? getToken() {
    final tokenRaw = _getFromDisk(tokenKey);
    return tokenRaw;
  }

  @override
  void setToken(String token) {
    _saveStringToDisk(tokenKey, token);
  }

  @override
  void removeToken() async {
    await preferences.remove(tokenKey);
  }

  String? _getFromDisk(String key) {
    final value = preferences.getString(key);
    return value;
  }

  Future<void> _saveStringToDisk(String key, String content) async {
    await preferences.setString(key, content);
  }

  @override
  String getLocale() {
    final localeRaw = _getFromDisk(localeKey);
    if (localeRaw == null) {
      if (Platform.localeName.length > 2) {
        String locale =
            Platform.localeName.substring(0, Platform.localeName.length - 3);
        setLocale(locale);
        return locale;
      }
      setLocale(Platform.localeName);
      return Platform.localeName;
    }
    return localeRaw;
  }

  @override
  void setLocale(String locale) {
    _saveStringToDisk(localeKey, locale);
  }
}
