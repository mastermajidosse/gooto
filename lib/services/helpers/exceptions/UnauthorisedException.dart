import 'ApiException.dart';

class UnauthorisedException extends ApiException {
  UnauthorisedException([message, code, lang])
      : super(message: message, code: code, lang: lang);
}