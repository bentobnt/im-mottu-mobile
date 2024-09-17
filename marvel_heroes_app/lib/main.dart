import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_home/marvel_heroes_home.dart';
import 'src/presentation/splash/splash_bindings.dart';
import 'src/presentation/splash/splash_page.dart';
import 'src/presentation/tabbar/tab_bar_bindings.dart';
import 'src/presentation/tabbar/tab_bar_page.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await _clearPreferences();

    runApp(MainApp());
  }, (exception, stackTrace) async {
    _catchFlutterExceptions(exception, stackTrace);
  });
}

Future<void> _clearPreferences() async {
  final pref = await SharedPreferences.getInstance();
  final keys = pref.getKeys().toList().where((key) => key.contains('marvel_heroes_cache_'));
  for (String key in keys) {
    pref.remove(key);
  }
}

void _catchFlutterExceptions(Object error, StackTrace stack) {
  debugPrintStack(stackTrace: stack, label: error.toString());
  Log.error(error.toString());
  FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
}

Future<void> _configureFirebase() async {
  await Firebase.initializeApp(
    options: Platform.isAndroid
        ? const FirebaseOptions(
            apiKey: 'AIzaSyCjNexEjKMhcOiyXy3tEjX3Jpxb3NbOZ-w',
            appId: '1:119939205139:android:3bf65323fbfbc2e77197e6',
            messagingSenderId: '119939205139',
            projectId: 'mottu-test',
            storageBucket: 'mottu-test.appspot.com',
          )
        : const FirebaseOptions(
            apiKey: 'AIzaSyBGAtRenP_lEAKZb6UhdrmDb0FDy9PGA7M',
            appId: '1:119939205139:ios:64d00661c96b2da37197e6',
            messagingSenderId: '119939205139',
            projectId: 'mottu-test',
            storageBucket: 'mottu-test.appspot.com',
            iosBundleId: 'com.mottu.marvel.bento',
          ),
  );

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
}

class MainApp extends StatelessWidget {
  final String? initialRoute;

  MainApp({
    super.key,
    this.initialRoute,
  }) {
    _configureFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      getPages: [
        GetPage(
          name: AppRoutes.main.splash,
          page: () => SplashPage(),
          binding: SplashBindings(),
        ),
        GetPage(
          name: AppRoutes.main.tabbar,
          page: () => TabBarPage(),
          binding: TabBarBindings(),
        ),
        ...HomeModule.routes,
      ],
      initialRoute: AppRoutes.main.splash,
      locale: const Locale('pt', 'BR'),
    );
  }
}
