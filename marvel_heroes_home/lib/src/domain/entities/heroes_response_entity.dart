import 'package:marvel_heroes_home/src/domain/entities/hero_entity.dart';

class HeroesResponseEntity {
  int offset;
  int limit;
  int total;
  int count;
  List<HeroEntity> heroes;

  HeroesResponseEntity({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.heroes,
  });
}
