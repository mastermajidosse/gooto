// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gooto/models/blog_model.dart';
// import 'package:gooto/screen/feed/readmore_screen.dart';

// class CardSearch extends StatelessWidget {
//   int index;
//   BlogModel post;

//   CardSearch(this.index, this.post);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => MoreScreen(post),
//           ),
//         );
//       },
//       child: Container(
//         width: double.infinity,
//         child: CachedNetworkImage(
//           placeholder: (context, url) => Center(
//             child: CircularProgressIndicator(
//               color: Colors.white,
//             ),
//           ),
//           errorWidget: (context, url, error) => Center(
//             child: Icon(Icons.image_not_supported_sharp, size: 50.sp),
//           ),
//           imageUrl: post.imgurl.toString(),
//           imageBuilder: (context, imageProvider) => Container(
//             alignment: Alignment.bottomCenter,
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey[300]!,
//                   spreadRadius: 0,
//                   blurRadius: 10,
//                   offset: Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//               image: DecorationImage(
//                 image: imageProvider,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Container(
//               alignment: Alignment.bottomCenter,
//               height: 100.w,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                   colors: [
//                     Colors.black,
//                     Colors.black.withOpacity(.3),
//                     Colors.black.withOpacity(.1),
//                     Colors.transparent,
//                   ],
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   post.title.toString(),
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: ScreenUtil().setSp(18),
//                     color: Colors.white,
//                     height: 1,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
