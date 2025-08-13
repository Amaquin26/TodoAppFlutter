import 'package:go_router/go_router.dart';
import 'package:todo_app_flutter/main.dart';
import 'package:todo_app_flutter/routes/keys/navigator_keys.dart';
import 'package:todo_app_flutter/util/page.dart';
import 'package:todo_app_flutter/views/completed/completed_view.dart';
import 'package:todo_app_flutter/views/home/home_view.dart';
import 'package:todo_app_flutter/views/task/task_view.dart';

final List<RouteBase> appRoutes = [
  StatefulShellRoute.indexedStack(
    pageBuilder: (context, state, navigationShell) {
      return getPage(child: MyHomePage(navigationShell), state: state);
    },
    branches: [
      StatefulShellBranch(
        navigatorKey: homeTabNavigatorKey,
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            pageBuilder: (context, state) =>
                getPage(child: const HomeView(), state: state),
          ),
        ],
      ),
      StatefulShellBranch(
        navigatorKey: completedTabNavigatorKey,
        routes: [
          GoRoute(
            path: '/completed',
            name: 'completed',
            pageBuilder: (context, state) =>
                getPage(child: const CompletedView(), state: state),
          ),
        ],
      ),
    ],
  ),
  GoRoute(
    name: 'task',
    path: '/task/:id',
    pageBuilder: (context, state) {
      final id = int.parse(state.pathParameters['id']!);
      return getPage(
        child: TaskView(todoTaskId: id),
        state: state,
      );
    },
  ),
];
