/* import 'dart:io'; */
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class BaseApiService {
  final String baseUrl;
  /* static final _client = HttpClient(); */

  BaseApiService(this.baseUrl);

  Future<dynamic> get(String path) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$path'));

      return _processResponse(response, "GET $path failed");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(String path, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$path'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      return _processResponse(response, "POST $path failed");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(String path, Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$path'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      return _processResponse(response, "PUT $path failed");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch(String path, Map<String, dynamic>? data) async {
    try {
      final response = await http.patch(
        Uri.parse('$baseUrl$path'),
        headers: {'Content-Type': 'application/json'},
        body: data != null ? jsonEncode(data) : null,
      );

      return _processResponse(response, "PATCH $path failed");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(String path) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl$path'));

      return _processResponse(response, "DELETE $path failed");
    } catch (e) {
      rethrow;
    }
  }

  dynamic _processResponse(http.Response response, String errorMessage) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('$errorMessage: ${response.statusCode}');
    }
  }

  /* Future<dynamic> get(String path) async {
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
  } */
}
