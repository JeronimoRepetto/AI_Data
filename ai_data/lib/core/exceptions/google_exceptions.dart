class LogInWithGoogleFailure implements Exception {
  /// {@macro log_in_with_google_failure}
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'errors.firebase.accountExitsWithDifferentCredential',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'errors.firebase.invalidCredential',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'errors.firebase.errorOperationNotAllowed',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'errors.firebase.errorUserDisabled',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'errors.firebase.errorUserNotFount',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'errors.firebase.errorWrongPassword',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'errors.firebase.invalidVerificationCode',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'errors.firebase.invalidVerificationId',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }

  /// The associated error message.
  final String message;
}
