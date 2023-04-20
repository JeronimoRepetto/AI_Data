import 'package:ai_data/features/home/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
  signIn,
  poem,
}

final List<String> routesWithoutAuth = [
  '/',
];

final GoRouter goRouter = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => HomeScreen(),
    ),
  ],
);

extension PushOrReplace on GoRouter {
  void pushOrReplaceNamed(String name, {Object? extra}) {
    if (location == namedLocation(name)) {
      return pushReplacementNamed(name, extra: extra);
    }
  }
}
