import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/utils/mystyle.dart';

class CardHomeSaved extends StatelessWidget {
  int index;
  List<BlogModel> saveposts;

  CardHomeSaved(this.index, this.saveposts);

  @override
  Widget build(BuildContext context) {
    final post = saveposts[index];
    //
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: InkWell(
        onTap: () {
          // BlocProvider.of<FeedCubit>(context).getpost(post.title).then((value) {
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (_) => MoreScreen(value)));
          // });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          alignment: Alignment.center,
          decoration: Mystyle.cardhome(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              Container(
                height: 120.w,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      post.imgurl!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                post.title.toString(),
                style: Mystyle.second20TextStyle,
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}
