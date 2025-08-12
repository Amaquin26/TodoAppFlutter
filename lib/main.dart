import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_flutter/routes/routes.dart';
import 'package:todo_app_flutter/widgets/navigation/bottom_navigation/bottom_navigation_widget.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:todo_app_flutter/widgets/templates/container/view_container/view_container.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(ProviderScope(child: MyApp()));
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: appRoutes,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      routerConfig: _router,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  void _onTap(index) {
    debugPrint('Selected index: $index');
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          'Todo App',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ViewContainer(child: navigationShell),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: navigationShell.currentIndex,
        onTabSelected: _onTap,
      ),
    );
  }
}
