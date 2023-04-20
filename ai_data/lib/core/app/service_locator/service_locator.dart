import 'package:ai_data/core/app/constants/endpoints.dart';
import 'package:ai_data/core/app/http_service/http_service.dart';
import 'package:ai_data/core/app/storage/share_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../storage/local_storage.dart';

final locator = GetIt.instance;
const useMocks = false;
Future<void> serviceLocatorSetUp({required String package}) async {
  await _registerCore(package);
  _registerRepository();
  _registerBloc();
}

//Core
Future<void> _registerCore(String package) async {
  locator.registerSingletonAsync<SharedPreferences>(
    SharedPreferences.getInstance,
  );

  locator.registerLazySingleton<LocalStorageService>(
    () => SharedPreferencesService(
      preferences: locator<SharedPreferences>(),
    ),
  );

  locator.registerLazySingleton<HttpService>(
    () => HttpService(
      getBaseUrl: () => Endpoints.baseUrl,
    )..initInteceptors(),
  );
}

//Repositories
void _registerRepository() {}

//BLoC
void _registerBloc() {}
