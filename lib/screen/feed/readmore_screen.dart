import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gooto/models/card_model.dart';
import 'package:gooto/utils/mystyle.dart';
import 'package:readmore/readmore.dart';
import '../widgets/audio_player.dart';

class MoreScreen extends StatefulWidget {
  final CardModule post;
  const MoreScreen(this.post, {super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Stack(
        children: [
          // InkWell(
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          //   child: Container(
          //     width: 45,
          //     height: 45,
          //     decoration: const BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: Colors.white,
          //     ),
          //     child: Center(
          //       child: Image.asset(
          //         'assets/images/back_btn.png',
          //         width: 24.0,
          //         height: 24.0,
          //       ),
          //     ),
          //   ),
          // ),
          Hero(
            tag: "imageHero${widget.post.id}",
            child: ClipRRect(
              child: Image.network(
                widget.post.img,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300.0,
              ),
            ),
          ),
          Positioned(
            top: 20.0,
            left: 10.0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 45,
                height: 45,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/back_btn.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 500.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Container(
                margin: EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.post.place,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            '\$${widget.post.price}',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.blue,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Morocco", style: MyStyle.blacksmallTextStyle),
                          Text('/person', style: MyStyle.blacksmallTextStyle),
                        ],
                      ),
                      Gap(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: MyStyle.textgreycolor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Icon(Icons.access_time_rounded),
                                Text(
                                  '3Days',
                                  style: MyStyle.blacksmallTextStyle,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: MyStyle.textgreycolor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_border_outlined,
                                ),
                                Text(
                                  '4.5 Ratings',
                                  style: MyStyle.blacksmallTextStyle,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: MyStyle.textgreycolor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              '/person',
                              style: MyStyle.blacksmallTextStyle,
                            ),
                          ),
                        ],
                      ),
                      Gap(30),
                      Row(
                        children: [
                          Text(
                            'Overviews',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Gap(20),
                      ReadMoreText(
                        widget.post.desc,
                        trimMode: TrimMode.Line,
                        trimLines: 5,
                        colorClickableText: MyStyle.primarycolo,
                        trimCollapsedText: 'Read more',
                        trimExpandedText: 'Read less',
                        moreStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: MyStyle.primarycolo,
                        ),
                      ),
                      Gap(30),
                      AudioPlayerWidget(
                        audioUrl: 'audio/test.mp3',
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
