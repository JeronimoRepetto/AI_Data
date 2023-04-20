abstract class LocalStorageService {
  bool isFirstInit();
  String? getToken();
  void setToken(String token);
  void removeToken();
  void setLocale(String locale);
  String getLocale();
  String? getTheme();
  void setTheme(String mode);
}
