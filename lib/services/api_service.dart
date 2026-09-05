/// Thin HTTP client wrapper for talking to the LANDER backend.
///
/// This is a skeleton: swap in your real base URL and wire up a package
/// like `http` or `dio` once the backend/API contract is finalized.
///
/// Example usage once implemented:
/// ```dart
/// final jobs = await ApiService().get('/work/jobs');
/// ```
class ApiService {
  ApiService._internal();
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  static const String baseUrl = 'https://api.lander.app/v1';

  Future<Map<String, dynamic>> get(String path) async {
    throw UnimplementedError(
      'Wire up an HTTP client (e.g. dio or http) and point it at '
      '$baseUrl$path',
    );
  }

  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    throw UnimplementedError(
      'Wire up an HTTP client (e.g. dio or http) and point it at '
      '$baseUrl$path',
    );
  }
}
