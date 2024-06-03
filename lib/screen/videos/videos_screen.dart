import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gooto/bloc/feed/feed_cubit.dart';
import 'package:gooto/screen/videos/video_more.dart';
import 'package:gooto/utils/MyStyle.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60.h),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF008aae),
            ),
            height: 60.h,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "فيديوهات",
              style: MyStyle.dashTextStyle.copyWith(
                fontSize: ScreenUtil().setSp(18),
                fontFamily: "arial",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: RefreshIndicator(
              onRefresh: () {
                return Future.wait(
                    [BlocProvider.of<FeedCubit>(context).topPosts()]);
              },
              child:
                  // BlocBuilder<FeedCubit, FeedState>(
                  //   builder: (context, state) {// return
                  ListView(
                children: [
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "فيديوات هدا الأسبوع",
                      style: MyStyle.subtitleTextStyle,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 16),
                  //   child: Text(
                  //     "المغرب",
                  //     style: MyStyle.dash13TextStyle,
                  //   ),
                  // ),
                  VideoDetails(),
                  SizedBox(height: 16),
                ],
              )),
        ),
      ),
    );
  }
}
