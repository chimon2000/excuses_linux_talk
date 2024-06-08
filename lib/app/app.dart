import 'package:excuses_linux_talk/shared/routing/router.dart';
import 'package:flutter/material.dart';

class ExcusesApp extends StatelessWidget {
  const ExcusesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Excuses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
