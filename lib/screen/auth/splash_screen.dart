import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:internet_connection_checker/internet_connection_checker/art';
import 'package:gooto/bloc/feed/feed_cubit.dart';
import 'package:gooto/screen/bottom_tab.dart';
import 'package:gooto/utils/MyStyle.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'Splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gettt(context);

    super.initState();
  }

  gettt(context) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      BlocProvider.of<FeedCubit>(context).topPosts().then((value) {
        print("delayed,,,,,,");
        Navigator.pushReplacementNamed(context, BottomTabBarr.routeName);
      }).timeout((Duration(seconds: 10)), onTimeout: () {
        print("delayed,,,,,,");
        Navigator.pushReplacementNamed(context, BottomTabBarr.routeName);
      });
    } else {
      print('No internet :( Reason:');
      print(InternetConnectionChecker().connectionStatus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage("assets/icon.png"),
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
              MyStyle.loadingWidget3(colo: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
