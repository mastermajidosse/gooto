import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/video/video_cubit.dart';
import 'package:gooto/models/video_model.dart';
import 'package:gooto/utils/mystyle.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VideoDetails extends StatefulWidget {
  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<VideoCubit>(context).get5Videos();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(builder: (context, state) {
      if (state.loading == true) {
        return Center(child: Mystyle.loadingWidget());
      } else if (state.loading == false) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          primary: true,
          itemCount: state.videos!.length,
          itemBuilder: (BuildContext context, int index) {
            return OneVid(state.videos![index]);
          },
        );
      } else
        return Container();
    });
  }
}

class OneVid extends StatelessWidget {
  OneVid(this.posts);
  VideoModel posts;

  void _launchURL(_url) async {
    if (!await launchUrlString(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    final linkfin = posts.url.toString().replaceAll("https://youtu.be/", "");
    return Column(
      children: [
        InkWell(
          onTap: () async {
            _launchURL(posts.url.toString());
          },
          child: CachedNetworkImage(
            width: double.infinity,
            height: 200,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
            errorWidget: (context, url, error) => Container(
              width: double.infinity,
              height: ScreenUtil().setHeight(300),
              child: Icon(Icons.error),
            ),
            imageUrl: "https://img.youtube.com/vi/${linkfin}/0.jpg",
            imageBuilder: (context, imageProvider) => Container(
              padding: EdgeInsets.all(6),
              color: Colors.black,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            SizedBox(width: 16),
            CircleAvatar(
              backgroundColor: Colors.amber,
              foregroundImage: AssetImage("assets/icon.png"),
              // foregroundImage: NetworkImage(posts.imgurl.toString()),
            ),
            SizedBox(width: 16),
            Container(
              width: 300,
              child: Text(
                posts.name.toString(),
                style: Mystyle.blackCatTextStyle.copyWith(
                  height: 1.0,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
        Divider(),
        SizedBox(height: 12),
      ],
    );
  }
}
