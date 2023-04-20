import 'package:ai_data/core/app/service_locator/service_locator.dart';
import 'package:ai_data/core/app/storage/local_storage.dart';
import 'package:ai_data/core/app/styles/app_themes.dart';
import 'package:ai_data/core/app/utils/life_cycle_manager.dart';
import 'package:ai_data/core/routing/app_routing.dart';
import 'package:ai_data/features/home/screen/bloc/languages_bloc/languages_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<LanguagesBloc>()
            ..setLanguage(
              locator<LocalStorageService>().getLocale().toUpperCase(),
            ),
        ),
      ],
      child: const LifeCycleManager(
        child: AppWithTheme(),
      ),
    );
  }
}

class AppWithTheme extends StatefulWidget {
  const AppWithTheme({Key? key}) : super(key: key);

  @override
  State<AppWithTheme> createState() => _AppWithThemeState();
}

class _AppWithThemeState extends State<AppWithTheme> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: _scaffoldKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child ?? Container(),
      ),
      theme: appThemeData,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      routerDelegate: goRouter.routerDelegate,
    );
  }
}
