import 'package:flutter/services.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      const MethodChannel('method_channel'),
      permanent: true,
    );

    Get.put(
      MethodChannelListener(
        methodChannel: Get.find(),
      ),
      permanent: true,
    );

    Get.put<IDioProvider>(
      DioProvider(),
      permanent: true,
    );
  }
}
