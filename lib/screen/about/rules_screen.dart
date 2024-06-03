import 'package:flutter/material.dart';
import 'package:gooto/utils/MyStyle.dart';
import 'package:gooto/utils/step.dart';

class RulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyStyle.bgcolor,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "رؤية ".toUpperCase(),
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
                  ),
                  Directionality(
                      textDirection: TextDirection.ltr, child: BackButton()),
                ],
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "loream ipsum",
                ),
              ),
              SizedBox(height: 20.0),
              BuildStep(
                leadingTitle: "01",
                title: "",
                content: step1,
              ),
              SizedBox(height: 30.0),
              BuildStep(
                leadingTitle: "02",
                title: "",
                content: step2,
              ),
              SizedBox(height: 30.0),
              BuildStep(
                leadingTitle: "03",
                title: "",
                content: step3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String step1 = "  ، "
      " ";

  String step2 = "";
  //
  String step3 = "";
}
