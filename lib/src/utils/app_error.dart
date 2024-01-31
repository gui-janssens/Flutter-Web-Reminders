class AppError {
  final String message;
  final AppErrorCode code;

  AppError({
    required this.message,
    required this.code,
  });

  factory AppError.fromJson(Map<String, dynamic> json) {
    final AppErrorCode code = AppErrorCode.fromString(json['errorCode']);
    return AppError(
      code: code,
      message: code.message,
    );
  }
}

enum AppErrorCode {
  timeOut('timeOut'),
  // ... other app errors that might come from the back-end
  unauthorized('unauthorized');

  final String code;

  const AppErrorCode(this.code);

  factory AppErrorCode.fromString(String code) {
    switch (code) {
      case 'timeOut':
        return AppErrorCode.timeOut;
      case 'unauthorized':
        return AppErrorCode.unauthorized;
      default:
        throw ArgumentError('Unknown AppErrorCode: $code');
    }
  }

  // this can later be improved to become an actual switch case, adding all sorts of messages
  String get message => 'An error occurred: $code';
}
