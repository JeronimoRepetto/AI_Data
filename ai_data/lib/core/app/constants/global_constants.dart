class Constants {
  //HTTP
  static const Duration defaultTimeOut = Duration(seconds: 1);
  static const Duration timeToCache = Duration(days: 1);
  static const hitCacheOnError = [401, 404, 500];
  static const int totalRetry = 3;
  static const int secondsTimeOut = 1;
  static const Duration retryDelay = Duration(
    seconds: secondsTimeOut + secondsTimeOut,
  );

  //Blur
  static const double blurInObject = 20;
  static const double lowBlur = 2;

  static const List<int> rankingNum = [3, 5, 10];
}
