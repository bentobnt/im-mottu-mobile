import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

class CustomTabBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final TabController tabController;
  final List<String> productsTitles;

  const CustomTabBarWidget({
    required this.tabController,
    required this.productsTitles,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: SizedBox(
        height: kToolbarHeight,
        child: ColoredBox(
          color: DSColors.primary,
          child: TabBar(
            isScrollable: false,
            controller: tabController,
            indicatorWeight: 4,
            indicatorColor: DSColors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: DSColors.divider,
            unselectedLabelColor: DSColors.white,
            tabs: productsTitles.map((e) => getTab(e)).toList(),
          ),
        ),
      ),
    );
  }

  Tab getTab(String title) {
    return Tab(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: DSTextStyle.footnote.copyWith(
          color: DSColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
