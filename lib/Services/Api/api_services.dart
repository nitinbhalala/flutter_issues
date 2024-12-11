import 'package:dio/dio.dart';
import 'package:flutter_issues/main.dart';

class ApiService {
  //=======================Common GET method====================//
  Future<Response?> getRequest(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: headers ?? {},
          responseType: ResponseType.json,
        ),
      );

      return response;
    } on DioException catch (e) {
      print('GET Error: ${e.response?.data}');
      return e.response;
    } catch (e) {
      print('Unexpected error: $e');
      return null;
    }
  }

//=========================Common PUT method==========================//
  Future<Response?> putRequest(
    String url,
    Map<String, dynamic> data, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await dio.put(
        url,
        data: data,
        options:
            Options(headers: headers ?? {}, responseType: ResponseType.json),
      );

      return response;
    } on DioException catch (e) {
      print('PUT Error: ${e.response?.data}');
      return e.response;
    } catch (e) {
      print('Unexpected error: $e');
      return null;
    }
  }

//==========================Common DELETE method======================//
  Future<Response?> deleteRequest(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio.delete(
        url,
        data: data,
        options: Options(
          headers: headers ?? {},
          responseType: ResponseType.json,
        ),
      );

      return response;
    } on DioException catch (e) {
      print('DELETE Error: ${e.response?.data}');
      return e.response;
    } catch (e) {
      print('Unexpected error: $e');
      return null;
    }
  }

//==========================Common POST method======================//
  Future<Response?> postRequest({
    required String url,
    required Map<String, dynamic> data,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: headers ?? {},
          responseType: ResponseType.json,
        ),
      );

      return response;
    } on DioException catch (e) {
      // Handle the error
      print('Error: ${e.response?.data}');
      return e.response;
    } catch (e) {
      print('Unexpected error: $e');
      return null;
    }
  }
}
