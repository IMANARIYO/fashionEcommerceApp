import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/common/widgets/app_style.dart';
import 'package:ecom_t/common/widgets/reusable_text.dart';
import 'package:ecom_t/src/home/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: ReusableText(
              text: "Location",
              style: appStyle(12, Kolors.kGray, FontWeight.normal),
            ),
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              const Icon(Ionicons.location, color: Kolors.kPrimary, size: 16),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: SizedBox(
                  width: ScreenUtil().screenWidth * 0.7,
                  child: Text(
                    "Please select a location",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: appStyle(14, Kolors.kDark, FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: const [
        NotificationWidget(),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: GestureDetector(
          onTap: () {
            // Navigate to search page
            context.push('/search');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Search Box
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Container(
                    height: 40.h,
                    width: ScreenUtil().screenWidth - 90.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Kolors.kGrayLight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        children: [
                          const Icon(
                            Ionicons.search,
                            color: Kolors.kPrimaryLight,
                            size: 20,
                          ),
                          SizedBox(width: 10.w),
                          ReusableText(
                            text: "Search...",
                            style: appStyle(14, Kolors.kGray, FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Filter Button
                Container(
                  height: 40.h,
                  width: 49.w,
                  decoration: BoxDecoration(
                    color: Kolors.kPrimary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: IconButton(
                    onPressed: () {
                      // TODO: Add filter or additional action
                    },
                    icon: const Icon(
                      Ionicons.options,
                      color: Kolors.kWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(110.h); // Adjust total height
}
