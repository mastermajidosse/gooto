import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gooto/utils/MyStyle.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Marhaba extends StatelessWidget {
  const Marhaba({super.key});

  void _launchURL(_url) async {
    if (!await launchUrlString(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            " مرحبا بك ، ",
            style: MyStyle.dashTextStyle.copyWith(fontSize: 18),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8, left: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  _launchURL("https://www.tiktok.com/@ultras.ma_");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: Icon(
                    FontAwesomeIcons.tiktok,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              SizedBox(width: 8),
              InkWell(
                onTap: () async {
                  _launchURL("https://www.instagram.com/ultras.ma_");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              SizedBox(width: 8),
              InkWell(
                onTap: () async {
                  _launchURL("https://www.youtube.com/@ultras_ma");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: Icon(
                    FontAwesomeIcons.youtube,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              SizedBox(width: 8),
            ],
          ),
        ),
      ],
    );
  }
}
