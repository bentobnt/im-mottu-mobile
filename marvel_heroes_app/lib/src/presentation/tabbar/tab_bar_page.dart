import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/marvel_heroes_home.dart';
import 'tab_bar_controller.dart';
import 'widgets/bottom_bar_widget.dart';

class TabBarPage extends GetView<TabBarController> {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWidget(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Navigator(
          key: controller.navigatorKey,
          initialRoute: controller.initialRoute,
          onGenerateRoute: (RouteSettings settings) {
            return <GetPage>[
              ...HomeModule.routes,
            ].map((page) {
              return GetPageRoute(
                settings: settings,
                routeName: page.name,
                page: page.page,
                binding: page.binding,
                bindings: page.bindings,
                transition: Transition.noTransition,
                parameter: page.parameters,
                middlewares: page.middlewares,
                popGesture: false,
              );
            }).firstWhere(
              (page) => page.routeName == settings.name,
              orElse: () => GetPageRoute(
                settings: settings,
                popGesture: false,
                page: () => Material(
                  color: DSColors.primary,
                  child: Container(
                    child: DSImages.getImage(
                      DSPngImagesEnum.logo,
                      size: DSSizesWidths.dsw_224,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomBarWidget(
          onTap: controller.changeTabIndex,
          selectedIndex: controller.currentIndex,
        ),
      ),
    );
  }
}
