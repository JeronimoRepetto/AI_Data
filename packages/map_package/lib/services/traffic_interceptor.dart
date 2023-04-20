import 'package:dio/dio.dart';

class TrafficInterceptor extends Interceptor {
  final accessToken =
      "pk.eyJ1IjoianJlcGV0dG8iLCJhIjoiY2w4NmJpOG1wMHhyNzN2bGt3Y2p1dW96NSJ9.Tx-Yn9blPLwRD44b_1jiwg";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      "alternatives": true,
      "geometries": "polyline6",
      "overview": "simplified",
      "steps": false,
      "access_token": accessToken
    });
    super.onRequest(options, handler);
  }
}
