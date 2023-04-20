import 'package:ai_data/core/exceptions/base_exceptions.dart';
import 'package:ai_data/features/home/data/dto/response_gpt_dto.dart';
import 'package:dartz/dartz.dart';

abstract class GptRepository {
  Future<Either<BaseException, ResponseGptDTO>> getRanking(String prompt);
}
