import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/screen/auth/login_screen.dart';
import 'package:gooto/utils/MyStyle.dart';

class SignupProfileScreen extends StatefulWidget {
  static const routeName = 'profile';
  SignupProfileScreen(this.name);
  String name;
  @override
  _SignupProfileScreenState createState() => _SignupProfileScreenState();
}

class _SignupProfileScreenState extends State<SignupProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.name,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.person_add_outlined,
                size: 88,
              ),
              SizedBox(height: 6.w),
              Text("سجل حسابك هنا"),
              SizedBox(height: 25.w),
              Container(
                width: 250.w,
                height: 39.w,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: MyStyle.secondcolo,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(100.0),
                    // ),
                  ),
                  child: Text(
                    "تسجيل الدخول",
                    style: MyStyle.subtitleTextStyle.copyWith(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, LoginPage.routeName);
                  },
                ),
              ),
              SizedBox(height: 50.w),
            ],
          ),
        ));
  }
}
