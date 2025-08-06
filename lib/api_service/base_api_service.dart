import 'dart:io';
import 'dart:convert';

abstract class BaseApiService {
  final String baseUrl;
  static final _client = HttpClient();

  BaseApiService(this.baseUrl);

  Future<dynamic> get(String path) async {
    try {
      final request = await _client.getUrl(Uri.parse('$baseUrl$path'));

      return await _returnJsonResponse(
        request: request,
        errorMessage: "GET $path failed",
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(String path, Map<String, dynamic> data) async {
    try {
      final request = await _client.postUrl(Uri.parse('$baseUrl$path'));
      _addJsonBody(request: request, data: data);

      return await _returnJsonResponse(
        request: request,
        errorMessage: "POST $path failed",
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(String path, Map<String, dynamic> data) async {
    try {
      final request = await _client.putUrl(Uri.parse('$baseUrl$path'));
      _addJsonBody(request: request, data: data);

      return await _returnJsonResponse(
        request: request,
        errorMessage: "PUT $path failed",
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(String path) async {
    try {
      final request = await _client.deleteUrl(Uri.parse('$baseUrl$path'));

      return await _returnJsonResponse(
        request: request,
        errorMessage: "DELETE $path failed",
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch(String path, Map<String, dynamic>? data) async {
    try {
      final request = await _client.patchUrl(Uri.parse('$baseUrl$path'));

      if (data != null) {
        _addJsonBody(request: request, data: data);
      }

      return await _returnJsonResponse(
        request: request,
        errorMessage: "DELETE $path failed",
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> _returnJsonResponse({
    required HttpClientRequest request,
    required String errorMessage,
  }) async {
    final response = await request.close();
    final responseBody = await response.transform(utf8.decoder).join();
    final json = jsonDecode(responseBody);

    if (response.statusCode == 201 || response.statusCode == 200) {
      return json;
    } else {
      throw HttpException('$errorMessage : ${response.statusCode}');
    }
  }

  void _addJsonBody({
    required HttpClientRequest request,
    required Map<String, dynamic> data,
  }) {
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.add(utf8.encode(jsonEncode(data)));
  }

  static void disposeClient() {
    _client.close(force: true);
  }
}
