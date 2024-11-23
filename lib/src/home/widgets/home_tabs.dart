import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/common/widgets/app_style.dart';
import 'package:ecom_t/common/widgets/tab_widget.dart';
import 'package:ecom_t/src/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({super.key, required tabController})
      : _tabController = tabController;
  final TabController ?_tabController;
  @override
  Widget build(BuildContext context) {
    if (_tabController == null) {
      return const SizedBox(); // Return an empty widget if the controller isn't ready
    }
    return SizedBox(
      height: 22.h,
      child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
              color: Kolors.kPrimary, borderRadius: BorderRadius.circular(25)),
          labelPadding: EdgeInsets.zero,
          dividerColor: Colors.transparent,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelColor: Colors.white,
          labelStyle: appStyle(11, Kolors.kPrimary, FontWeight.w600),
          unselectedLabelStyle: appStyle(11, Kolors.kGray, FontWeight.normal),
          tabs: List.generate(
              homeTabs.length,
              (i) => Tab(
                    child:TabWidget(text:homeTabs[i ] ),
                  ))),
    );
  }
}