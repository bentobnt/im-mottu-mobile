import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

class ShimmerListWidget extends StatelessWidget {
  final int itens;

  const ShimmerListWidget({
    required this.itens,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: DsWidth.w_16.value),
      child: ListView(
        shrinkWrap: false,
        children: _getItens(),
      ),
    );
  }

  List<Widget> _getItens() {
    List<Widget> list = [];
    for (var i = 0; i < 10; i++) {
      list.add(
        Padding(
          padding: EdgeInsets.all(DsWidth.w_8.value),
          child: Shimmer.fromColors(
            enabled: true,
            baseColor: DSColors.tertiary,
            highlightColor: DSColors.divider,
            child: Container(
              height: DSHelper.height * 0.2,
              decoration: BoxDecoration(
                color: DSColors.tertiary,
                borderRadius: BorderRadius.circular(DSHeight.h_12.value),
              ),
            ),
          ),
        ),
      );
    }
    return list;
  }
}
