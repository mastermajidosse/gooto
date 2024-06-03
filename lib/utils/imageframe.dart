import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:gooto/utils/MyStyle.dart';

class ImageFrame extends StatefulWidget {
  File? image;
  ImageFrame({this.image});
  @override
  _ImageFrameState createState() => _ImageFrameState();
}

class _ImageFrameState extends State<ImageFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: MyStyle.textlinkcolor,
          width: 1,
        ),
      ),
      height: ScreenUtil().setHeight(135),
      width: ScreenUtil().setHeight(135),
      child: widget.image == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.asset(
                //   "assets/Icons/cloud-computing.svg",
                //   height: ScreenUtil().setHeight(57),
                //   color: MyStyle.textlinkcolor
                //       .withOpacity(.3), // Color(0xFFe3f9ff),
                // ),
                SizedBox(height: ScreenUtil().setHeight(12)),
                Text.rich(
                  TextSpan(
                    style: MyStyle.regularTextStyle.copyWith(
                      fontSize: ScreenUtil().setSp(10),
                    ),
                    children: [
                      TextSpan(
                        text: 'Drop Files to upload \nOr ',
                      ),
                      TextSpan(
                        text: 'Browse',
                        style: TextStyle(
                          color: MyStyle.textlinkcolor,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: MyStyle.textlinkcolor,
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: FileImage(
                      widget.image!,
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
    );
  }
}
