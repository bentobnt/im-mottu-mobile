import 'package:flutter/services.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/presentation/pages/favorites/favorites_controller.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: DSColors.white,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: DSColors.primary,
        centerTitle: true,
        title: Text(
          'Personagens Favoritos',
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
    return Container(
      height: 200,
      width: DSHelper.width ,
      color: DSColors.success,
      child: Text(controller.favoritesList.toString()),
    );
  }
}
