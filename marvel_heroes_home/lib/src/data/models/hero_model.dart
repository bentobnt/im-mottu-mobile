import 'package:marvel_heroes_home/src/domain/entities/hero_entity.dart';

class HeroModel extends HeroEntity {
  HeroModel({
    required super.id,
    super.name,
    super.title,
    super.desc,
    super.imageUrl,
  });

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
      id: json['id'],
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      desc: json['description'] ?? '',
      imageUrl: json['thumbnail'] == null
          ? ''
          : json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
    );
  }
}
