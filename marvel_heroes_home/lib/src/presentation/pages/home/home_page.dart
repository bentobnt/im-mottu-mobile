import 'package:flutter/services.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/presentation/pages/home/home_controller.dart';
import 'package:marvel_heroes_home/src/presentation/pages/home/widgets/radio_list_tile.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: DSColors.white,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Obx(
          () => controller.showSearchBar.value
              ? _searchTextField()
              : Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personagens',
                        overflow: TextOverflow.ellipsis,
                        style: DSTextStyle.body.copyWith(
                          color: DSColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        backgroundColor: DSColors.primary,
        actions: [
          Obx(
            () => controller.showSearchBar.value
                ? Padding(
                    padding: EdgeInsets.only(right: DsWidth.w_24.value),
                    child: GestureDetector(
                      child: DSSvgIcons.getIcon(DSSvgIconsEnum.close),
                      onTap: () {
                        controller.showSearchBar.value = false;
                        controller.searchTextFieldController.clear();
                        controller.onTypingFinished(null);
                      },
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(right: DsWidth.w_24.value),
                    child: GestureDetector(
                      child: DSSvgIcons.getIcon(DSSvgIconsEnum.search),
                      onTap: () {
                        // Testar Crashlytics - descomentar próxima linha
                        //FirebaseCrashlytics.instance.crash();
                        controller.showSearchBar.value = true;
                      },
                    ),
                  ),
          )
        ],
      ),
      backgroundColor: DSColors.background,
      body: Obx(
        () => controller.isLoading.value
            ? const ShimmerListWidget(itens: 5)
            : controller.showError.value
                ? DefaultErrorWidget(
                    tryAgainPressed: controller.getHeroesList,
                  )
                : _getHomeContent(),
      ),
    );
  }

  Widget _searchTextField() {
    return TextField(
      controller: controller.searchTextFieldController,
      autofocus: true,
      cursorColor: DSColors.white,
      style: DSTextStyle.body.copyWith(
        color: DSColors.white,
      ),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: DSColors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: DSColors.white),
        ),
        hintText: 'Digite o nome de um personagem',
        hintStyle: DSTextStyle.body2.copyWith(
          color: DSColors.divider,
        ),
      ),
      onChanged: controller.onTypingFinished,
    );
  }

  Widget _getHomeContent() {
    return Obx(
      () => Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: DsWidth.w_20.value,
                  vertical: DSHeight.h_16.value,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mostrando ${controller.heroesListFiltered.length.toString()} de ${controller.numberOfHeroes} personagens',
                      style: DSTextStyle.footnote,
                    ),
                    Visibility(
                      visible: !controller.showSearchBar.value,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => controller.scrollToBottom(true),
                            child: DSSvgIcons.getIcon(DSSvgIconsEnum.arrowDown,
                                color: DSColors.secondary),
                          ),
                          GestureDetector(
                            onTap: () => controller.scrollToBottom(false),
                            child: DSSvgIcons.getIcon(DSSvgIconsEnum.arrowUp,
                                color: DSColors.secondary),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: _getBottomSheetOrder,
                      child: DSSvgIcons.getIcon(DSSvgIconsEnum.filter,
                          color: DSColors.secondary),
                    ),
                  ],
                ),
              ),
              Divider(height: DSHeight.h_1.value, color: DSColors.divider),
              Expanded(
                child: Scrollbar(
                  controller: controller.scrollController,
                  child: ListView.builder(
                    itemCount: controller.heroesListFiltered.length,
                    controller: controller.scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      final id = controller.heroesListFiltered[index].id;
                      final name = controller.heroesListFiltered[index].name;
                      final url = controller.heroesListFiltered[index].imageUrl;
                      return GestureDetector(
                        // Testar Crashlytics - descomentar próxima linha
                        //onTap: () => throw Exception(),
                        onTap: () => controller.goToDetailsPage(
                          selectedHero: controller.heroesListFiltered[index],
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
                                  child: Obx(
                                    () => DSSvgIcons.getIcon(
                                      controller.listHeroesIds
                                              .contains(id.toString())
                                          ? DSSvgIconsEnum.favoriteCheck
                                          : DSSvgIconsEnum.favorite,
                                      color: DSColors.white,
                                    ),
                                  ),
                                  onTap: () => controller.handleFavoriteButton(
                                    add: !controller.listHeroesIds
                                        .contains(id.toString()),
                                    heroId: id,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Obx(
            () => controller.fetchNewPage.value
                ? const DSLoading(size: DSLoadingSizeEnum.big)
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  void _getBottomSheetOrder() {
    BottomSheetWidget.show(
      child: SafeArea(
        child: SizedBox(
          width: DSHelper.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: DSHeight.h_8.value),
                child: Text(
                  'Ordenar',
                  style: DSTextStyle.subtitle.copyWith(
                    color: DSColors.text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              OrderByRadioListTileWidget(
                options: const [
                  OrderByEnum.nameAsc,
                  OrderByEnum.nameDesc,
                ],
                selectedOption: controller.orderByEnum,
                onchange: (value) async {
                  Get.back();
                  controller.orderByEnum = value;
                  await controller.applyOrderFilter();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
