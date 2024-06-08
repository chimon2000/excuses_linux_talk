import 'package:excuses_linux_talk/pages/home/ui/home_page.dart';
import 'package:excuses_linux_talk/shared/routing/route_names.dart';

import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: AppRoute.home.path,
    name: AppRoute.home.name,
    redirect: (context, state) {
      return state.namedLocation(
        AppRoute.excuse.name,
        pathParameters: {
          'id': '1',
          ...state.pathParameters,
        },
      );
    },
    routes: [
      GoRoute(
        path: AppRoute.excuses.path,
        name: AppRoute.excuses.name,
        redirect: (context, state) {
          return state.namedLocation(
            AppRoute.excuse.name,
            pathParameters: {
              'id': '1',
              ...state.pathParameters,
            },
          );
        },
        routes: [
          GoRoute(
            path: AppRoute.excuse.path,
            name: AppRoute.excuse.name,
            builder: (context, state) => HomePage(
                id: int.tryParse(state.pathParameters['id'] ?? '1') ?? 1),
          ),
        ],
      ),
    ],
  ),
]);
