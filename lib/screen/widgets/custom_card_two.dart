import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import '../../models/card.dart';
import '../../utils/mystyle.dart';

class CustomCardTwo extends StatelessWidget {
  final CardModule card;
  const CustomCardTwo({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Hero(
              tag: '${card.id}',
              child: Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(card.productImg),
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
                    'Greeblue Lake',
                    style: MyStyle.dash13TextStyle,
                  ),
                  Gap(7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/location.png',
                          ),
                          Gap(6),
                          Text(
                            'Switzerland',
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
                        "200\$",
                        style: MyStyle.linkTextStyle,
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
            onTap: () {},
            child: Container(
              height: 37,
              width: 37,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite,
                color: MyStyle.secondarycolo,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
