import 'package:dio/dio.dart';
import 'package:valowiki/core/contracts/http_client.dart';

class DioHttpService implements IHttpClient {
  final Dio _dio;

  DioHttpService(this._dio);

  Dio get dio => _dio;

  @override
  Future<HttpResponse> delete(
    String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  ) async {
    final response = await _dio.delete(
      path,
      data: data,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );

    return HttpResponse(response.data, response.statusCode ?? 0);
  }

  @override
  Future<HttpResponse> get(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await _dio.get(
      path,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );

    return HttpResponse(response.data, response.statusCode ?? 0);
  }

  @override
  Future<HttpResponse> post(
    String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  ) async {
    final response = await _dio.post(
      path,
      data: data,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
    return HttpResponse(response.data, response.statusCode ?? 0);
  }

  @override
  Future<HttpResponse> put(
    String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  ) async {
    final response = await _dio.put(
      path,
      data: data,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
    return HttpResponse(response.data, response.statusCode ?? 0);
  }
}
