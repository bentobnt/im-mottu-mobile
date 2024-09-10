import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';

class BottomBarWidget extends StatefulWidget {
  final Function(int) onTap;
  final RxInt selectedIndex;

  const BottomBarWidget({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  State<BottomBarWidget> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarWidget> {
  List<BottomItem> items = [];

  void loadItems() {
    items = [
      BottomItem(
        title: "Home",
        icon: DSSvgIconsEnum.home,
      ),
      BottomItem(
        title: "Favoritos",
        icon: DSSvgIconsEnum.favorite,
      ),
    ];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DSColors.secondary,
      height: kBottomNavigationBarHeight +
          DSHelper.mediaQuery.viewPadding.bottom +
          3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.asMap().entries.map((entry) {
          return Obx(
            () => bottomBarItem(
              item: entry.value,
              onTap: widget.onTap,
              isSelected: entry.key == widget.selectedIndex.value,
              index: entry.key,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget bottomBarItem({
    required BottomItem item,
    required Function(int) onTap,
    required bool isSelected,
    required int index,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: DSHelper.mediaQuery.size.width * .25,
        child: Column(
          children: [
            SizedBox(
              height: DSHeight.h_4.value,
              child: Container(
                color: isSelected ? DSColors.tertiary : DSColors.white,
              ),
            ),
            Expanded(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DSSvgIcons.getIcon(
                      item.icon,
                      size: DSIconSize.medium,
                      color: isSelected ? DSColors.tertiary : DSColors.white,
                    ),
                    Text(
                      item.title,
                      style: DSTextStyle.footnote.copyWith(
                        color: isSelected ? DSColors.tertiary : DSColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomItem {
  final String title;
  final DSSvgIconsEnum icon;

  BottomItem({
    required this.icon,
    required this.title,
  });
}
