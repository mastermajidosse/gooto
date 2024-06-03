import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/profile/profile_cubit.dart';
import 'package:gooto/screen/profile/edit_profile_screen.dart';
import 'package:gooto/screen/profile/signup_profile_screen.dart';
import 'package:gooto/services/service/auth_service.dart';
import 'package:gooto/utils/img_bigger.dart';
import 'package:gooto/utils/mystyle.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = 'setting';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var image = "https://i0.wp.com/rouelibrenmaine.fr/wp-content/uploads/2018/10/empty-avatar.png";
  String sh = "مرحبا بكم في تطبيق التراس حيت نشارك جميع معلومات وقصص واخبار اللتراس المغرب ";
  Future<bool> csac() async {
    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<ProfileCubit>(context).profile();
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> stop = [
    'stop',
    'please stop',
    'get some help',
    'stooooop',
    'common man',
    'keep going you gonna win big',
  ];

  @override
  Widget build(BuildContext context) {
    // print(SmilesRepo().user!.uid);
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      return state is ProfileLoaded
          ? Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
                // leading: BackButton(color: Colors.black),
                title: Text(
                  "الحساب",
                  style: Mystyle.regularTextStyle,
                ),
              ),
              backgroundColor: Colors.white,
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(height: ScreenUtil().setHeight(30)),
                          InkWell(
                            // onDoubleTap: () {
                            //   if (state is ProfileLoaded)
                            //     showsmile(context, state.myuser.imgurl);
                            // },
                            // onTap: () {
                            //   if (state is ProfileLoaded)
                            //     showsmile(context, state.myuser.imgurl);
                            // },
                            child: CachedNetworkImage(
                              height: ScreenUtil().setHeight(155),
                              width: ScreenUtil().setHeight(155),
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                width: double.infinity,
                                height: ScreenUtil().setHeight(300),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: Colors.black54, width: 2),
                                  image: DecorationImage(
                                    image: NetworkImage(image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              imageUrl: state.myuser.imgurl ??
                                  "https://i0.wp.com/rouelibrenmaine.fr/wp-content/uploads/2018/10/empty-avatar.png",
                              imageBuilder: (context, imageProvider) => Container(
                                width: double.infinity,
                                height: ScreenUtil().setHeight(300),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: Colors.black54, width: 2),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(25)),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              child: Text(
                                state.myuser.firstname!,
                                style: Mystyle.dashTextcoloStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(35)),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[200]!,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: ListTile(
                          onTap: () {
                            state is ProfileLoaded
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => EditProfileScreen(state.myuser)))
                                : print("err");
                          },
                          title: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              "المعلومات الشخصية",
                              style: Mystyle.regularTextStyle,
                            ),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_left_sharp),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[200]!,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: ListTile(
                            onTap: () {
                              Share.share(sh);
                            },
                            title: Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Text(
                                "مشاركة التطبيق",
                                style: Mystyle.regularTextStyle,
                              ),
                            ),
                            trailing: Icon(Icons.keyboard_arrow_left_sharp)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[200]!,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: ListTile(
                          onTap: () async {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (_) => RulesScreen()));
                            final Email email = Email(
                              body: "",
                              subject: '',
                              recipients: ['mastermajidosse@gmail.com'],
                              isHTML: false,
                            );

                            await FlutterEmailSender.send(email);
                          },
                          title: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              "تواصل معنا",
                              style: Mystyle.regularTextStyle,
                            ),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_left_sharp),
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(25)),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[200]!,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: ListTile(
                          onTap: () {
                            // ProfileCubit().
                            UserRepository().signOut().then((value) {
                              Phoenix.rebirth(context);
                            });
                          },
                          title: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              "خروج",
                              style: Mystyle.regularTextStyle,
                            ),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_left_sharp),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Container(
                          //     height: 60.w,
                          //     width: 60.w,
                          //     decoration: BoxDecoration(
                          //       color: Colors.transparent,
                          //       image: DecorationImage(
                          //         image: AssetImage("assets/logonocircle.png"),
                          //         fit: BoxFit.cover,
                          //       ),
                          //     )),
                          Text(
                            "التراس",
                            style: Mystyle.buttTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15)),
                  ],
                ),
              ),
            )
          : state is ProfileError
              ? SignupProfileScreen('الحساب')
              : Center(child: CircularProgressIndicator());
    });
  }

  Future<String> writeImageToStorage(Uint8List feedbackScreenshot) async {
    final Directory output = await getTemporaryDirectory();
    final String screenshotFilePath = '${output.path}/feedback.png';
    final File screenshotFile = File(screenshotFilePath);
    await screenshotFile.writeAsBytes(feedbackScreenshot);
    return screenshotFilePath;
  }

  showsmile(context, smile) {
    showDialog(
        context: context,
        builder: (context) {
          return ImageBigger.imagePop(
            Mystyle.isNullEmptyFalseOrZero(smile!) ? image : smile!,
          );
        });
  }

  int clicks = 0;
}
