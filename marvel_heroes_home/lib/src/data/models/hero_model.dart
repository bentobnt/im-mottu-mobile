import 'package:marvel_heroes_home/src/domain/entities/hero_entity.dart';

class HeroModel extends HeroEntity {
  HeroModel({
    required super.name,
    required super.imageUrl,
  });

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
      name: json['name'],
      imageUrl:
          json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
    );
  }
}
