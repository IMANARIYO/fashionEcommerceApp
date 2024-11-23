import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/common/utils/kstrings.dart';
import 'package:ecom_t/common/widgets/app_style.dart';
import 'package:ecom_t/common/widgets/custom_button.dart';
import 'package:ecom_t/common/widgets/reusable_text.dart';
import 'package:ecom_t/const/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kRadiusAll,
      child: Stack(children: [
        SizedBox(
          height: ScreenUtil().screenHeight * 0.16,
          width: ScreenUtil().screenWidth,
          child:
           ImageSlideshow(
            indicatorColor: Kolors.kPrimaryLight,
            autoPlayInterval: 5000,
            isLoop: true,
            // onPageChanged: (p) {
            //   print("Page changed to: $p");
            // },
            children: List.generate(images.length, (index) {
              return CachedNetworkImage(
                imageUrl: images[index],
                placeholder: kplaceholder,
                errorWidget: errorWidget,
                fit: BoxFit.cover,
              );
            }),
          ),
        ),
        Positioned(
          child: SizedBox(
            height: ScreenUtil().screenHeight * 0.16,
            width: ScreenUtil().screenWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                        text: AppText.kCollection,
                        style: appStyle(20, Kolors.kDark, FontWeight.w600)),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text("discount   50% off \n the first transation",
                        style: appStyle(14, Kolors.kDark.withOpacity(.6),
                            FontWeight.normal)),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomButton(
                      text: "Shop Now",
                      btnWidth: 150.w,
                      // onPressed: (){},
                    )
                  ]),
            ),
          ),
        )
      ]
      ),
    );
  }
}

List<String> images = [
    "https://res.cloudinary.com/dorjr1njc/image/upload/v1728065611/icyi2rieltnjgofjbkcw.png",
  "https://res.cloudinary.com/dorjr1njc/image/upload/v1728067957/pke4fimjjm7fkqg3pmsm.jpg",
 "https://res.cloudinary.com/dorjr1njc/image/upload/v1728068062/jikanxwawts9k04nk4au.jpg",
  "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fjacket.svg?alt=media&token=ffdc9a1e-917f-4e8f-b58e-4df2e6e8587e",
  "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fdress.svg?alt=media&token=cf832383-4c8a-4ee1-9676-b66c4d515a1c",
  "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fjeans.svg?alt=media&token=eb62f916-a4c2-441a-a469-5684f1a62526",
];
