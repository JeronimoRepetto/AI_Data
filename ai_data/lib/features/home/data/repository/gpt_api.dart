import 'dart:convert';

import 'package:ai_data/core/app/constants/endpoints.dart';
import 'package:ai_data/core/app/http_service/http_service.dart';
import 'package:ai_data/core/exceptions/middleware.dart';
import 'package:ai_data/features/home/data/model/data_search_model.dart';
import 'package:ai_data/core/exceptions/base_exceptions.dart';
import 'package:ai_data/features/home/data/repository/gpt_repository.dart';
import 'package:dartz/dartz.dart';

class GptApi extends GptRepository {
  final HttpService _httpService;
  GptApi({required HttpService httpService}) : _httpService = httpService;
  @override
  Future<Either<BaseException, List<DataSearch>>> getRanking(
      String prompt) async {
    try {
      final bodyRequest = {
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": prompt}
        ],
        "max_tokens": 4000,
        "n": 1,
        "stop": null,
        "temperature": 1.0,
        "top_p": 1.0,
      };
      final resp = await _httpService.post(
        endpoint: Endpoints.ranking,
        body: bodyRequest,
      );
      resp.checkStatusCode();
      var bodyResponse = jsonDecode(resp.data);
      List<DataSearch> result = [];
      return Right(result);
    } catch (e) {
      return Left(BaseException(message: e.toString()));
    }
  }
}
