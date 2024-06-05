import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gooto/utils/mystyle.dart';
import '../../bloc/card_cubit/blog_cubit.dart';
import '../../bloc/card_cubit/blog_state.dart';
import '../../models/card_model.dart';
import '../widgets/saved_card_widget.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});
  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  List<CardModule> likedBlogs = [];
  Set<String> likedBlogIds = {}; // Use a Set to store unique IDs

  @override
  void initState() {
    super.initState();
    // fetchLikedBlogs();
    // BlocProvider.of<BlogsTwoCubit>(context).clearAllBlogs(); // Dispatch event
  }

  // void fetchLikedBlogs() {
  //   BlocProvider.of<BlogsTwoCubit>(context).getLikedBlogs(); // Dispatch event
  // }

  void toggleLike(int id, int currentIsLiked) async {
    final newIsLiked = currentIsLiked == 0 ? 1 : 0; // Toggle value
    await context.read<BlogsTwoCubit>().updateLikeStatus(id, newIsLiked);
    await context.read<BlogsTwoCubit>().getCards();
    context.read<BlogsTwoCubit>().loadBlogs();
    print("newIsLiked ${newIsLiked}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Text(
                      'Saved',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: ScreenUtil().setSp(30),
                        color: Color(0xFF1B1D52),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
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
                        top: 4,
                        right: 2,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyStyle.reddcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(10),
            BlocBuilder<BlogsTwoCubit, BlogsTwoState>(
              builder: (context, state) {
                if (state is BlogsLoaded) {
                  final likedCards = state.cardsList
                      .where((card) => card.isLiked == 1)
                      .toList();

                  likedBlogIds.clear();
                  final uniqueLikedCards = likedCards.where((card) {
                    if (likedBlogIds.add(card.id.toString())) {
                      return true;
                    }
                    return false;
                  }).toList();

                  return Expanded(
                    child: ListView.builder(
                      itemCount: uniqueLikedCards.length,
                      itemBuilder: (ctx, idx) => SavedCardWidget(
                        onLike: () => toggleLike(uniqueLikedCards[idx].id,
                            uniqueLikedCards[idx].isLiked),
                        key: ValueKey(uniqueLikedCards[idx].id),
                        likedBlog: uniqueLikedCards[idx],
                      ),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
