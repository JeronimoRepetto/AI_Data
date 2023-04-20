import 'package:ai_data/core/exceptions/base_exceptions.dart';
import 'package:ai_data/features/home/data/model/data_search_model.dart';
import 'package:dartz/dartz.dart';

abstract class GptRepository {
  Future<Either<BaseException, List<DataSearch>>> getRanking(String prompt);
}
