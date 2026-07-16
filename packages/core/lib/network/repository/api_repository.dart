import 'dart:io';

abstract class ApiRepository {
  Future<dynamic> post(String methodName, dynamic data);
  Future<dynamic> rawPost(String methodName, dynamic data);
  Future<dynamic> formPost(String methodName, File data);
  Future<dynamic> get(String methodName, {Map<String, dynamic>? data});
  Future<dynamic> getWithBody(String methodName, dynamic data);
  Future<dynamic> patch(String methodName, {Map<String, dynamic>? data});
  Future<dynamic> getWithPath(String methodName, String data);
  Future<dynamic> getAll(String methodName);
  Future<dynamic> delete(String methodName, String token, String id);
  Future<dynamic> deleteWithPayload(String methodName, dynamic data);
  Future<dynamic> getPlaces(
    String input,
    bool isMapBox, {
    Map<String, dynamic>? data,
  });
  Future<dynamic> put(String methodName, Map<String, dynamic> data);
  Future<dynamic> rawPut(String methodName, String id, dynamic data);
}
