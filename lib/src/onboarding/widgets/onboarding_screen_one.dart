import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/common/utils/kstrings.dart';
import 'package:ecom_t/common/widgets/app_style.dart';
import 'package:ecom_t/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_EXPERIENCE_PNG,
            fit: BoxFit.cover,
          
          ),
         Positioned(
            bottom: 100,
            left: 30,
            right: 30,
            child: Center(
              child: Text(
               AppText.kOnboardHome,
               textAlign:TextAlign.center
               ,
               style: appStyle(11, Kolors.kGray, FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
