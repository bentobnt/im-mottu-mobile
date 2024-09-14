import 'package:flutter/services.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

class MethodChannelListener {
  final MethodChannel _methodChannel;

  MethodChannelListener({
    required MethodChannel methodChannel,
  }) : _methodChannel = methodChannel {
    _initListeners();
  }

  void _initListeners() {
    try {
      _methodChannel.setMethodCallHandler((call) async {
        String method = call.method;
        dynamic arguments = call.arguments;

        if (method == CallMethodChannelEnum.listenerChangeConnection.name) {
          final connected = arguments as String == 'conectado';
          Get.snackbar(
            connected ? 'Você está conectado' : 'Você foi desconectado',
            connected
                ? 'Tudo certo com sua conexão'
                : 'Alguma coisa de errado aconteceu',
            snackPosition: SnackPosition.BOTTOM,
            colorText: DSColors.white,
            backgroundColor: connected ? DSColors.success : DSColors.primary,
            borderRadius: DsWidth.w_20.value,
            duration: const Duration(seconds: 5),
            margin: EdgeInsets.symmetric(
              horizontal: DsWidth.w_16.value,
              vertical: DsWidth.w_32.value,
            ),
          );
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
