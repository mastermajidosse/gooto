import 'ApiException.dart';

class AccountWithDiffrentCredential extends ApiException {
  AccountWithDiffrentCredential([message, code, lang])
      : super(message: message, code: code, lang: lang);

}
