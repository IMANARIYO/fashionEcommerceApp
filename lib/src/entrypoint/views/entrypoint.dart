import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/common/widgets/app_style.dart';
import 'package:ecom_t/src/cart/views/cart_screen.dart';
import 'package:ecom_t/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:ecom_t/src/home/views/home_screen.dart';
import 'package:ecom_t/src/profile/views/profile_screen.dart';
import 'package:ecom_t/src/wishlist/views/wishlist_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class AppEntryPoint extends StatelessWidget {
  AppEntryPoint({super.key});

  final List<Widget> pageList = [
    const HomePage(),
    const WishListpage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexNotifier>(
      builder: (context, tabIndexNotifier, child) {
        return Scaffold(
          body: Stack(
            children: [
              // Display the current page based on index
              pageList[tabIndexNotifier.index],
              // Bottom navigation bar
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Kolors.kOffWhite,
                  ),
                  child: BottomNavigationBar(
                    selectedFontSize: 12,
                    elevation: 0,
                    currentIndex: tabIndexNotifier.index, // Current tab
                    onTap: (i) {
                      tabIndexNotifier.setIndex(i); // Change index on tap
                    },
                    showSelectedLabels: true,
                    showUnselectedLabels: false,
                    selectedLabelStyle:
                        appStyle(9, Kolors.kPrimary, FontWeight.w500),
                    unselectedIconTheme:
                        const IconThemeData(color: Colors.black38),
                    selectedItemColor: Kolors.kPrimary,
                    unselectedItemColor: Kolors.kGray,
                    items: [
                      // Home Tab
                      BottomNavigationBarItem(
                        icon: tabIndexNotifier.index == 0
                            ? const Icon(
                                AntDesign.home,
                                color: Kolors.kPrimary,
                                size: 24,
                              )
                            : const Icon(
                                AntDesign.home,
                                size: 24,
                              ),
                        label: 'Home',
                      ),
                      // WishList Tab
                      BottomNavigationBarItem(
                        icon: tabIndexNotifier.index == 1
                            ? const Icon(
                                Ionicons.heart,
                                color: Kolors.kPrimary,
                                size: 24,
                              )
                            : const Icon(
                                Ionicons.heart_outline,
                                size: 24,
                              ),
                        label: 'WishList',
                      ),
                      // Cart Tab
                      BottomNavigationBarItem(
                        icon: tabIndexNotifier.index == 2
                            ? Badge
                            (
                              label: Text(4.toString()),
                              child: const Icon(
                                  MaterialCommunityIcons.shopping,
                                  color: Kolors.kPrimary,
                                  size: 24,
                                ),
                            )
                            : Badge(
                              label: Text(4.toString()),
                              child: const Icon(
                                  MaterialCommunityIcons.shopping_outline,
                                  size: 24,
                                ),
                            ),
                        label: 'Cart',
                      ),   
                      // Profile Tab
                      BottomNavigationBarItem(
                        icon: tabIndexNotifier.index == 3
                            ? const Icon(
                                EvilIcons.user,
                                color: Kolors.kPrimary,
                                size: 34,
                              )
                            : const Icon(
                                EvilIcons.user,
                                size: 34,
                              ),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
