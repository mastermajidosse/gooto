import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gooto/services/app_config.dart';
import 'bloc/card_cubit/blog_cubit.dart';
import 'main.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final cardCubit = CardCubit();
  // await cardCubit.openDb();
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  AppConfig.env = Environment.DEV;
  runApp(MyApp("dev"));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
