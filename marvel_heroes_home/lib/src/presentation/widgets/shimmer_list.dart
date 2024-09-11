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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            enabled: true,
            baseColor: DSColors.tertiary,
            highlightColor: DSColors.divider,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: DSColors.tertiary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      );
    }
    return list;
  }
}
