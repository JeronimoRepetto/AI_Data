import 'package:ai_data/features/home/screen/home.dart';
import 'package:ai_data/features/ranking/screen/ranking.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
  ranking,
}

final List<String> routesWithoutAuth = ['/', 'ranking'];

final GoRouter goRouter = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: AppRoute.ranking.name,
            name: AppRoute.ranking.name,
            builder: (context, state) => Ranking(),
          )
        ]),
  ],
);

extension PushOrReplace on GoRouter {
  void pushOrReplaceNamed(String name, {Object? extra}) {
    if (location == namedLocation(name)) {
      return pushReplacementNamed(name, extra: extra);
    }
  }
}
