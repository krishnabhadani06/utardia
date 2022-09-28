import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/authorization/registration/registration_provider.dart';
import 'package:utardia/screen/authorization/registration/widgets/registration_bottom.dart';
import 'package:utardia/screen/authorization/registration/widgets/registration_center.dart';
import 'package:utardia/util/image_res.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 74.0),
              child: Column(children: [
                Container(
                  height: deviceHeight * 0.25,
                  child: Image.asset(
                    AssetsImagesRes.loginUtradiyaImage,
                    //fit: BoxFit.fill,
                  ),
                ),
                const RegistrationCenter(),
                const RegistrationBottom(),
              ]),
            ),
            provider.loader == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
