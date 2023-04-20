import 'package:ai_data/core/app/constants/endpoints.dart';
import 'package:ai_data/core/app/http_service/http_service.dart';
import 'package:ai_data/core/app/storage/local_storage.dart';
import 'package:ai_data/core/app/storage/share_preferences.dart';
import 'package:ai_data/features/home/data/repository/gpt_api.dart';
import 'package:ai_data/features/home/data/repository/gpt_repository.dart';
import 'package:ai_data/features/home/screen/bloc/data_to_search/data_to_search_bloc.dart';
import 'package:ai_data/features/home/screen/bloc/languages_bloc/languages_bloc.dart';
import 'package:ai_data/features/home/screen/bloc/location_section/location_section_bloc.dart';
import 'package:ai_data/features/home/screen/bloc/rank_dropdown/dropdown_bloc.dart';
import 'package:ai_data/features/home/screen/bloc/search_button/search_button_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
void _registerRepository() {
  locator.registerLazySingleton<GptRepository>(
    () => GptApi(
      httpService: locator<HttpService>(),
    ),
  );
}

//BLoC
void _registerBloc() {
  locator.registerLazySingleton<LocationSectionBloc>(
    () => LocationSectionBloc(),
  );

  locator.registerLazySingleton<LanguagesBloc>(
    () => LanguagesBloc(),
  );

  locator.registerLazySingleton<DropdownBloc>(
    () => DropdownBloc(),
  );

  locator.registerLazySingleton<DataToSearchBloc>(
    () => DataToSearchBloc(
      dropdownBloc: locator<DropdownBloc>(),
    ),
  );

  locator.registerLazySingleton<SearchButtonBloc>(
    () => SearchButtonBloc(
      gptRepository: locator<GptRepository>(),
    ),
  );
}
