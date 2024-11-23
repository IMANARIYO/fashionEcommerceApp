import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/common/utils/kstrings.dart';
import 'package:ecom_t/common/widgets/app_style.dart';
import 'package:ecom_t/common/widgets/custom_button.dart';
import 'package:ecom_t/common/widgets/reusable_text.dart';
import 'package:ecom_t/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Kolors.kWhite,
          // width: ScreenUtil().screenWidth,
          // height: ScreenUtil().screenHeight,
          child: Column(children: [
            // SizedBox(
            //   height: 30.h,
            // ),
            Image.asset(
              R.ASSETS_IMAGES_GETSTARTED_PNG,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              AppText.kWelcomeHeader,
              textAlign: TextAlign.center,
              style: appStyle(24, Kolors.kPrimary, FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth - 100,
              child: Text(
                AppText.kWelcomeMessage,
                style: appStyle(11, Kolors.kGray, FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              text: AppText.kGetStared,
              onTap: () {
                //TODO : un comment  the  bool storage    when the app  is  ready
                // Storage().setBool("firstOpen", true);
                context.go('/home');
              },
              radius: 20,
              btnWidth: ScreenUtil().screenWidth - 100,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableText(
                  text: "already  have any  acount ",
                  style: appStyle(12, Kolors.kGray, FontWeight.normal),
                ),
                TextButton(
                    onPressed: () {
                      // navigate to  login page
                      context.go('/login');
                    },
                    child: (const Text(
                      "Sign in ",
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    ))),
              ],
            )
          ])),
    );
  }
}
