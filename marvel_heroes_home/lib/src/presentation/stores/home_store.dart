import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/domain/entities/hero_entity.dart';

class HomeStore {
  HeroEntity? selectedHero;
  RxList<String> favoritesHeroesIds = RxList.empty();
}
