// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
// import 'package:gooto/models/blog_model.dart';
// import 'package:gooto/screen/feed/readmore_screen.dart';
// import 'package:gooto/utils/MyStyle.dart';

// class CardHome extends StatelessWidget {
//   int index;
//   List<BlogModel> posts;

//   CardHome(this.index, this.posts);

//   @override
//   Widget build(BuildContext context) {
//     if (posts.length == 0) return Container();

//     final post = posts[index];
//     //
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (_) => MoreScreen(post)));
//         },
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           width: double.infinity,
//           alignment: Alignment.center,
//           decoration: MyStyle.cardhome(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 8.h),
//               CachedNetworkImage(
//                 height: 120.w,
//                 width: double.infinity,
//                 placeholder: (context, url) => Center(
//                   child: CircularProgressIndicator(
//                     color: Colors.white,
//                   ),
//                 ),
//                 errorWidget: (context, url, error) => Container(
//                   width: double.infinity,
//                   height: ScreenUtil().setHeight(300),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: Colors.black54, width: 2),
//                     image: DecorationImage(
//                       image: NetworkImage(post.imgurl.toString()),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 imageUrl: post.imgurl.toString(),
//                 imageBuilder: (context, imageProvider) => Container(
//                   width: double.infinity,
//                   height: ScreenUtil().setHeight(300),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     image: DecorationImage(
//                       image: imageProvider,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 6.h),
//               Text(
//                 post.title.toString(),
//                 style: MyStyle.second16TextStyle,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               SizedBox(height: 6.h),
//               // Text(
//               //   PostModel().parseHtmlString(post.desc.toString()),
//               //   style: MyStyle.dash10TextStyle,
//               //   maxLines: 2,
//               //   overflow: TextOverflow.ellipsis,
//               // ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "قراءة المزيد",
//                     style: MyStyle.buttTextStyle,
//                   ),
//                   Text(
//                     // dayleft(post.creationDate!),
//                     "",
//                     style: MyStyle.sgreyTextStyle,
//                   )
//                 ],
//               ),
//               SizedBox(height: 8.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   String dayleft(date) {
//     return DateFormat.yMMMM().format(DateTime.parse(date));
//   }
// }
