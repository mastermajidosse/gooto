import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/auth/login_cubit.dart';
import 'package:gooto/screen/app_start_screen.dart';
import 'package:gooto/screen/auth/register_screen.dart';
import 'package:gooto/screen/bottom_tab.dart';
import 'package:gooto/utils/mystyle.dart';
import 'package:gooto/widgets/input_text.dart';
import 'package:gooto/widgets/primary_button.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(); //
  final _passwordController = TextEditingController();

//  "email":"senyou@gmail.com",
//     "password":"12341234"

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginError) {
              return Mystyle.err(ScaffoldMessenger.of(context).showSnackBar, state.message);
            } else if (state is LoginSuccess) {
              print("brace you gonna login");

              Navigator.pushReplacementNamed(context, AppStartScreen.routeName);
            }
          },
          builder: (context, state) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Center(
                child: Container(
                  width: 360.w,
                  padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'مرحبا بكم في تطبيق التراس',
                            style: Mystyle.titleTextStyle,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 60.w),
                          alignment: Alignment.centerRight,
                          child: Text(
                            'سجل الدخول لتتمكن من المشاركة في التطبيق \n',
                            style: TextStyle(
                              color: Mystyle.textgreycolor,
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(14),
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 40.w),
                              child: InputFormText(
                                _usernameController,
                                "ادخل الايميل",
                                "الايميل",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 22.w),
                              child: InputFormText(
                                _passwordController,
                                "ادخل كلمة السر",
                                "كلمة السر",
                              ),
                            ),
                          ]),
                        ),
                        PrimaryButton("دخول", state is LoginLoading, false, () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<LoginCubit>()
                                .login(context, _usernameController.text, _passwordController.text);
                          }
                          // context
                          //     .read<LoginCubit>()
                          //     .login(context, "senyoiu@gmail.com", "12341234");
                        }),
                        SizedBox(height: 10.w),
                        PrimaryButton("دخول بدون تسجيل", false, true, () {
                          Navigator.pushNamed(context, BottomTabBarr.routeName);
                        }),
                        Padding(
                          padding: EdgeInsets.only(top: 45.0),
                          child: Wrap(
                            children: [
                              Text(
                                'ليس لديك حساب ؟',
                                style: Mystyle.blackCatTextStyle,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                                },
                                borderRadius: BorderRadius.circular(4.0),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Text(
                                    'حساب جديد',
                                    style: Mystyle.buttTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _buildSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss)
      ..showSnackBar(snackBar);
  }
}
