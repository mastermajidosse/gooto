import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/profile/profile_cubit.dart';
import 'package:gooto/models/user_model.dart';
import 'package:gooto/utils/MyStyle.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = 'EditProfileScreen';
  UserModel userModel;
  EditProfileScreen(this.userModel);
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController mycountry = TextEditingController();
  final TextEditingController mail = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    name.text = "${widget.userModel.firstname}";
    initname = "${widget.userModel.firstname}";
    mycountry.text = widget.userModel.country.toString();
    initmycountry = widget.userModel.country.toString();
    mail.text = widget.userModel.email ?? "";
    initinsta = widget.userModel.email ?? "";
  }

  String? initname;
  String? initinsta;
  String? initmycountry;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final ImagePicker _picker = ImagePicker();

  XFile? newimage;
  var image =
      "https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60.0),
          child: Container(
            // decoration: MyStyle.appbaDecotatio(),
            width: double.infinity,
            child: Container(
              height: 56.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50.w,
                    child: InkWell(
                      customBorder: CircleBorder(),
                      child: Icon(
                        Icons.arrow_back,
                        color: MyStyle.textgreycolor,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "تعديل المعلومات",
                      style: MyStyle.dashTextStyle,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 12),
                  //   child: Text(
                  //     "Edit Profile",
                  //     style: MyStyle.dashTextStyle,
                  //   ),
                  // ),
                  InkWell(
                    customBorder: CircleBorder(),
                    onTap: () {
                      save();
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      width: 50.w,
                      height: 56.h,
                      alignment: Alignment.center,
                      child: Text(
                        "تغيير",
                        style: MyStyle.buttTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              children: [
                Container(
                  // decoration: MyStyle.appbaDecotatio(),
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(36),
                          vertical: ScreenUtil().setWidth(15),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              "تغيير صورة المستخدم",
                              style: MyStyle.regularTextStyle,
                            ),
                            // Text(
                            //   "Change profile photo",
                            //   style: MyStyle.regularTextStyle,
                            // ),
                            SizedBox(height: 16.w),
                            InkWell(
                              onTap: () async {
                                showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            SizedBox(height: 6),
                                            ListTile(
                                              dense: true,
                                              onTap: () async {
                                                Navigator.pop(context);

                                                setState(() async {
                                                  newimage =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .camera);
                                                });
                                              },
                                              title: Text("من الكاميرا"),
                                            ),
                                            Divider(color: Colors.black),
                                            ListTile(
                                              dense: true,
                                              onTap: () async {
                                                Navigator.pop(context);
                                                setState(() async {
                                                  newimage =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .gallery);
                                                });
                                              },
                                              title: Text("من الصور"),
                                            ),
                                            SizedBox(height: 6),

                                            // ListTile(),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: CachedNetworkImage(
                                  height: ScreenUtil().setHeight(200.w),
                                  width: ScreenUtil().setHeight(200.w),
                                  placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                        width: double.infinity,
                                        height: ScreenUtil().setHeight(300),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color: Colors.black54, width: 2),
                                          image: newimage == null
                                              ? DecorationImage(
                                                  image: NetworkImage(
                                                    "https://i0.wp.com/rouelibrenmaine.fr/wp-content/uploads/2018/10/empty-avatar.png",
                                                  ),
                                                  fit: BoxFit.cover,
                                                )
                                              : DecorationImage(
                                                  image: Image.file(
                                                          File(newimage!.path))
                                                      .image,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                  imageUrl: widget.userModel.imgurl.toString(),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                        width: double.infinity,
                                        height: ScreenUtil().setHeight(300),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(300),
                                          image: newimage == null
                                              ? DecorationImage(
                                                  image: NetworkImage(
                                                    "https://i0.wp.com/rouelibrenmaine.fr/wp-content/uploads/2018/10/empty-avatar.png",
                                                  ),
                                                  fit: BoxFit.cover,
                                                )
                                              : DecorationImage(
                                                  image: Image.file(
                                                          File(newimage!.path))
                                                      .image,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(36),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 66.0),
                              child: Divider(
                                color: Colors.black26,
                                thickness: 1,
                                height: 1,
                              ),
                            ),
                            SizedBox(height: 12.w),
                            Text(
                              "الاسم",
                              style: MyStyle.regulargreyTextStyle,
                            ),
                            // Text(
                            //   "Username",
                            //   style: MyStyle.regulargreyTextStyle,
                            // ),
                            SizedBox(height: 6.w),
                            TextFormField(
                              cursorColor: Colors.blueGrey,
                              controller: name,
                              decoration: MyStyle.inputregulare(
                                'الاسم*',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Empty username';
                                } else if (value.length < 4) {
                                  return 'Valid name is more than 4 characters';
                                } else
                                  return null;
                              },
                              textInputAction: TextInputAction.done,
                            ),
                            SizedBox(height: ScreenUtil().setHeight(20)),
                            Text(
                              "الايميل",
                              style: MyStyle.regulargreyTextStyle,
                            ),
                            // Text(
                            //   "Email",
                            //   style: MyStyle.regulargreyTextStyle,
                            // ),
                            TextFormField(
                              cursorColor: Colors.blueGrey,
                              initialValue: widget.userModel.email,
                              enabled: false,
                              textInputAction: TextInputAction.done,
                            ),
                            // SizedBox(height: ScreenUtil().setHeight(16)),
                            // Text(
                            //   "Country",
                            //   style: MyStyle.regulargreyTextStyle,
                            // ),
                            // TextFormField(
                            //   cursorColor: Colors.blueGrey,
                            //   controller: mycountry,
                            //   decoration: MyStyle.inputregulare(
                            //     'country*',
                            //   ),
                            //   validator: (value) {
                            //     if (value!.isEmpty) {
                            //       return 'Empty mycountry';
                            //     } else
                            //       return null;
                            //   },
                            //   textInputAction: TextInputAction.done,
                            // ),
                            SizedBox(height: ScreenUtil().setHeight(16)),
                            // Text(
                            //   "Instagram",
                            //   style: MyStyle.regulargreyTextStyle,
                            // ),
                            // TextFormField(
                            //   cursorColor: Colors.blueGrey,
                            //   controller: mail,
                            //   decoration: MyStyle.inputregulare(
                            //     'instagram*',
                            //   ),
                            //   validator: (value) {
                            //     if (value!.isEmpty) {
                            //       return 'Empty instagram';
                            //     } else if (value.length < 4) {
                            //       return 'Instagram username should be at least 5 characters';
                            //     } else
                            //       return null;
                            //   },
                            //   textInputAction: TextInputAction.done,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  save() async {
    FocusScope.of(context).requestFocus(FocusNode());
    // refresh profile
    if (_formKey.currentState!.validate()) {
      if (initname != name.text) {
        print("${name.text}");
        widget.userModel.firstname = name.text;
        await BlocProvider.of<ProfileCubit>(context).editprofile(
          widget.userModel,
          context,
        );
      } else {
        print("no change mothafaka");
        Navigator.of(context).pop();
      }
    }
  }
}
// UserModel(
//             displayname: name.text,
//             instagram: mail.text,
//             moto: mycountry.text,
//           ),
