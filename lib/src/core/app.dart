import 'package:codelitt_calendar/src/core/router.dart' as r;
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      debugShowCheckedModeBanner: false,
      title: 'Codelitt Calendar',
      routerConfig: r.Router.router,
    );
  }
}
