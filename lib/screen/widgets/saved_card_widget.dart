import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

import '../../models/card_model.dart';
import '../../utils/mystyle.dart';

// class SavedCardWidget extends StatelessWidget {
//   const SavedCardWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(5),
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border(
//           top:
//               BorderSide(color: Colors.black, width: 1.0), // Top border
//           bottom: BorderSide(
//               color: Colors.black, width: 1.0), // Bottom border
//         ),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(25),
//                 child: Image.asset(
//                   'assets/images/img2.webp',
//                   width: 150,
//                   // height: 150,
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Container(
//                 width: 210,
//                 margin: EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Outer Hebrides',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: ScreenUtil().setSp(25),
//                         color: Colors.black87,
//                       ),
//                     ),
//                     Text(
//                       "Scattered along Scotland's west coast, this chain of isles is one of the country's most beautiful places to visit. ",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: ScreenUtil().setSp(13),
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

class SavedCardWidget extends StatelessWidget {
  final CardModule likedBlog;
  final Function()? onLike;
  const SavedCardWidget({
    super.key,
    required this.onLike,
    required this.likedBlog,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.black.withOpacity(0.2), width: 1.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            width: 100,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(likedBlog.img),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      likedBlog.place,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(20),
                        color: Color(0xFF464B84),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color:
                            likedBlog.isLiked == 1 ? Colors.red : Colors.grey,
                        size: 30,
                      ),
                      onPressed: onLike,
                    ),
                  ],
                ),
                // ReadMoreText(
                //   likedBlog.desc,
                //   trimMode: TrimMode.Line,
                //   // trimLines: 2,
                //   colorClickableText: MyStyle.primarycolo,
                //   trimCollapsedText: 'more',
                //   trimExpandedText: 'less',
                //   moreStyle: TextStyle(
                //     fontSize: 12,
                //     fontWeight: FontWeight.w600,
                //     color: MyStyle.primarycolo,
                //   ),
                // ),
                Text(
                  likedBlog.desc,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(13),
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
