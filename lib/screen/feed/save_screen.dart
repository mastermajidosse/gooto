import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gooto/utils/mystyle.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:readmore/readmore.dart';

import '../widgets/saved_card_widget.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});
  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  AudioPlayer audioPlayer = AudioPlayer(); // Create an AudioPlayer instance
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // width: 45,
                    // height: 45,
                    margin: EdgeInsets.all(8),
                    child: Text(
                      'Saved',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(30),
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/rin.png',
                            width: 24.0,
                            height: 24.0,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 4,
                        // bottom: 20,
                        right: 2,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyStyle.reddcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(10),
            Container(
              height: 45,
              width: 322,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(60)),
              child: TextFormField(
                onFieldSubmitted: (v) {
                  print(v);
                },
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const SearchScreen(),
                      //   ),
                      // );
                    },
                    child: Image.asset(
                      'assets/images/search.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(top: 10),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    borderSide: BorderSide(color: Colors.black38, width: 1),
                  ),
                  hintText: 'Search...',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Gap(30),
            Column(
              children: [
                Container(
                  height: 500,
                  child: ListView.builder(
                    itemBuilder: (ctx, idx) => SavedCardWidget(),
                    itemCount: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
