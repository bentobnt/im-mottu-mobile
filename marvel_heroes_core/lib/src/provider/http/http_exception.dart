import 'package:marvel_heroes_core/src/provider/http/http_response.dart';

import '../../data/enums/http_error_type_enum.dart';

class HttpException implements Exception {
  HttpResponse? response;
  HttpErrorTypeEnum type;
  String? error;

  String get message => (error ?? '{}').toString();

  HttpException({
    this.response,
    this.type = HttpErrorTypeEnum.defaultError,
    this.error,
  });

  @override
  String toString() {
    return 'HttpException{response: $response, type: $type, error: $error}';
  }
}
