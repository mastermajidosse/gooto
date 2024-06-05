import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../models/card_model.dart';
import '../../utils/mystyle.dart';

class CustomCardTwo extends StatelessWidget {
  final CardModule card;
  final Function()? onTap;
  final Function()? likeTap;
  const CustomCardTwo(
      {super.key,
      required this.card,
      required this.onTap,
      required this.likeTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey
                  .withOpacity(0.2), // Adjust shadow color and opacity
              spreadRadius: 5, // Adjust shadow spread
              blurRadius: 7, // Adjust shadow blur
              offset: const Offset(0, 3), // Adjust shadow offset (x, y)
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Hero(
                  tag: '${card.id}',
                  child: Container(
                    height: 90,
                    width: 90,
                    margin: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(card.img),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.place,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 19,
                        ),
                      ),
                      Gap(7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/location.png',
                                height: 15,
                                color: Colors.grey,
                              ),
                              Gap(6),
                              Text(
                                card.place,
                                style: MyStyle.regular12TextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Gap(7),
                      Row(
                        children: [
                          Text(
                            "${card.price}\$",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Gap(8),
                          Text(
                            "/person",
                            style: MyStyle.regular12TextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: InkWell(
                onTap: likeTap,
                child: Container(
                  height: 37,
                  width: 37,
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F6F6),
                    shape: BoxShape.circle,
                  ),
                  // child: Icon(
                  //   size: 30,
                  //   Icons.favorite_outline_rounded,
                  // ),
                  child: card.isLiked == 1
                      ? Icon(
                          Icons.favorite,
                          color: MyStyle.reddcolor,
                        )
                      : Icon(
                          Icons.favorite_outline_rounded,
                          color: Color.fromARGB(255, 135, 121, 121),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
