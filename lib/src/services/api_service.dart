import 'dart:convert';

import 'package:codelitt_calendar/src/core/logger.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:http/http.dart';
import 'package:oxidized/oxidized.dart';

/* 
For this file, representing the outmost layer in the data layer, 
some mocking will be necessary in order for the application to work, since there
is no real remote data source.

For this, the real code for the HTTP verbs implementation will be commented out so the mocking
can be done.

It is worth mentioning that by implementing Clean Architecture as it has been in this project,
adding a remote data source would be the only necessary change for the whole project to work with remote data.
*/

class ApiService {
  final Client _client;
  late AppLogger _logger;

  ApiService(this._client) {
    _logger = AppLoggerImpl();
  }

  static const String baseUrl = 'my_authority.com';

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
    // enforcing the "getReminders" always returns an empty array.
    final uri = buildUri(path, queryParams);
    _logger.d('GET @:\n$uri');
    return const Result.ok([]);

    // try {
    //   final response = await _client.get(uri, headers: baseHeaders);

    //   _logger.d('GET @:\n$uri');

    //   var decodedResponse =
    //       response.body.isNotEmpty ? json.decode(response.body) : '';

    //   if (isOk(response.statusCode)) {
    //     return Result.ok(decodedResponse);
    //   } else {
    //     return Result.err(AppError.fromJson(decodedResponse));
    //   }
    // } catch (e) {
    //   _logger.e('GET catch exception: ${e.toString()}');
    //   throw 'GET catch exception: ${e.toString()}';
    // }
  }

  Future<Result<dynamic, AppError>> post({
    required String path,
    required Map<String, dynamic> payload,
  }) async {
    // simulating the API creating a new reminder and adding an Id.
    final uri = buildUri(path);
    payload['id'] = '${DateTime.now().millisecondsSinceEpoch}';
    _logger.d('POST @:\n$uri');
    await Future.delayed(const Duration(milliseconds: 1500));
    return Result.ok(payload);

    // try {
    //   var response = await _client.post(
    //     uri,
    //     headers: baseHeaders,
    //     body: json.encode(payload),
    //   );

    //   _logger.d('POST @:\n$uri');

    //   var decodedResponse =
    //       response.body != '' ? json.decode(response.body) : '';
    //   if (isOk(response.statusCode)) {
    //     return Result.ok(decodedResponse);
    //   } else {
    //     return Result.err(AppError.fromJson(decodedResponse));
    //   }
    // } catch (e) {
    //   _logger.e('POST catch exception: ${e.toString()}');
    //   throw 'POST catch exception: ${e.toString()}';
    // }
  }

  Future<Result<dynamic, AppError>> delete({
    required String path,
  }) async {
    // simulating a success deletion.
    final uri = buildUri(path);
    _logger.d('DELETE @:\n$uri');
    await Future.delayed(const Duration(milliseconds: 1500));
    return const Result.ok(true);

    // try {
    //   var response = await _client.delete(uri, headers: baseHeaders);

    //   _logger.d('DELETE @:\n$uri');

    //   var decodedResponse =
    //       response.body != '' ? json.decode(response.body) : '';

    //   if (isOk(response.statusCode)) {
    //     return Result.ok(decodedResponse);
    //   } else {
    //     return Result.err(AppError.fromJson(decodedResponse));
    //   }
    // } catch (e) {
    //   _logger.e('DELETE catch exception: ${e.toString()}');
    //   throw 'DELETE catch exception: ${e.toString()}';
    // }
  }

  Future<Result<dynamic, AppError>> patch({
    required String path,
    Map<String, dynamic>? payload,
  }) async {
    // simulating a successful update.
    final uri = buildUri(path);
    _logger.d('PATCH @:\n$uri');
    await Future.delayed(const Duration(milliseconds: 1500));
    return const Result.ok(true);

    // try {
    //   var response = await _client.patch(
    //     uri,
    //     headers: baseHeaders,
    //     body: payload != null ? json.encode(payload) : null,
    //   );

    //   _logger.d('PATCH @:\n$uri');

    //   var decodedResponse =
    //       response.body != '' ? json.decode(response.body) : '';

    //   if (isOk(response.statusCode)) {
    //     return Result.ok(decodedResponse);
    //   } else {
    //     return Result.err(AppError.fromJson(decodedResponse));
    //   }
    // } catch (e) {
    //   _logger.e('PATCH catch exception: ${e.toString()}');
    //   throw 'PATCH catch exception: ${e.toString()}';
    // }
  }

  Future<Result<dynamic, AppError>> put({
    required String path,
    required Map<String, dynamic> payload,
  }) async {
    // Put is not used in the application, so we'll leave it as it is.

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
