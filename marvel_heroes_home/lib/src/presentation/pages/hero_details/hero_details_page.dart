import 'package:flutter/services.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/presentation/pages/hero_details/hero_details_controller.dart';
import 'package:marvel_heroes_home/src/presentation/widgets/shimmer_list.dart';

class HeroDetailsPage extends GetView<HeroDetailsController> {
  const HeroDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.tabHeaderTitles.length,
      child: Scaffold(
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
            controller.selectedHero.name ?? '',
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
      ),
    );
  }

  Widget _getFavoritesContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: DSHelper.height * 0.3,
            width: DSHelper.width,
            color: DSColors.white,
            child: Image.network(
              controller.selectedHero.imageUrl ?? '',
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
          Container(
            height: DSHelper.height * 0.45,
            color: DSColors.secondary,
            child: Scrollbar(
              child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final title =
                      'ifqhofhwofhwoqifhwoqifhwoqifhwioqfhwioqfhwioqfhwioqhf'; //response.heroes[index].title;
                  final image = 'teste';
                  //response.heroes[index].imageUrl;
                  return Container(
                    width: DSHelper.width * 0.5,
                    margin: EdgeInsets.symmetric(
                      vertical: DSHeight.h_12.value,
                      horizontal: DSHeight.h_16.value,
                    ),
                    decoration: BoxDecoration(
                      color: DSColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: DSImages.getImage(
                            DSPngImagesEnum.error,
                            fit: BoxFit.scaleDown,
                            size: DSHelper.height * 0.35,
                            //size: DSSizesWidths.dsw_112,
                          ),
                          // Image.network(
                          //   image ?? '',
                          //   width: DSHelper.width * 0.5,
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.all(DSHeight.h_8.value),
                            child: Text(
                              title ?? '',
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
                  );
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: DSColors.tertiary,
            width: DSHelper.width,
            height: DSHeight.h_48.value,
            child: Text(
              'Detalhes',
              textAlign: TextAlign.center,
              style: DSTextStyle.body.copyWith(
                color: DSColors.text,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: DSHelper.height * 0.35,
            width: DSHelper.width,
            color: DSColors.tertiary,
            child: Padding(
              padding: EdgeInsets.all(DSHeight.h_24.value),
              child: Text(
                controller.selectedHero.desc == ''
                    ? 'Não tem descrição.'
                    : controller.selectedHero.desc ?? 'Não tem descrição.',
                textAlign: TextAlign.justify,
                style: DSTextStyle.body2.copyWith(
                  color: DSColors.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
