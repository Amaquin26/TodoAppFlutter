import 'package:go_router/go_router.dart';
import 'package:todo_app_flutter/main.dart';
import 'package:todo_app_flutter/views/completed/completed_view.dart';
import 'package:todo_app_flutter/views/home/home_view.dart';
import 'package:todo_app_flutter/views/task/task_view.dart';

final List<RouteBase> appRoutes = [
  GoRoute(
    parentNavigatorKey: rootNavigatorKey,
    name: 'task',
    path: '/task/:id',
    builder: (context, state) {
      final id = int.parse(state.pathParameters['id']!);
      return TaskView(todoTaskId: id);
    },
  ),
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return MyHomePage(navigationShell);
    },
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const HomeView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/completed',
            name: 'completed',
            builder: (context, state) => const CompletedView(),
          ),
        ],
      ),
    ],
  ),
];
