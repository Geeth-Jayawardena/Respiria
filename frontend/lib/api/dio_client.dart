import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:resperia/constants.dart';
import 'package:resperia/utils/exceptions/auth_exception.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  Future<Dio> initializeWithoutKey() async {
    return _initialize();
  }

  Future<Dio> initializeWithoutKeyForm() async {
    return _initialize(isForm: true);
  }

  Future<Dio> initializeWithKey({int connectTimeout = 30000}) async {
    const _storage = FlutterSecureStorage();

    bool isAuthKey = await _storage.containsKey(key: 'auth_key');

    if (!isAuthKey) throw AuthException(message: 'Auth key is not initialized');

    String? authKey = await _storage.read(key: 'auth_key');

    return _initialize(
      key: authKey,
      connectTimeout: connectTimeout,
    );
  }

  Future<Dio> initializeWithKeyForm() async {
    const _storage = FlutterSecureStorage();

    bool isAuthKey = await _storage.containsKey(key: 'auth_key');

    if (!isAuthKey) throw AuthException(message: 'Auth key is not initialized');

    String? authKey = await _storage.read(key: 'auth_key');

    return _initialize(key: authKey, isForm: true);
  }

  Future<Dio> _initialize({
    String? key,
    bool isForm = false,
    int connectTimeout = 30000,
  }) async {
    BaseOptions options;

    if (isForm) {
      var headers = {
        'Content-Type': 'multipart/form-data',
      };
      if (key != null) {
        headers['Authorization'] = 'Bearer $key';
      }

      options = BaseOptions(
        baseUrl: Constants.API_URL,
        headers: headers,
        connectTimeout: Duration(milliseconds: connectTimeout),
      );
    } else {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      if (key != null) {
        headers['Authorization'] = 'Bearer $key';
      }

      options = BaseOptions(
        baseUrl: Constants.API_URL,
        headers: headers,
        connectTimeout: Duration(milliseconds: connectTimeout),
      );
    }

    Dio _dio = Dio(options);

    if (!kReleaseMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }

    return _dio;
  }
}
