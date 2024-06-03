import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/bproviders.dart';
import 'package:gooto/utils/mystyle.dart';

import 'package:flutter/services.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  HttpOverrides.global = new MyHttpOverrides();

  runApp(MyApp("staging"));
}

class MyApp extends StatelessWidget {
  const MyApp(this.flavor, {super.key});
  final String flavor;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: bproviders,
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, _) {
          return MaterialApp(
            title: 'ultras',
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primaryColor: Mystyle.primarycolo,
            ),
            debugShowCheckedModeBanner: false,
            // home: TeamScreen(TeamModel(flagname: "", logo: "", name: "far", photos: [], songs: [])),
          );
        },
      ),
    );
  }
}
