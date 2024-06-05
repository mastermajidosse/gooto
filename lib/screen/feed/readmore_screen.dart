import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/models/card.dart';
import 'package:gooto/models/post_model.dart';
import 'package:gooto/utils/mystyle.dart';
import 'package:readmore/readmore.dart';
import 'package:audioplayers/audioplayers.dart';

import '../widgets/audio_player.dart'; // Import audioplayers package

class MoreScreen extends StatefulWidget {
  final CardModule post;
  const MoreScreen(this.post, {super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  AudioPlayer audioPlayer = AudioPlayer(); // Create an AudioPlayer instance
  String audioUrl =
      "https://example.com/audio.mp3"; // Replace with your audio URL
  String overviewText =
      "Scattered along Scotland's west coast, this chain of isles is one of the country's most beautiful places to visit. Think shimmering white-sand beaches, sparkling seas and crowd-free hinterlands – it's one of the UK's last remaining secrets, and for good reason.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Stack(
        children: [
          Hero(
            // Wrap image with Hero widget for potential future transitions
            tag: "${widget.post.id}", // Set a unique tag
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                widget.post.img,
                fit: BoxFit.cover, // Adjust fit as needed (cover, contain)
                width: double.infinity,
                height: 300.0, // Set a fixed height for the image
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
