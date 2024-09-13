import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';

class SeriesTabWidget extends StatelessWidget {
  final HeroesResponseEntity response;

  const SeriesTabWidget({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: response.heroes.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          final title = response.heroes[index].title;
          final image = response.heroes[index].imageUrl;
          return Container(
            margin: EdgeInsets.symmetric(
              vertical: DSHeight.h_12.value,
              horizontal: DSHeight.h_16.value,
            ),
            decoration: BoxDecoration(
              color: DSColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    image ?? '',
                    height: DSHeight.h_112.value,
                    width: DsWidth.w_112.value,
                    fit: BoxFit.fill,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: DSHeight.h_8.value,
                    ),
                    child: Text(
                      title ?? '',
                      textAlign: TextAlign.start,
                      style: DSTextStyle.body.copyWith(
                        color: DSColors.black,
                      ),
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
