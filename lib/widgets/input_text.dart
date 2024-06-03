import 'package:flutter/material.dart';
import 'package:gooto/utils/MyStyle.dart';

class InputFormText extends StatelessWidget {
  var _passwordController;
  String empty;
  String hint;
  InputFormText(this._passwordController, this.empty, this.hint);
  String patttern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      textInputAction:
          hint == "كلمة السر" ? TextInputAction.done : TextInputAction.next,
      keyboardType: hint == "كلمة السر"
          ? TextInputType.visiblePassword
          : TextInputType.text,
      obscureText: hint == "كلمة السر" ? true : false,
      style: TextStyle(color: MyStyle.textgreycolor),
      controller: _passwordController,
      validator: (value) {
        if (hint == "الايميل") {
          if (value!.isEmpty) {
            return empty;
          } else {
            value = value.trim();
            if (!RegExp(patttern).hasMatch(value)) {
              return 'المرجوا ادخال ايميل حقيقي';
            } else
              return null;
          }
        } else {
          if (value != null && value.isEmpty) {
            return empty;
          }
          return null;
        }
      },
      decoration: MyStyle.inputregulare(hint),
    );
  }
}
