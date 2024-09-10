import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_home/src/presentation/pages/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value ? _getSkeleton() : _getContentPage(),
      ),
    );
  }

  Widget _getSkeleton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        shrinkWrap: false,
        children: [
          SizedBox(height: DSHelper.height * .05),
          Shimmer.fromColors(
            enabled: true,
            baseColor: DSColors.tertiary,
            highlightColor: DSColors.divider,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: DSColors.tertiary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: DSHelper.height * .025),
          Shimmer.fromColors(
            enabled: true,
            baseColor: DSColors.tertiary,
            highlightColor: DSColors.divider,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: DSColors.tertiary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getContentPage() {
    return controller.showError.value ? _getErrorContent() : _getHomeContent();
  }

  Widget _getErrorContent() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Alguma coisa de errado aconteceu',
            textAlign: TextAlign.center,
            style: DSTextStyle.body2,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'No momento não conseguimos carregar as informações. Mas não se preocupe, você pode tentar mais tarde',
            textAlign: TextAlign.center,
            style: DSTextStyle.body2,
          ),
        ],
      ),
    );
  }

  Widget _getHomeContent() {
    return ListView.builder(
      itemCount: controller.heroesList.length,
      itemBuilder: (BuildContext context, int index) {
        final name = controller.heroesList[index].name;
        final url = controller.heroesList[index].imageUrl;
        return Card(
          child: ListTile(
            leading: ClipRRect(
              child: Image.network(
                url,
                fit: BoxFit.fill,
                width: 100,
                height: 100,
              ),
            ),
            title: Text(name),
          ),
        );
      },
    );
  }
}
