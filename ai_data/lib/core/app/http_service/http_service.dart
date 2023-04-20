import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:ai_data/core/app/constants/global_constants.dart';
import 'package:ai_data/core/app/http_service/config/config_api.dart';
import 'package:ai_data/core/app/http_service/helper.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

class HttpService {
  HttpService({
    ConfigApi? configApi,
    required this.getBaseUrl,
  }) : _configApi = configApi ?? ConfigApi();

  final Dio _client = Dio(BaseOptions(responseType: ResponseType.plain));
  final ConfigApi _configApi;
  final String Function() getBaseUrl;
  final evaluator = DefaultRetryEvaluator(defaultRetryableStatuses);
  initInteceptors() {
    _client.options.connectTimeout = Constants.defaultTimeOut;
    _client.interceptors.addAll([
      DioCacheInterceptor(
        options: CacheOptions(
          store: HiveCacheStore(AppPathProvider.path),
          policy: CachePolicy.refreshForceCache,
          maxStale: Constants.timeToCache,
          hitCacheOnErrorExcept: Constants.hitCacheOnError,
          allowPostMethod: false,
          priority: CachePriority.high,
        ),
      ),
      RetryInterceptor(
        dio: _client,
        logPrint: log,
        retryDelays: _totalRetryDuration(),
        retries: Constants.totalRetry,
        retryEvaluator: evaluator.evaluate,
      ),
    ]);

    (_client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  List<Duration> _totalRetryDuration() {
    List<Duration> totalDurationRetry = [];
    for (int i = 0; i < Constants.totalRetry; i++) {
      totalDurationRetry.add(Constants.retryDelay);
    }
    return totalDurationRetry;
  }

  Future<Response> put({
    required String endpoint,
    Map<String, String>? headers,
    String? differentBaseUrl,
    String body = '',
  }) async {
    return await _client.put(
      (differentBaseUrl ?? (getBaseUrl())) + endpoint,
      data: body,
      options: Options(
        headers: headers ?? await _configApi.headers(),
      ),
    );
  }

  Future<Response> get({
    required String endpoint,
    Map<String, String>? headers,
    Map<String, dynamic>? arguments,
    String v = '',
    String? differentBaseUrl,
  }) async {
    String uri = (differentBaseUrl ?? (getBaseUrl())) + endpoint;
    return await _client.get(
      uri,
      queryParameters: arguments,
      options: Options(
        headers: headers ?? await _configApi.headers(),
      ),
    );
  }

  Future<Response> post({
    required String endpoint,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    String? differentBaseUrl,
  }) async {
    return await _client.post(
      (differentBaseUrl ?? (getBaseUrl())) + endpoint,
      options: Options(
        headers: headers ?? await _configApi.headers(),
      ),
      data: (body != null) ? jsonEncode(body) : null,
    );
  }

  Future<Response> patch({
    required String endpoint,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    String? differentBaseUrl,
  }) async {
    return await _client.patch(
      (differentBaseUrl ?? (getBaseUrl())) + endpoint,
      options: Options(
        headers: headers ?? await _configApi.headers(),
      ),
      data: (body != null) ? jsonEncode(body) : null,
    );
  }

  Future<Response> delete({
    required String endpoint,
    Map<String, String>? headers,
    Map<String, dynamic>? arguments,
    String? differentBaseUrl,
  }) async {
    return await _client.delete(
      (differentBaseUrl ?? (getBaseUrl())) + endpoint,
      queryParameters: arguments,
      options: Options(
        headers: headers ?? await _configApi.headers(),
      ),
    );
  }
}
