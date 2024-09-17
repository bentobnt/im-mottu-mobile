import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/presentation/pages/favorites/favorites_controller.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      backgroundColor: DSColors.white,
      body: Obx(
        () => controller.isLoading.value
            ? const ShimmerListWidget(itens: 5)
            : controller.showError.value
                ? DefaultErrorWidget(
                    tryAgainPressed: controller.fetchFavorites,
                  )
                : _getFavoritesContent(),
      ),
    );
  }

  Widget _getFavoritesContent() {
    return controller.heroesList.isEmpty
        ? DefaultErrorWidget(
          key: const Key('favorites_empty_error'),
            title: 'Nenhum favorito',
            subTitle:
                'Você não adicionou nenhum personagem na sua lista de favoritos, mas não se preocupe, você pode adiconá-los na Home clicando no ícone de favoritar e eles serão adicionados.',
          )
        : Scrollbar(
            controller: controller.scrollController,
            child: ListView.builder(
              key: const Key('list_of_favorites'),
              itemCount: controller.heroesList.length,
              controller: controller.scrollController,
              itemBuilder: (BuildContext context, int index) {
                final name = controller.heroesList[index].name;
                final url = controller.heroesList[index].imageUrl;
                return GestureDetector(
                  key: const Key('favorite_card'),
                  onTap: () => controller.goToDetailsPage(
                    selectedHero: controller.heroesList[index],
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: DSHeight.h_12.value,
                      horizontal: DSHeight.h_16.value,
                    ),
                    decoration: BoxDecoration(
                      color: DSColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                url ?? '',
                                width: DSHelper.width * 0.44,
                                height: DSHelper.height * 0.2,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: DsWidth.w_4.value,
                            ),
                            Expanded(
                              child: Text(
                                name ?? '',
                                textAlign: TextAlign.center,
                                style: DSTextStyle.body.copyWith(
                                  color: DSColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(DSHeight.h_12.value),
                          child: GestureDetector(
                            key: const Key('delete_favorite'),
                            onTap: () => controller
                                .deleteHero(controller.heroesList[index]),
                            child: DSSvgIcons.getIcon(
                              DSSvgIconsEnum.delete,
                              color: DSColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
