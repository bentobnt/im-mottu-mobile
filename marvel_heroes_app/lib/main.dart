import 'dart:async';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_home/marvel_heroes_home.dart';
import 'src/presentation/splash/splash_bindings.dart';
import 'src/presentation/splash/splash_page.dart';
import 'src/presentation/tabbar/tab_bar_bindings.dart';
import 'src/presentation/tabbar/tab_bar_page.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    runApp(const MainApp());
  }, (exception, stackTrace) async {
    _catchFlutterExceptions(exception, stackTrace);
  });
}

void _catchFlutterExceptions(Object error, StackTrace stack) {
  debugPrintStack(stackTrace: stack, label: error.toString());
}

class MainApp extends StatefulWidget {
  final String? initialRoute;

  const MainApp({
    super.key,
    this.initialRoute,
  });

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.detached:
        final pref = await SharedPreferences.getInstance();
        pref.clear();
        break;
      case AppLifecycleState.paused:
        print('paused');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
