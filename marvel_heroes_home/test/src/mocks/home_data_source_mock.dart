import 'package:marvel_heroes_home/src/data/data_sources/home_datasource.dart';
import 'package:marvel_heroes_home/src/data/models/hero_model.dart';
import 'package:marvel_heroes_home/src/data/models/heroes_response_model.dart';
import 'package:marvel_heroes_home/src/infra/data_sources/home_datasource.dart';
import 'package:marvel_heroes_home/src/presentation/pages/home/home_controller.dart';

class HomeDataSourceMock implements IHomeDataSource {
  bool? successFetched;

  HomeDataSourceMock({
    this.successFetched = true,
  });

  @override
  Future<HeroesResponseModel> getHeroesList(
      {int? offset, int? id, String? query, OrderByEnum? order}) async {
    await Future.delayed(const Duration(seconds: 1));

    if (order == OrderByEnum.nameDesc) {
      return HeroesResponseModel(
        offset: 0,
        limit: 2,
        total: 100,
        count: 2,
        heroes: [
          HeroModel(
            id: 1017100,
            name: 'A-Bomb (HAS)',
            imageUrl:
                'http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg',
          ),
          HeroModel(
            id: 1011334,
            name: '3-D Man',
            imageUrl:
                'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg',
          ),
        ],
      );
    }

    if (query == '3') {
      return HeroesResponseModel(
        offset: 0,
        limit: 2,
        total: 100,
        count: 2,
        heroes: [
          HeroModel(
            id: 1011334,
            name: '3-D Man',
            imageUrl:
                'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg',
          ),
        ],
      );
    }

    if (successFetched ?? false) {
      return HeroesResponseModel(
        offset: 0,
        limit: 2,
        total: 100,
        count: 2,
        heroes: [
          HeroModel(
            id: 1011334,
            name: '3-D Man',
            imageUrl:
                'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg',
          ),
          HeroModel(
            id: 1017100,
            name: 'A-Bomb (HAS)',
            imageUrl:
                'http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg',
          ),
        ],
      );
    }
    throw Exception('Erro no serviço');
  }

  @override
  Future<HeroesResponseModel> getHeroDetailsByType(
      {required int id, required DetailTypeEnum type}) async {
    await Future.delayed(const Duration(seconds: 1));

    if (successFetched ?? false) {
      return HeroesResponseModel(
        offset: 0,
        limit: 2,
        total: 2,
        count: 2,
        heroes: [
          HeroModel(
            id: 22506,
            title: 'Avengers: The Initiative (2007) #19',
            imageUrl:
                'http://i.annihil.us/u/prod/marvel/i/mg/d/03/58dd080719806.jpg',
          ),
        ],
      );
    }
    throw Exception('Erro no serviço');
  }

  @override
  Future<HeroesResponseModel> getRelatedHeroes({required int comicId}) async {
    await Future.delayed(const Duration(seconds: 1));

    if (successFetched ?? false) {
      return HeroesResponseModel(
        offset: 0,
        limit: 2,
        total: 2,
        count: 2,
        heroes: [
          HeroModel(
            id: 1010802,
            name: 'Ant-Man (Eric O\'Grady)',
            imageUrl:
                'http://i.annihil.us/u/prod/marvel/i/mg/9/c0/53176aa9df48d.jpg',
          ),
          HeroModel(
            id: 1009165,
            name: 'Avengers',
            imageUrl:
                'http://i.annihil.us/u/prod/marvel/i/mg/9/20/5102c774ebae7.jpg',
          ),
        ],
      );
    }
    throw Exception('Erro no serviço');
  }
}
