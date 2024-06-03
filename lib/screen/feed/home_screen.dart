import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gooto/models/card.dart';

import '../../config/demo.dart';
import '../../utils/MyStyle.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_card_two.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyStyle.secondarycolo,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // width: 45,
                  // height: 45,
                  margin: EdgeInsets.all(8),
                  child: Text(
                    'Discover',
                    style: MyStyle.blackalarmTextStyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyStyle.secondarycolo,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/rin.png',
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                ),
              ],
            ),
            Gap(10),
            Container(
              margin: EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    'Explore the best places',
                    style: MyStyle.blackalarmTextStyle,
                  )
                ],
              ),
            ),
            Gap(10),
            Container(
              height: 45,
              width: 322,
              // margin: EdgeInsets.all(8),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(60)),
              child: TextFormField(
                onFieldSubmitted: (v) {
                  print(v);
                },
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const SearchScreen(),
                      //   ),
                      // );
                    },
                    child: Image.asset(
                      'assets/images/search.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  filled: true,
                  // fillColor: AppStyle.whiteColor,
                  contentPadding: const EdgeInsets.only(top: 10),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    borderSide: BorderSide(color: Colors.black38, width: 1),
                  ),
                  hintText: 'Search...',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Gap(15),
            Row(
              children: [
                containerWid('All', () {}),
                containerWid('Trending', () {}),
                containerWid('Recomended', () {}),
                containerWid('Popular', () {}),
              ],
            ),
            Gap(15),
            containerRow(),
            Gap(10),
            Container(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cardsList.length,
                itemBuilder: (context, index) {
                  final CardModule card = cardsList[index];
                  return CustomCard(card: card);
                },
              ),
            ),
            Gap(15),
            containerRow(),
            Gap(15),
            Container(
              height: 350,
              child: ListView.builder(
                // scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  final CardModule card = cardsList[index];
                  return CustomCardTwo(card: card);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container containerRow() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Popular Places',
            style: MyStyle.blackalarmTextStyle,
          ),
          InkWell(
            child: Text(
              'View More',
              style: MyStyle.buttTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  containerWid(text, onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          text,
          style: MyStyle.regularwhiteTextStyle,
          overflow: TextOverflow.clip, // Truncate if needed
        ),
      ),
    );
  }
}
