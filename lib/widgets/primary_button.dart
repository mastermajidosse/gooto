import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/utils/mystyle.dart';

class PrimaryButton extends StatelessWidget {
  bool mybool;
  Function myfunction;
  String texts;
  bool white;

  PrimaryButton(this.texts, this.mybool, this.white, this.myfunction);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: white ? 8.w : 45.w),
      child: Container(
        width: double.infinity,
        child: mybool
            ? Mystyle.loadingWidget()
            : TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: white ? Colors.white : Mystyle.primarycolo,
                  padding: EdgeInsets.only(top: 6.w, bottom: 6.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
                child: Text(
                  texts,
                  style: white ? Mystyle.blackCatTextStyle : Mystyle.buttwhtieTextStylereal,
                ),
                onPressed: () {
                  myfunction();
                },
              ),
      ),
    );
  }
}
