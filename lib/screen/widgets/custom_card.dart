import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../models/card.dart';
import '../../utils/mystyle.dart';

class CustomCard extends StatelessWidget {
  final CardModule card;
  final Function()? onTap;
  const CustomCard({super.key, required this.card, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
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
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: '${card.id}',
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(card.img),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Positioned(
                  right: 17,
                  top: 17,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 37,
                      width: 37,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        shape: BoxShape.circle,
                      ),
                      child: card.isLiked
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
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  card.place,
                  style: MyStyle.buttwhtieTextStyle,
                ),
                Gap(50),
                Text(
                  "\$${card.price}",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(16),
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/location.png',
                        color: Colors.grey,
                        height: 14,
                      ),
                      Gap(6),
                      Text(
                        "Morocco",
                        style: MyStyle.regular12TextStyle,
                      ),
                    ],
                  ),
                  Gap(50),
                  Text(
                    "/person",
                    style: MyStyle.regular12TextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
