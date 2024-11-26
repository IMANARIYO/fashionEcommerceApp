import 'package:ecom_t/common/services/storage.dart';
import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/common/utils/kstrings.dart';
import 'package:ecom_t/common/widgets/app_style.dart';
import 'package:ecom_t/common/widgets/reusable_text.dart';
import 'package:ecom_t/src/auth/views/login_screen.dart';
import 'package:ecom_t/src/products/widgets/explore_products.dart';
import 'package:flutter/material.dart';

class WishListpage
 extends StatelessWidget {
  const WishListpage
  ({super.key});

  @override
  Widget build(BuildContext context) {
     String? accesstoken = Storage().getString('accessToken');
    if (accesstoken == null) {
      return const LoginPage();
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:ReusableText(text: AppText.kWishlist, style: appStyle(16, Kolors.kPrimary, FontWeight.bold)),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child:ExploreProducts(),
      ),
    );
  }
}