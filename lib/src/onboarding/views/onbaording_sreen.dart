import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:ecom_t/src/onboarding/widgets/onboarding_screen_one.dart';
import 'package:ecom_t/src/onboarding/widgets/onboarding_screen_two.dart';
import 'package:ecom_t/src/onboarding/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(
        initialPage: context.read<OnboardingNotifier>().selectedPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedPage = context.read<OnboardingNotifier>().selectedPage;

    return Scaffold(
        body: Stack(children: [
      PageView(
        controller: _pageController,
        onPageChanged: (page) {
          context.read<OnboardingNotifier>().selectedPage = page;
        },
        children: const [
          OnboardingScreenOne(),
          OnboardingScreenTwo(),
          WelcomeScreen(),
          // Center(child: Text("page 2")),
        ],
      ),
    context.watch<OnboardingNotifier>().selectedPage == 2 ? const SizedBox.shrink():  Positioned(
          bottom: 50.h,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            width: ScreenUtil().screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                    context.watch<OnboardingNotifier>().selectedPage == 0 ? const SizedBox(width: 25,): GestureDetector(
                  onTap: () {
                     _pageController.animateToPage(context.read<OnboardingNotifier>().selectedPage - 1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn); 
                  },
                  child: const Icon(
                    AntDesign.leftcircleo,
                    color: Kolors.kPrimary,
                    size: 30,
                  ),
                ),
                SizedBox(
                    width: ScreenUtil().screenWidth * 0.7,
                    height: 50,
                    child: PageViewDotIndicator(
                      currentItem:
                          context.watch<OnboardingNotifier>().selectedPage,
                      count: 3,
                      unselectedColor: Colors.black26,
                      selectedColor: Kolors.kPrimary,
                      duration: const Duration(milliseconds: 200),
                      onItemClicked: (index) {
                        _pageController.animateToPage(index,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                      },
                    )
                    ),

                GestureDetector(
                  onTap:(){
                      _pageController.animateToPage(context.read<OnboardingNotifier>().selectedPage +1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn); 
                  },
                  child: const Icon(
                    AntDesign.rightcircleo,
                    color: Kolors.kPrimary,
                    size: 30,
                  ),
                ),
              ],
            ),
          ))
    ]));
  }
}
