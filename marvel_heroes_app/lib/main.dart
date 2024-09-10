import 'dart:async';

import 'package:flutter/material.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MainApp());
  }, (exception, stackTrace) async {
    _catchFlutterExceptions(exception, stackTrace);
  });
}

void _catchFlutterExceptions(Object error, StackTrace stack) {
  debugPrintStack(stackTrace: stack, label: error.toString());
}

class MainApp extends StatelessWidget {
  final String? initialRoute;

  const MainApp({
    super.key,
    this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
