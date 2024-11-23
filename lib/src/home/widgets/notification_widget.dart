import 'package:ecom_t/common/services/storage.dart';
import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/common/widgets/login_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Storage().getString('accessToken') == null) {
          loginBottomSheet(context);
        } else {
          context.push('/notifications');
        }
        // context.push('/notifications');
      },
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: CircleAvatar(
          backgroundColor: Kolors.kPrimaryLight
              .withOpacity(0.3), // Light background for the circle
          radius: 20, // Adjust the radius as needed
          child: Badge(
            label: Text(4.toString()),
            child: const Icon(
              Ionicons.notifications, // Notification icon
              color: Kolors.kPrimary, // Icon color
              size: 24, // Icon size
            ),
          ),
        ),
      ),
    );
  }
}
