import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

class DSLoading extends StatelessWidget {
  final DSLoadingSizeEnum size;

  const DSLoading({
    required this.size,
    super.key,
  });

  DSHeight get loadingSize => size.loadingSize();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: loadingSize.value,
      width: loadingSize.value,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DSHeight.h_12.value),
        color: DSColors.white,
      ),
      child: DSImages.getImage(
        DSPngImagesEnum.loading,
        size: loadingSize.value,
      ),
    );
  }
}
