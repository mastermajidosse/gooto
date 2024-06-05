import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gooto/bloc/card_cubit/blog_state.dart';
import 'package:gooto/models/card_model.dart';
import '../../bloc/card_cubit/blog_cubit.dart';
import '../../config/demo.dart';
import '../../utils/MyStyle.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_card_two.dart';
import 'readmore_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<BlogsTwoCubit>().loadBlogs(); // Load blogs on init
  }

  void toggleLike(int id, int currentIsLiked) async {
    final newIsLiked = currentIsLiked == 0 ? 1 : 0; // Toggle value
    await context.read<BlogsTwoCubit>().updateLikeStatus(id, newIsLiked);
    await context.read<BlogsTwoCubit>().getCards();
    context.read<BlogsTwoCubit>().loadBlogs();
    print("newIsLiked ${newIsLiked}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  child: Text(
                    'Discover',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: ScreenUtil().setSp(27),
                      color: Colors.black87,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
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
                      child: Center(
                        child: Image.asset(
                          'assets/images/rin.png',
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 9,
                      right: 9,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MyStyle.reddcolor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(10),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    'Explore the best places',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.grey[600],
                    ),
                  )
                ],
              ),
            ),
            Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                containerWid('All', () {}, isSelected: true),
                containerWid('Trending', () {}, isSelected: false),
                containerWid('Recomended', () {}, isSelected: false),
                containerWid('Popular', () {}, isSelected: false),
              ],
            ),
            Gap(15),
            containerRow('Popular Places', 'View More'),
            Gap(10),
            BlocBuilder<BlogsTwoCubit, BlogsTwoState>(
              // bloc: cardCubit,
              builder: (context, state) {
                if (state is BlogsLoaded) {
                  final cards = state.cardsList;
                  return Container(
                    height: 280,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cards.length,
                      itemBuilder: (context, index) {
                        final CardModule card = cards[index];
                        return CustomCard(
                          likeTap: () => toggleLike(card.id, card.isLiked),
                          card: card,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MoreScreen(card),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            Gap(15),
            containerRow('Best offers', "View More"),
            Gap(15),
            BlocBuilder<BlogsTwoCubit, BlogsTwoState>(
                builder: (context, state) {
              if (state is BlogsLoaded) {
                final cards = state.cardsList;
                return Container(
                  height: 380,
                  child: ListView.builder(
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      final CardModule card = cards[index];
                      return CustomCardTwo(
                        likeTap: () => toggleLike(card.id, card.isLiked),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MoreScreen(card),
                            ),
                          );
                        },
                        card: card,
                      );
                    },
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
          ],
        ),
      ),
    );
  }

  Container containerRow(firstTitle, secondTitle) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            firstTitle,
            // 'Popular Places',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: ScreenUtil().setSp(16),
              color: Colors.black87,
            ),
          ),
          InkWell(
            child: Text(
              // 'View More',
              secondTitle,
              style: TextStyle(
                color: Color(0xFF1DA0E1),
                fontWeight: FontWeight.w700,
                fontSize: ScreenUtil().setSp(14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  containerWid(text, onTap, {isSelected = false}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? Color(0xFF1DA0E1) : Colors.white,
          border: Border.all(
            color: Colors.grey[400]!,
            width: 1.0,
          ),
        ),
        padding: EdgeInsets.all(10),
        child: Text(
          text,
          style: isSelected
              ? TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                )
              : MyStyle.regularwhiteTextStyle,
          overflow: TextOverflow.clip, // Truncate if needed
        ),
      ),
    );
  }
}
