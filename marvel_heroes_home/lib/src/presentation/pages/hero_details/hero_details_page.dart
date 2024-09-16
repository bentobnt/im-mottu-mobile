import 'package:flutter/services.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/presentation/pages/hero_details/hero_details_controller.dart';

// ignore: must_be_immutable
class HeroDetailsPage extends StatelessWidget {
  HeroDetailsController controller = HeroDetailsController(
    homeStore: Get.find(),
    getHeroDetailByTypeUseCase: Get.find(),
    getRelatedHeroesUsecase: Get.find(),
  );

  HeroDetailsPage({super.key}) {
    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.tabHeaderTitles.length,
      child: Scaffold(
        floatingActionButton: DSCircularButton(
          key: const Key('info_button_details'),
          onTap: () => BottomSheetWidget.show(child: _getBottomSheetDetails()),
          button: DSCircularButtonNavigatorEnum.info,
        ),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: DSColors.white,
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: DSColors.white,
          ),
          backgroundColor: DSColors.primary,
          title: Text(
            controller.selectedHero?.name ?? '',
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
              ? _getShimmerDetails()
              : controller.showError.value
                  ? DefaultErrorWidget(
                      tryAgainPressed: controller.loadHeroDetails,
                    )
                  : _getDetailsContent(),
        ),
      ),
    );
  }

  Widget _getBottomSheetDetails() {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: DSHeight.h_8.value),
            child: Text(
              'Detalhes',
              style: DSTextStyle.subtitle.copyWith(
                color: DSColors.text,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: DSHeight.h_32.value),
            child: Text(
              controller.selectedHero?.desc == ''
                  ? 'Não tem descrição.'
                  : controller.selectedHero?.desc ?? 'Não tem descrição.',
              textAlign: TextAlign.justify,
              style: DSTextStyle.body2.copyWith(
                color: DSColors.text,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getDetailsContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: DSHelper.height * 0.3,
            width: DSHelper.width,
            color: DSColors.white,
            child: Image.network(
              controller.selectedHero?.imageUrl ?? '',
              width: DSHelper.width * 0.44,
              height: DSHelper.height * 0.2,
              fit: BoxFit.cover,
            ),
          ),
          CustomTabBarWidget(
            tabController: controller.tabController,
            productsTitles: controller.tabHeaderTitles,
          ),
          SizedBox(
            height: DSHelper.height * 0.45,
            child: TabBarView(
              controller: controller.tabController,
              children: [...controller.tabContent],
            ),
          ),
          _getRelatedHeroesWidget(),
        ],
      ),
    );
  }

  Widget _getRelatedHeroesWidget() {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          color: DSColors.secondary,
          width: DSHelper.width,
          height: DSHeight.h_48.value,
          child: Text(
            'Personagens relacionados',
            textAlign: TextAlign.center,
            style: DSTextStyle.body.copyWith(
              color: DSColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Obx(
          () => controller.isLoadingRelatedHeroes.value
              ? _getRelatedHeroesShimmer()
              : controller.relatedHeroes.isEmpty
                  ? controller.getNoInformationWidget()
                  : Container(
                      height: DSHelper.height * 0.35,
                      color: DSColors.secondary,
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: controller.relatedHeroes.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final hero = controller.relatedHeroes[index];
                            final name = hero.name ?? '';
                            final image = hero.imageUrl ?? '';
                            return GestureDetector(
                              key: const Key('related_hero_card'),
                              onTap: () => controller.loadRelatedHero(hero),
                              child: Container(
                                width: DSHelper.width * 0.35,
                                margin: EdgeInsets.symmetric(
                                  vertical: DSHeight.h_12.value,
                                  horizontal: DSHeight.h_16.value,
                                ),
                                decoration: BoxDecoration(
                                  color: DSColors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        image,
                                        height: DSHelper.height * 0.27,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          DSHeight.h_8.value,
                                        ),
                                        child: Text(
                                          name,
                                          textAlign: TextAlign.center,
                                          style: DSTextStyle.footnote.copyWith(
                                            color: DSColors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
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
        ),
      ],
    );
  }

  Widget _getShimmerDetails() {
    return Padding(
      padding: EdgeInsets.all(DsWidth.w_8.value),
      child: Column(
        children: [
          Shimmer.fromColors(
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
          SizedBox(height: DSHeight.h_24.value),
          Shimmer.fromColors(
            enabled: true,
            baseColor: DSColors.tertiary,
            highlightColor: DSColors.divider,
            child: Container(
              height: DSHelper.height * 0.5,
              decoration: BoxDecoration(
                color: DSColors.tertiary,
                borderRadius: BorderRadius.circular(DSHeight.h_12.value),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getRelatedHeroesShimmer() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DsWidth.w_24.value,
      ),
      child: Row(
        children: [
          Shimmer.fromColors(
            enabled: true,
            baseColor: DSColors.tertiary,
            highlightColor: DSColors.divider,
            child: Container(
              height: DSHelper.height * 0.3,
              width: DSHelper.width * 0.3,
              decoration: BoxDecoration(
                color: DSColors.tertiary,
                borderRadius: BorderRadius.circular(
                  DSHeight.h_12.value,
                ),
              ),
            ),
          ),
          SizedBox(width: DsWidth.w_24.value),
          Shimmer.fromColors(
            enabled: true,
            baseColor: DSColors.tertiary,
            highlightColor: DSColors.divider,
            child: Container(
              height: DSHelper.height * 0.3,
              width: DSHelper.width * 0.3,
              decoration: BoxDecoration(
                color: DSColors.tertiary,
                borderRadius: BorderRadius.circular(
                  DSHeight.h_12.value,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
