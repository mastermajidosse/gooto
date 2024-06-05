import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../models/card_model.dart';
import '../../utils/mystyle.dart';

class CustomCard extends StatelessWidget {
  final CardModule card;
  final Function()? onTap;
  final Function()? likeTap;
  const CustomCard(
      {super.key,
      required this.card,
      required this.likeTap,
      required this.onTap});

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
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: "imageHero${card.id}",
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
                    onTap: likeTap,
                    child: Container(
                      height: 37,
                      width: 37,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        shape: BoxShape.circle,
                      ),
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
