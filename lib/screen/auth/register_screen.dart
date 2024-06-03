import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/auth/auth_cubit.dart';
import 'package:gooto/bloc/auth/signup_cubit.dart';
import 'package:gooto/models/user_model.dart';
import 'package:gooto/screen/app_start_screen.dart';
import 'package:gooto/screen/auth/login_screen.dart';
import 'package:gooto/utils/mystyle.dart';
import 'package:gooto/widgets/primary_button.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  final email = TextEditingController();

  final username = TextEditingController();
  final surname = TextEditingController();

  final pass = TextEditingController();

  final country = TextEditingController();

  List countries = ['Morocco'];

  String count = "Morocco";

  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }

  String patttern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupError) {
            return Mystyle.err(ScaffoldMessenger.of(context).showSnackBar, state.message);
          } else if (state is SignupSuccess) {
            print("brace you gonna login");
            BlocProvider.of<AuthCubit>(context)..checkAuth(context);

            Navigator.pushReplacementNamed(context, AppStartScreen.routeName);
            // Phoenix.rebirth(context);
          }
        },
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Center(
              child: Container(
                width: 300.w,
                height: double.infinity,
                alignment: Alignment.center,
                child: ListView(
                  children: [
                    SizedBox(height: 50.h),
                    Container(
                      height: 130.w,
                      width: 130.w,
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //     image: AssetImage("assets/icon.png"),
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      child: Image(image: AssetImage("assets/icon.png")),
                    ),
                    Center(
                      child: Text(
                        'تسجيل حساب جديد',
                        style: Mystyle.dashTextStyle,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 50.w),
                            child: TextFormField(
                              cursorColor: Colors.white,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.visiblePassword,
                              style: TextStyle(color: Colors.black54),
                              controller: username,
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return 'ادخل اسمك';
                                }
                                return null;
                              },
                              decoration: Mystyle.inputregulare("الاسم"),
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(top: 20.w),
                          //   child: TextFormField(
                          //     cursorColor: Colors.white,
                          //     textInputAction: TextInputAction.next,
                          //     keyboardType: TextInputType.visiblePassword,
                          //     style: TextStyle(color: Colors.black54),
                          //     controller: surname,
                          //     validator: (value) {
                          //       if (value != null && value.isEmpty) {
                          //         return 'ادخل لقبك';
                          //       }
                          //       return null;
                          //     },
                          //     decoration: Mystyle.inputregulare("اللقب"),
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: TextFormField(
                              cursorColor: Colors.blueGrey,
                              controller: email,
                              decoration: Mystyle.inputregulare('الايميل'),
                              style: TextStyle(color: Colors.black54),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'ادخل الايميل';
                                } else {
                                  value = value.trim();
                                  print(value);
                                  if (!RegExp(patttern).hasMatch(value)) {
                                    return 'المرجوا ادخال ايميل حقيقي';
                                  } else
                                    return null;
                                }
                              },
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: TextFormField(
                              cursorColor: Colors.white,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !_passwordVisible,
                              style: TextStyle(color: Colors.black54),
                              controller: pass,
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return 'ادخل كلمة السر';
                                }
                                return null;
                              },
                              decoration: Mystyle.inputregulare("كلمة السر").copyWith(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                    color: _passwordVisible ? Colors.black : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    PrimaryButton("سجل الحساب", state is SignupLoading?, false, () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (_formKey.currentState!.validate()) {
                        UserModel newUserModel = UserModel(
                          email: email.text,
                          password: pass.text,
                          firstname: username.text,
                        );
                        context.read<SignupCubit>().registerNew(newUserModel, context);
                      }
                    }),
                    SizedBox(height: 20.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'لديك حساب مسبقا',
                          style: Mystyle.regulargreyTextStyle,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, LoginPage.routeName);
                          },
                          borderRadius: BorderRadius.circular(4.0),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              'سجل دخولك',
                              style: Mystyle.buttTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 200.h)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
