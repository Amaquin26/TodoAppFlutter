import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_flutter/main.dart';
import 'package:todo_app_flutter/routes/keys/navigator_keys.dart';
import 'package:todo_app_flutter/util/page.dart';
import 'package:todo_app_flutter/views/completed/completed_view.dart';
import 'package:todo_app_flutter/views/home/home_view.dart';
import 'package:todo_app_flutter/views/task/task_view.dart';

final List<RouteBase> appRoutes = [
  StatefulShellRoute.indexedStack(
    parentNavigatorKey: rootNavigatorKey,
    pageBuilder: (context, state, navigationShell) {
      debugPrint(
        'Navigating to: ${state.name}, path: ${state.fullPath}, params: ${state.pathParameters}',
      );
      return getPage(child: MyHomePage(navigationShell), state: state);
    },
    branches: [
      StatefulShellBranch(
        navigatorKey: homeTabNavigatorKey,
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            pageBuilder: (context, state) {
              debugPrint(
                'Navigating to: ${state.name}, path: ${state.fullPath}, params: ${state.pathParameters}',
              );
              return getPage(child: const HomeView(), state: state);
            },
          ),
        ],
      ),
      StatefulShellBranch(
        navigatorKey: completedTabNavigatorKey,
        routes: [
          GoRoute(
            path: '/completed',
            name: 'completed',
            pageBuilder: (context, state) {
              debugPrint(
                'Navigating to: ${state.name}, path: ${state.fullPath}, params: ${state.pathParameters}',
              );

              return getPage(child: const CompletedView(), state: state);
            },
          ),
        ],
      ),
    ],
  ),
  GoRoute(
    parentNavigatorKey: rootNavigatorKey,
    name: 'task',
    path: '/task/:id',
    pageBuilder: (context, state) {
      debugPrint(
        'Navigating to: ${state.name}, path: ${state.fullPath}, params: ${state.pathParameters}',
      );
      final id = int.parse(state.pathParameters['id']!);
      return getPage(
        child: TaskView(todoTaskId: id),
        state: state,
      );
    },
  ),
];
