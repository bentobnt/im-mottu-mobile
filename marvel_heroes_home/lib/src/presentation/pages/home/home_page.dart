import 'package:flutter/services.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/presentation/pages/home/home_controller.dart';
import 'package:marvel_heroes_home/src/presentation/widgets/shimmer_list.dart';

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
                        controller.search('');
                      },
                    ))
                : Padding(
                    padding: EdgeInsets.only(right: DsWidth.w_24.value),
                    child: GestureDetector(
                      child: DSSvgIcons.getIcon(DSSvgIconsEnum.search),
                      onTap: () {
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
                    tryAgainPressed: () {},
                  )
                : _getHomeContent(),
      ),
    );
  }

  Widget _searchTextField() {
    return TextField(
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
      onChanged: controller.search,
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
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.heroesListFiltered.length,
                  controller: controller.scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    final name = controller.heroesListFiltered[index].name;
                    final url = controller.heroesListFiltered[index].imageUrl;
                    return GestureDetector(
                      onTap: controller.goToDetailsPage,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: DSHeight.h_12.value,
                          horizontal: DSHeight.h_16.value,
                        ),
                        decoration: BoxDecoration(
                          color: DSColors.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                url,
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
                                name,
                                textAlign: TextAlign.center,
                                style: DSTextStyle.body.copyWith(
                                  color: DSColors.white,
                                  fontWeight: FontWeight.bold,
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
            ],
          ),
          Obx(
            () => controller.fetchNewPage.value
                ? const CircularProgressIndicator(
                    color: DSColors.secondary,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
