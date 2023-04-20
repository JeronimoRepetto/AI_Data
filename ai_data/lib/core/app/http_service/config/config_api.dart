import 'package:ai_data/core/app/service_locator/service_locator.dart';
import 'package:ai_data/core/app/storage/local_storage.dart';

class ConfigApi {
  ConfigApi();
  final _lang = locator<LocalStorageService>().getLocale();

  Future<Map<String, String>> headers() async {
    final token = locator<LocalStorageService>().getToken();
    return {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token',
      'Accept-Language': _lang,
    };
  }

  Future<Map<String, String>> headersWithoutToken() async {
    return {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept-Language': _lang,
    };
  }
}
