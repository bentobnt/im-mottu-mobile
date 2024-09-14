import 'package:flutter/services.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_core/src/core/method_channel/method_channel_listener.dart';
import 'package:marvel_heroes_core/src/provider/dio_provider.dart';
import 'package:marvel_heroes_core/src/domain/http_provider/dio_provider.dart';
import 'package:marvel_heroes_core/src/core/libs/lib_dependencies.dart';

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
