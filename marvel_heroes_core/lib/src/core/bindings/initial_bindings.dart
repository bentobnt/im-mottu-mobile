import 'package:marvel_heroes_core/src/provider/dio_provider.dart';
import 'package:marvel_heroes_core/src/data/use_cases/local_storage_use_case.dart';
import 'package:marvel_heroes_core/src/domain/http_provider/dio_provider.dart';
import 'package:marvel_heroes_core/src/core/libs/lib_dependencies.dart';
import 'package:marvel_heroes_core/src/domain/use_cases/local_storage_use_case.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILocalStorageUseCase>(
      () => LocalStorageUseCase(),
      fenix: true,
    );

    Get.put<IDioProvider>(
      DioProvider(),
      permanent: true,
    );
  }
}
