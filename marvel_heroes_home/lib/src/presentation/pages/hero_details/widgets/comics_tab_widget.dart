import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';

class ComicsTabWidget extends StatelessWidget {
  final HeroesResponseEntity response;

  const ComicsTabWidget({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: response.heroes.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final title = response.heroes[index].title;
          final image = response.heroes[index].imageUrl;
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    image ?? '',
                    width: DSHelper.width * 0.5,
                    height: DSHelper.height * 0.35,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: DSHeight.h_8.value),
                  child: Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: DSTextStyle.footnote.copyWith(
                      color: DSColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
