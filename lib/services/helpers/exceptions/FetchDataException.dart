import 'ApiException.dart';

class FetchDataException extends ApiException {
  FetchDataException([message, code, lang])
      : super(message: message, code: code, lang: lang);
}