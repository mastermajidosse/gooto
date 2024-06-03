import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooto/bloc/add/add_cubit.dart';
import 'package:gooto/bloc/auth/auth_cubit.dart';
import 'package:gooto/bloc/auth/login_cubit.dart';
import 'package:gooto/bloc/auth/signup_cubit.dart';
import 'package:gooto/bloc/blog/blog_cubit.dart';
import 'package:gooto/bloc/feed/feed_cubit.dart';
import 'package:gooto/bloc/profile/profile_cubit.dart';
import 'package:gooto/bloc/store/store_cubit.dart';
import 'package:gooto/bloc/video/video_cubit.dart';

List<BlocProvider> bproviders = [
  BlocProvider<AuthCubit>(
    create: (BuildContext context) => AuthCubit(),
  ),
  // BlocProvider<BlogCubit>(
  //   create: (BuildContext context) => BlogCubit()..initBlog(),
  // ),
  BlocProvider<LoginCubit>(
    create: (BuildContext context) => LoginCubit(),
  ),
  BlocProvider<SignupCubit>(
    create: (BuildContext context) => SignupCubit(),
  ),
  BlocProvider<ProfileCubit>(
    create: (BuildContext context) => ProfileCubit(), //..profile(),
  ),
  BlocProvider<FeedCubit>(
    create: (BuildContext context) => FeedCubit(),
  ),
  BlocProvider<AddCubit>(
    create: (BuildContext context) => AddCubit(),
  ),
  BlocProvider<StoreCubit>(
    create: (BuildContext context) => StoreCubit(),
  ),
  BlocProvider<BlogCubit>(
    create: (BuildContext context) => BlogCubit(),
  ),
  BlocProvider<VideoCubit>(
    create: (BuildContext context) => VideoCubit(),
  ),
];
