import 'package:marvel_heroes_core/src/provider/http/http_response.dart';

enum ErrorType {
  defaultError,
  timeout,
}

class HttpException implements Exception {
  HttpResponse? response;
  ErrorType type;
  String? error;

  String get message => (error ?? '{}').toString();

  HttpException({
    this.response,
    this.type = ErrorType.defaultError,
    this.error,
  });

  @override
  String toString() {
    return 'HttpException{response: $response, type: $type, error: $error}';
  }
}
