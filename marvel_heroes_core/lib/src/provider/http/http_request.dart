class HttpRequest {
  final String url;
  final dynamic data;
  Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;
  final bool useInterceptors;

  HttpRequest({
    required this.url,
    this.data,
    this.queryParameters,
    this.headers,
    this.useInterceptors = true,
  });
}
