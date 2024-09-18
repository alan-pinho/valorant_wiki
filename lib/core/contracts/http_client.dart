abstract interface class IHttpClient {
  Future<HttpResponse> post(
    String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  );
  Future<HttpResponse> put(
    String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  );
  Future<HttpResponse> get(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  });
  Future<HttpResponse> delete(
    String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  );
}

class HttpResponse {
  final dynamic data;
  final int statusCode;

  HttpResponse(dynamic data, this.statusCode) : data = data['data'];
}
