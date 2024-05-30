import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  final String _baseUrl = 'https://todo.iraqsapp.com';

  ApiServices(this._dio);

  //Post Request
  Future<Response> post({
    required String endPoint,
    bodyData,
    String? token,
    String? contentType,
  }) async {
    Response response = await _dio.post(
      '$_baseUrl/$endPoint',
      options: Options(
        headers: {
          'Content-Type': contentType ?? 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      data: bodyData,
    );
    return response;
  }

  //Get Request
  Future<Response> get({
    required String endPoint,
    String? token,
    String? contentType,
  }) async {
    Response response = await _dio.get(
      '$_baseUrl/$endPoint',
      options: Options(
        headers: {
          'Content-Type': contentType ?? 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response;
  }
}
