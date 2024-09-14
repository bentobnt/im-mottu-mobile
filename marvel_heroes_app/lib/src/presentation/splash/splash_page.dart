import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  SplashPage({super.key}) {
    controller.initialConfiguration();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: DSColors.primary,
        height: DSHelper.height,
        width: DSHelper.width,
        child: DSImages.getImage(
          DSPngImagesEnum.logo,
          size: DSSizesWidths.dsw_224,
          color: DSColors.white,
        ),
      ),
    );
  }
}
