import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/bproviders.dart';
import 'package:gooto/utils/MyStyle.dart';
import 'bloc/card_cubit/blog_cubit.dart';
import 'bloc/card_cubit/blog_state.dart';
import 'screen/feed/home_screen.dart';
import 'screen/feed/readmore_screen.dart';
import 'screen/feed/save_screen.dart';
import 'utils/route_genetator.dart' as router;
// import 'package:gooto/screen/auth/login_screen.dart';

class MyApp extends StatelessWidget {
  // final CardCubit cardCubit;
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
              primaryColor: MyStyle.primarycolo,
            ),
            debugShowCheckedModeBanner: false,
            // onGenerateRoute: router.RoutGenerator.generateRout,
            // initialRoute: router.initialRoute,
            // home: LoginPage(),
            // home: HomeScreen(),
            // home: MoreScreen(BlogModel()),
            home: SaveScreen(),
          );
        },
      ),
    );
  }
}
