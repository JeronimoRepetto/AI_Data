import 'dart:developer';

import 'package:dio/dio.dart';

class BaseException implements Exception {
  final String message;
  BaseException({
    required this.message,
    dynamic stackTrace,
  }) {
    log('Error: $message \n StackTrace: $stackTrace');
  }
  void call() => toString();
  @override
  String toString() {
    return message;
  }
}
