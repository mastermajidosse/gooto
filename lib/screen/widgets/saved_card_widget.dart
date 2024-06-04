import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  const SavedCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.black, width: 1.0), // Top border
          bottom: BorderSide(color: Colors.black, width: 1.0), // Bottom border
        ),
      ),
      child: Stack(
        // Use Stack to position the favorite button on top
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      'assets/images/img2.webp',
                      width: 150,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 210,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Outer Hebrides',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(25),
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "Scattered along Scotland's west coast, this chain of isles is one of the country's most beautiful places to visit. ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(13),
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          // Favorite Button positioned at top right
          Positioned(
            top: 0.0, // Adjust top padding as needed
            right: -10.0, // Adjust right padding as needed
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red, // Favorite icon color
                size: 35,
              ),
              onPressed: () {
                // Implement your favorite button functionality here
                // (e.g., toggle favorite state, update data)
                print('Favorite button pressed!');
              },
            ),
          ),
        ],
      ),
    );
  }
}
