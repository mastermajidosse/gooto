import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooto/bloc/store/store_cubit.dart';
import 'package:gooto/models/cloth.model.dart';
import 'package:gooto/utils/mystyle.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<StoreCubit>(context).getAllProducts();
    super.initState();
  }

  // List
  int num = 0;
  // typeCl cat = typeCl.other;
  // List<ClothModel> newlist = ClothModel.test;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 55),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF008aae),
              ),
              height: 60,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "المتجر",
                style: Mystyle.dashTextStyle.copyWith(
                  fontSize: 22,
                  fontFamily: "arial",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: BlocBuilder<StoreCubit, StoreState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  state.loading == true
                      ? Center(child: CircularProgressIndicator())
                      : Expanded(
                          child: state.products == null
                              ? Container()
                              : GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                    childAspectRatio: 4 / 5,
                                  ),
                                  itemCount:
                                      state.products!.products!.length, // ClothModel.test.length,
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                                  itemBuilder: (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () async {
                                        await launchUrlString(""); // wtsp
                                      },
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 200,
                                              height: 200,
                                              decoration: Mystyle.storedecoration(
                                                image: state.products!.products![index].image,
                                              ).copyWith(color: Colors.white),
                                              padding: EdgeInsets.all(24),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(20),
                                                child: Image(
                                                  image: NetworkImage(
                                                    state.products!.products![index].image
                                                        .toString(),
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 12),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 12),
                                            child: Text(
                                              state.products!.products![index].name.toString(),
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: Mystyle.blackCatTextStyle,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 12),
                                            child: Text(
                                              " ${state.products!.products![index].price} DHs ",
                                              textDirection: TextDirection.ltr,
                                              textAlign: TextAlign.center,
                                              style: Mystyle.regularTextStyle,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                        ),
                ],
              );
            },
          ),
        ));
  }
}
