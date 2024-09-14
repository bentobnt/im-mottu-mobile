import 'package:marvel_heroes_core/src/provider/dio_provider.dart';
import 'package:marvel_heroes_core/src/domain/http_provider/dio_provider.dart';
import 'package:marvel_heroes_core/src/core/libs/lib_dependencies.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<IDioProvider>(
      DioProvider(),
      permanent: true,
    );
  }
}
