import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:gooto/utils/mystyle.dart';

class ImageFrameDisplay extends StatefulWidget {
  String? image;
  ImageFrameDisplay({this.image});
  @override
  _ImageFrameDisplayState createState() => _ImageFrameDisplayState();
}

class _ImageFrameDisplayState extends State<ImageFrameDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Mystyle.textlinkcolor,
          width: 1,
        ),
      ),
      height: ScreenUtil().setHeight(130),
      width: ScreenUtil().setHeight(130),
      child: widget.image == null
          ? Text(
              'No Image',
              style: TextStyle(
                color: Mystyle.textlinkcolor,
                height: 1.6,
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Mystyle.textlinkcolor,
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(widget.image!),
                    fit: BoxFit.cover,
                  )),
            ),
    );
  }
}
