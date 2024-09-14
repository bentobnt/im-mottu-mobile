import 'dart:convert';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

class CacheInterceptor extends Interceptor {
  CacheInterceptor();

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.requestOptions.method.toUpperCase() == 'GET') {
      String data = jsonEncode(response.data);
      final pref = await SharedPreferences.getInstance();
      await pref.setString(response.requestOptions.path, data);
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    var networkErros = [
      DioExceptionType.unknown,
      DioExceptionType.connectionError,
      DioExceptionType.connectionTimeout,
    ];

    if (networkErros.contains(err.type)) {
      final pref = await SharedPreferences.getInstance();
      String? body = await pref.getString(err.requestOptions.path);
      if (body != null && body.isNotEmpty) {
        dynamic data = jsonDecode(body);
        handler.resolve(
          Response(
            data: data,
            statusCode: 200,
            requestOptions: err.requestOptions,
          ),
        );
        return;
      }
    }

    super.onError(err, handler);
  }
}
