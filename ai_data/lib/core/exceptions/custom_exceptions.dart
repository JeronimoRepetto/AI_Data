import 'package:ai_data/core/exceptions/base_exceptions.dart';

class BadRequestException extends BaseException {
  BadRequestException({
    super.message = 'error.bad_request',
    super.stackTrace,
  });
}

class GeneralException extends BaseException {
  GeneralException(
    response, {
    super.message = 'error.error',
    super.stackTrace,
  });
}

class ServerException extends BaseException {
  ServerException({
    super.message = 'error.api500',
    super.stackTrace,
  });
}

class SignInException extends BaseException {
  SignInException({
    super.message = 'errors.sign_in_exception',
    super.stackTrace,
  });
}

class DeleteAccountException extends BaseException {
  DeleteAccountException({
    super.message = 'errors.deleteAccount',
    super.stackTrace,
  });
}

class SignUpException extends BaseException {
  SignUpException({
    super.message = 'errors.emailAlreadyExist',
    super.stackTrace,
  });
}

class EmailException extends BaseException {
  EmailException({
    super.message = 'errors.emailInvalid',
    super.stackTrace,
  });
}

class UserNotFoundException extends BaseException {
  UserNotFoundException({
    super.message = 'error.api409',
    super.stackTrace,
  });
}

class CameraException extends BaseException {
  CameraException({
    super.message = 'error.camera',
    super.stackTrace,
  });
}

class TextRecognitionException extends BaseException {
  TextRecognitionException({
    super.message = 'error.text_recognition',
    super.stackTrace,
  });
}

class TokenExpiredException extends BaseException {
  TokenExpiredException({
    super.message = 'errors.401',
    super.stackTrace,
  });
}

class SearchAddressException extends BaseException {
  SearchAddressException({
    super.message = 'errors.search_address_exception',
    super.stackTrace,
  });
}

class ActivityProviderNonSupportedException extends BaseException {
  ActivityProviderNonSupportedException({
    super.message = 'error.activityProviderNonSupported',
    super.stackTrace,
  });
}

class UserCancelIntegrationException extends BaseException {
  UserCancelIntegrationException({super.message = 'error.cancel_integration'});
}

class UserInternetException extends BaseException {
  UserInternetException({
    super.message = 'Al parecer no tienes conexion a internet',
  });
}

class SaveTempFileException extends BaseException {
  SaveTempFileException({
    super.message = 'Ocurrio un error guardando el documento',
  });
}

class UpdateUserException extends BaseException {
  UpdateUserException({
    super.message = 'El usuario ya existe',
  });
}

class UnknowException extends BaseException {
  UnknowException({
    super.message = 'Ocurrio un error insesperado',
  });
}
