import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../models/card.dart';
import '../../utils/mystyle.dart';

class CustomCard extends StatelessWidget {
  final CardModule card;
  const CustomCard({super.key,required this.card});

  @override
  Widget build(BuildContext context) {
    return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Hero(
                              tag: '${card.id}',
                              child: Container(
                                height: 200,
                                width: 200,
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(card.productImg),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 25,
                              top: 25,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 37,
                                  width: 37,
                                  decoration: BoxDecoration(
                                    color: MyStyle.secondarycolo,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    // color: Styles.orange,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Myconos Bluelake',
                          style: MyStyle.buttwhtieTextStyle,
                          // style: MyStyle.blackalarmTextStyle,
                        ),
                        Gap(15),
                        Text(
                          "200\$",
                          style: MyStyle.buttwhtieTextStyle,
                        ),
                      ],
                    ),
                    Gap(15),
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
                              // style: MyStyle.blackalarmTextStyle,
                            ),
                          ],
                        ),
                        Gap(15),
                        Text(
                          "/person",
                          style: MyStyle.regular12TextStyle,
                        ),
                      ],
                    ),
                  ],
                );
  }
}