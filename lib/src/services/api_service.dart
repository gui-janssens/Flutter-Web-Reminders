import 'dart:convert';

import 'package:codelitt_calendar/src/core/logger.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:http/http.dart';
import 'package:oxidized/oxidized.dart';

class ApiService {
  final Client _client;
  final AppLogger _logger;

  ApiService(this._client, this._logger);

  static const String baseUrl = 'my_base_url.com';

  final Map<String, String> baseHeaders = {
    'content-type': 'application/json; charset=utf-8',
  };

  // safely building Uris with optional query params
  Uri buildUri(String path, [Map<String, dynamic>? queryParameters]) {
    return Uri.http(
      baseUrl,
      path,
      queryParameters,
    );
  }

  // in order to validate if the status represents success or not
  bool isOk(int statusCode) => [200, 201, 204].contains(statusCode);

  Future<Result<dynamic, AppError>> get({
    required String path,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final uri = buildUri(path, queryParams);
      final response = await _client.get(uri, headers: baseHeaders);

      _logger.d('GET @:\n$uri');

      var decodedResponse =
          response.body.isNotEmpty ? json.decode(response.body) : '';

      if (isOk(response.statusCode)) {
        return Result.ok(decodedResponse);
      } else {
        return Result.err(AppError.fromJson(decodedResponse));
      }
    } catch (e) {
      _logger.e('GET catch exception: ${e.toString()}');
      throw 'GET catch exception: ${e.toString()}';
    }
  }

  Future<Result<dynamic, AppError>> post({
    required String path,
    required Map<String, dynamic> payload,
  }) async {
    final uri = buildUri(path);
    try {
      var response = await _client.post(
        uri,
        headers: baseHeaders,
        body: json.encode(payload),
      );

      _logger.d('POST @:\n$uri');

      var decodedResponse =
          response.body != '' ? json.decode(response.body) : '';
      if (isOk(response.statusCode)) {
        return Result.ok(decodedResponse);
      } else {
        return Result.err(AppError.fromJson(decodedResponse));
      }
    } catch (e) {
      _logger.e('POST catch exception: ${e.toString()}');
      throw 'POST catch exception: ${e.toString()}';
    }
  }

  Future<Result<dynamic, AppError>> delete({
    required String path,
  }) async {
    final uri = buildUri(path);
    try {
      var response = await _client.delete(uri, headers: baseHeaders);

      _logger.d('DELETE @:\n$uri');

      var decodedResponse =
          response.body != '' ? json.decode(response.body) : '';

      if (isOk(response.statusCode)) {
        return Result.ok(decodedResponse);
      } else {
        return Result.err(AppError.fromJson(decodedResponse));
      }
    } catch (e) {
      _logger.e('DELETE catch exception: ${e.toString()}');
      throw 'DELETE catch exception: ${e.toString()}';
    }
  }

  Future<Result<dynamic, AppError>> patch({
    required String path,
    Map<String, dynamic>? payload,
  }) async {
    final uri = buildUri(path);
    try {
      var response = await _client.patch(
        uri,
        headers: baseHeaders,
        body: payload != null ? json.encode(payload) : null,
      );

      _logger.d('PATCH @:\n$uri');

      var decodedResponse =
          response.body != '' ? json.decode(response.body) : '';

      if (isOk(response.statusCode)) {
        return Result.ok(decodedResponse);
      } else {
        return Result.err(AppError.fromJson(decodedResponse));
      }
    } catch (e) {
      _logger.e('PATCH catch exception: ${e.toString()}');
      throw 'PATCH catch exception: ${e.toString()}';
    }
  }

  Future<Result<dynamic, AppError>> put({
    required String path,
    required Map<String, dynamic> payload,
  }) async {
    final uri = buildUri(path);
    try {
      var response = await _client.put(
        uri,
        headers: baseHeaders,
        body: json.encode(payload),
      );

      _logger.d('PUT @:\n$uri');

      var decodedResponse =
          response.body != '' ? json.decode(response.body) : '';
      if (isOk(response.statusCode)) {
        return Result.ok(decodedResponse);
      } else {
        return Result.err(AppError.fromJson(decodedResponse));
      }
    } catch (e) {
      _logger.e('PUT catch exception: ${e.toString()}');
      throw 'PUT catch exception: ${e.toString()}';
    }
  }
}
