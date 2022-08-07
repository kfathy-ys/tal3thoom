import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:queen/core.dart';

abstract class NetWork {
  static Dio get _dio {
    final _dio = Dio(
      BaseOptions(
        baseUrl: 'http://dev-lib.cpt-it.com/api/api/',
        contentType: 'application/json',
        headers: {
          'Content-Type': 'application/json',
          'lang': 'ar',
        },
        validateStatus: (_) => true,
        followRedirects: false,
      ),
    );
    if (kDebugMode) {
      _dio.interceptors
          .add(PrettyDioLogger(requestBody: true, requestHeader: true));
    }
    return _dio;
  }
  // Response _validate(Response res) {
  //   if (res.statusCode == 500) {
  //     throw LServerException.parse(res.data!);
  //   }
  //   else if (res.statusCode == 404) {
  //     throw LNotFoundException.parse(res.data!);
  //   }
  //   else if (res.statusCode == 422) {
  //     throw LValidationException(res.data!);
  //   }
  //   else if (res.data == null) {
  //     throw 'api returend null repsonse';
  //   }
  //   else if (res.statusCode == 403) {
  //     throw res.data['errors']['phone'][0];
  //   }
  //   return res;
  // }

  static Future<Response> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    return await _dio.get(
      '/$url',
      queryParameters: queryParams,
      options: Options(headers: {
        'Authorization': Prefs.getString(
          'token',
        ),
        ...?headers
      }),
    );
  }

  static Future<Response> delete(
    String url, {
    dynamic body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    return await _dio.delete(
      '/$url',
      data: body,
      queryParameters: queryParams,
      options: Options(headers: {
        'Authorization': Prefs.getString(
          'token',
        ),
        ...?headers
      }),
    );
  }

  // Future<Response> delete(
  //     String path, {
  //       dynamic body = const {},
  //       Map<String, dynamic> headers = const {},
  //       Map<String, dynamic> query = const {},
  //     }) async {
  //   final res = await dio.delete(
  //     path,
  //     data: body,
  //     queryParameters: query,
  //     options: Options(
  //       headers: {
  //         HttpHeaders.authorizationHeader: Auth.bearerToken,
  //         'accept-lang': Lang.current.languageCode,
  //         ...headers,
  //       },
  //     ),
  //   );
  //   return _validate(res);
  // }
  // Future<Response> get(
  //     String path, {
  //       Map<String, dynamic> headers = const {},
  //       Map<String, dynamic> query = const {},
  //       bool attachToken = true,
  //     }) async {
  //   final res = await _dio.get(
  //     path,
  //     queryParameters: query,
  //     options: Options(headers: {
  //      // if (attachToken) HttpHeaders.authorizationHeader: Auth.bearerToken,
  //      // 'accept-lang': Lang.current.languageCode,
  //       ...headers,
  //     }),
  //   );
  //   return _validate(res);
  // }

  static Future<Response> post(
    String url, {
    dynamic body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    return await _dio.post(
      '/$url',
      data: body,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
  }

  static Future<Response> put(
    String url, {
    dynamic body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    return await _dio.post(
      '/$url',
      data: body,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
  }
}
