import 'dart:async';
import 'dart:developer';

import 'package:ai_data/core/app/storage/local_storage.dart';
import 'package:ai_data/core/lang/l10n.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app/http_service/helper.dart';
import 'app/service_locator/service_locator.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
) async {
  await AppPathProvider.initPath();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  await serviceLocatorSetUp(package: packageInfo.packageName);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  await runZonedGuarded(
    () async => runApp(
      EasyLocalization(
        supportedLocales: L10n.all,
        path: 'lang',
        fallbackLocale: L10nExtension.getLocale(
          locator<LocalStorageService>().getLocale(),
        ),
        child: await builder(),
      ),
    ),
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
    },
  );

  FlutterError.onError = (details) {
    if (kDebugMode) {
      print(details);
    }
  };
}
