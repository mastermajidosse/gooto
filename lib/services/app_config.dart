class AppConfig {
  static const String defaultSmile =
      "https://firebasestorage.googleapis.com/v0/b/gladly-app.appspot.com/o/imagetoShuffle%2F6.jpg?alt=media&token=a9a56638-af38-445f-ad0c-598bbd8c0ac1";
  // static const String baseUrllocal = '10.0.2.2:5000'; //
  // static const String baseUrllocal = 'localhost:5000'; //
  static const String baseUrl = '';
  static const String path = 'api';
  static const String appName = 'Gooto';
  static const int appVersionCode = 1;
  static bool debugMode = false;
  static bool adsMode = false;
  static Environment env = Environment.DEV;
}



enum Environment { DEV, PROD, STAG }
