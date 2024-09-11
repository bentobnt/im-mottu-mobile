import 'package:flutter/services.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/presentation/pages/home/home_controller.dart';
import 'package:marvel_heroes_home/src/presentation/widgets/shimmer_list.dart';

class HeroDetailsPage extends GetView<HomeController> {
  const HeroDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: DSColors.white,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: DSColors.white,
        ),
        backgroundColor: DSColors.primary,
        title: Text(
          'Detalhes',
          overflow: TextOverflow.ellipsis,
          style: DSTextStyle.body.copyWith(
            color: DSColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: DSColors.background,
      body: Obx(
        () => controller.isLoading.value
            ? const ShimmerListWidget(itens: 5)
            : controller.showError.value
                ? DefaultErrorWidget(
                    tryAgainPressed: () {},
                  )
                : _getFavoritesContent(),
      ),
    );
  }

  Widget _getFavoritesContent() {
    return Container(height: 200, color: DSColors.success);
  }
}
