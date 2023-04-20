import 'package:ai_data/core/exceptions/custom_exceptions.dart';
import 'package:dio/dio.dart';

extension CheckStatus on Response {
  void checkStatusCode() {
    if (statusCode == null) return;
    if (statusCode == 401) {
      throw TokenExpiredException();
    }
    if (statusCode! >= 400 && statusCode! <= 499) {
      throw statusMessage != null
          ? BadRequestException(message: statusMessage!)
          : BadRequestException();
    } else if (statusCode! >= 500 && statusCode! <= 599) {
      throw ServerException();
    }
  }
}
