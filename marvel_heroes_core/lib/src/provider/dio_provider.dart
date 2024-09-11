import 'package:marvel_heroes_core/src/provider/interceptors/cache_interceptor.dart';
import '../../marvel_heroes_core.dart';

class DioProvider implements IDioProvider {
  final Dio _dio = Dio();
  final String _baseURL = 'http://gateway.marvel.com/v1/public/';
  final defaultParameters = {
    'apikey': '94af7440aa382246e8433cc8bff1b39d',
    'hash': 'ec8f70fe7233a865a22f68945c36560b',
    'ts': '1725912851'
  };

  DioProvider() {
    _setupCacheInterceptor();
  }

  @override
  Future<HttpResponse<T>> get<T>(HttpRequest request) async {
    try {
      _addDefaultParameters(request);

      if (!request.useInterceptors) {
        _dio.interceptors.clear();
      }

      _dio.options.baseUrl = _baseURL;
      _dio.options.headers.addAll(request.headers ?? {});
      _dio.options.connectTimeout = const Duration(seconds: 60);
      _dio.options.receiveTimeout = const Duration(seconds: 60);
      if (request.data != null) {
        throw HttpException(error: "Get don't allow body params");
      }
      final Response<T> response = await _dio.get(
        request.url,
        queryParameters: request.queryParameters,
      );
      return _mapperResponse<T>(response);
    } on DioException catch (e) {
      throw HttpException(
        error: e.response.toString(),
        response: _mapperResponse(e.response),
      );
    }
  }

  @override
  Future<HttpResponse<T>> post<T>(HttpRequest request) async {
    try {
      if (!request.useInterceptors) {
        _dio.interceptors.clear();
      }
      _dio.options.baseUrl = _baseURL;
      _dio.options.headers.addAll(request.headers ?? {});
      _dio.options.connectTimeout = const Duration(seconds: 60);
      _dio.options.receiveTimeout = const Duration(seconds: 60);
      final Response<T> response = await _dio.post(
        request.url,
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(headers: request.headers),
      );
      return _mapperResponse<T>(response);
    } on DioException catch (e) {
      throw HttpException(
        error: e.response.toString(),
        response: _mapperResponse(e.response),
      );
    }
  }

  void _addDefaultParameters(HttpRequest request) {
    request.queryParameters = defaultParameters;
  }

  void _setupCacheInterceptor() {
    _dio.options.headers.clear();
    _dio.interceptors.clear();
    _dio.interceptors.add(
      CacheInterceptor(
        localStorage: Get.find(),
      ),
    );
  }

  HttpResponse<T> _mapperResponse<T>(Response? response) {
    if (response == null) {
      throw HttpException(
        response: HttpResponse(statusCode: 500),
      );
    }

    return HttpResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      headers: response.headers,
    );
  }
}
