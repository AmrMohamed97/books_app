import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);
  String baseUrl = 'https://www.googleapis.com/books/v1/';
  Future<Map<String, dynamic>> get({required String endPonit}) async {
    Response response = await _dio.get('$baseUrl$endPonit');
    return response.data;
  }
}
