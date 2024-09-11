import 'package:marvel_heroes_home/src/data/models/hero_model.dart';
import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';

class HeroesResponseModel extends HeroesResponseEntity {
  HeroesResponseModel({
    required super.offset,
    required super.limit,
    required super.total,
    required super.count,
    required super.heroes,
  });

  factory HeroesResponseModel.fromJson(Map<String, dynamic> json) {
    return HeroesResponseModel(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      heroes: json['results'] == null
          ? []
          : (json['results'] as List)
              .map((hero) => HeroModel.fromJson(hero))
              .toList(),
    );
  }
}
