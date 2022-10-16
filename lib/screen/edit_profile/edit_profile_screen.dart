import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/common_loader.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/common/textform_field.dart';
import 'package:utardia/screen/dashboard/dashboard_provider.dart';
import 'package:utardia/screen/edit_profile/editprofile_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

import 'widget/edit_profile_center.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // File? img;
  selectImage() async {
    // final ImagePicker picker = ImagePicker();
    // final image = await picker.pickImage(source: ImageSource.gallery);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      Provider.of<EditProfileProvider>(context, listen: false).init();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EditProfileProvider>(builder: (context, x, y) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: ColorRes.appBarColor,
            leading: GestureDetector(
              child: Icon(IconRes.icBack, size: 30),
              onTap: () {
                if (navigator.currentState!.canPop()) {
                  navigator.currentState!.pop();
                } else {
                  Provider.of<DashboardProvider>(context, listen: false)
                      .onBottomBarChange(0, context);
                }
                // Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title:
                const Text(Strings.editProfile, style: TextStyle(fontSize: 20)),
          ),
          body: SingleChildScrollView(
              child: x.profileModel != null
                  ? Form(
                      key: x.editProfileFormKey,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 16.0, right: 19.0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 120,
                                  width: 120,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: ColorRes.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorRes.black.withOpacity(0.5),
                                        //color of shadow
                                        spreadRadius: 0, //spread radius
                                        blurRadius: 3, // blur radius
                                        offset: const Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                    // border:
                                    // Border.all(color: ColorRes.buttonBlue)
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    // borderRadius:
                                    // BorderRadius.all(Radius.circular(100)),
                                    child: x.img != null
                                        ? Image.file(
                                            File(
                                              x.img!.path,
                                            ),
                                            fit: BoxFit.fill,
                                          )
                                        : x.profileModel != null &&
                                                x.profileModel!.data != null
                                            ? x.profileModel!.data![0]
                                                            .avatarOriginal !=
                                                        null &&
                                                    x.profileModel!.data![0]
                                                            .avatarOriginal !=
                                                        ""
                                                ? Image.network(
                                                    x.profileModel!.data![0]
                                                        .avatarOriginal
                                                        .toString(),
                                                    fit: BoxFit.fill,
                                                  )
                                                : const Text("No Image")
                                            : Image.network(
                                                "https://picsum.photos/250?image=9"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 105.0, left: 50.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        x.getImage();
                                      },
                                      child: Icon(
                                        IconRes.icCamera,
                                        color: ColorRes.buttonBlue,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: deviceHeight * 0.03),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Enter Name",
                                    style: robotoRegularTextStyle(
                                        fontSize: 15,
                                        color: ColorRes.textfielTitleColor)),
                                CommonTextField(
                                    controller: x.txtName,
                                    obscure: false,
                                    hintText: Strings.name,
                                    error: false,
                                    width: deviceWidth,
                                    border: false),
                                SizedBox(height: deviceHeight * 0.02),
                                Text("Enter Email id",
                                    style: robotoRegularTextStyle(
                                        fontSize: 15,
                                        color: ColorRes.textfielTitleColor)),
                                CommonTextField(
                                  controller: x.txtEmail,
                                  obscure: false,
                                  hintText: Strings.enterEmail,
                                  error: false,
                                  width: deviceWidth,
                                  border: false,
                                ),
                                SizedBox(height: deviceHeight * 0.02),
                                const EditProfileCenter(),
                                SizedBox(height: deviceHeight * 0.02),
                                Text("Enter Address",
                                    style: robotoRegularTextStyle(
                                        fontSize: 15,
                                        color: ColorRes.textfielTitleColor)),
                                CommonTextField(
                                  controller: x.txtAddress,
                                  obscure: false,
                                  hintText: Strings.address,
                                  error: false,
                                  width: deviceWidth,
                                  border: false,
                                ),
                              ],
                            ),
                            SizedBox(height: deviceHeight * 0.06),
                            materialButton(
                                txtButton: Strings.updateProfile,
                                onPressed: () => x.onTapUpdate(context)),
                            SizedBox(
                              height: deviceHeight * 0.05,
                            )
                          ],
                        ),
                      ),
                    )
                  // : const Center(
                  //     child: CircularProgressIndicator(),
                  //   ),
                  : x.loader == true
                      ? Center(child: commonLoader())
                      : const SizedBox()),
        ),
      );
    });
  }
}
