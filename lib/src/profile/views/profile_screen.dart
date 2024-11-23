import 'package:ecom_t/common/services/storage.dart';
import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/common/utils/kstrings.dart';
import 'package:ecom_t/common/widgets/app_style.dart';
import 'package:ecom_t/common/widgets/custom_button.dart';
import 'package:ecom_t/common/widgets/help_bottom_sheet.dart';
import 'package:ecom_t/common/widgets/reusable_text.dart';
import 'package:ecom_t/src/auth/views/login_screen.dart';
import 'package:ecom_t/src/profile/widgets/tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String? accesstoken = Storage().getString('accesstoken');
    if (accesstoken == null) {
      return const LoginPage();
    }
    
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            const CircleAvatar(
                radius: 35,
                backgroundColor: Kolors.kPrimary,
                backgroundImage: NetworkImage(AppText.kProfilePic)),
            SizedBox(
              height: 15.h,
            ),
            ReusableText(
                text: "imanariyobaptiste@gmail.com",
                style: appStyle(11, Kolors.kGray, FontWeight.w600)),
            SizedBox(
              height: 15.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                  color: Kolors.kOffWhite,
                  borderRadius: BorderRadius.circular(10.r)),
              child: ReusableText(
                  text: "Imanariyo baptiste",
                  style: appStyle(14, Kolors.kDark, FontWeight.w600)),
            )
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          color: Kolors.kOffWhite,
          child: Column(
            children: [
              ProfileTileWidget(
                tile: 'My Orders',
                leading: Octicons.checklist,
                onTap: () {
                  context.push('/orders');
                },
              ),
              ProfileTileWidget(
                tile: 'Shipping Address',
                leading: MaterialIcons.location_pin,
                onTap: () {
                  context.push('/address');
                },
              ),
              ProfileTileWidget(
                tile: 'Privacy Policy',
                leading: MaterialIcons.policy,
                onTap: () {
                  context.push('/policy');
                },
              ),
              ProfileTileWidget(
                tile: 'help Center',
                leading: AntDesign.customerservice,
                onTap: () => showHelpCenterBottomSheet(context),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: CustomButton(
            text: "Logout".toUpperCase(),
            btnColor: Kolors.kRed,
            btnWidth: ScreenUtil().screenWidth - 40,
            btnHieght: 35,
          ),
        )
      ],
    ));
  }
}
