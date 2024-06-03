class ApiException implements Exception {
  String? message;
  String? code;
  String? lang;

  ApiException({this.code, this.message, this.lang});

  @override
  String toString() {
    return message.toString();
  }
}

class BadRequestException extends ApiException {
  BadRequestException([message, code, lang])
      : super(message: message, code: code, lang: lang);
}

class InvalidInputException extends ApiException {
  InvalidInputException([message, code, lang])
      : super(message: message, code: code, lang: lang);
}
