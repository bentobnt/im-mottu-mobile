import 'package:marvel_heroes_core/src/provider/http/http_request.dart';
import 'package:marvel_heroes_core/src/provider/http/http_response.dart';

abstract class IDioProvider {
  Future<HttpResponse<T>> get<T>(HttpRequest request);
  Future<HttpResponse<T>> post<T>(HttpRequest request);
}
