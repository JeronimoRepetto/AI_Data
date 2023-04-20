import 'package:ai_data/core/app/service_locator/service_locator.dart';
import 'package:ai_data/core/app/storage/local_storage.dart';

class ConfigApi {
  ConfigApi();
  final _gptApiKey = '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';
  Future<Map<String, String>> headers() async {
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $_gptApiKey",
    };
  }
}
