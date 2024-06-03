import 'package:flutter/material.dart';
import 'package:gooto/utils/mystyle.dart';

class OneCat extends StatelessWidget {
  String name;
  bool checked;
  OneCat(this.name, {this.checked = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        color: checked ? Colors.black : Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Text(
        name,
        style: checked ? Mystyle.playernameTextStyle : Mystyle.blacksmallTextStyle,
      ),
    );
    ;
  }
}
