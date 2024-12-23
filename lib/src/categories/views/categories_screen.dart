import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/common/utils/kstrings.dart';
import 'package:ecom_t/common/widgets/app_style.dart';
import 'package:ecom_t/common/widgets/back_button.dart';
import 'package:ecom_t/common/widgets/reusable_text.dart';
import 'package:ecom_t/const/constants.dart';

import 'package:ecom_t/src/categories/views/controllers/category_notifier.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const AppBackButton(),
          title: Center(
              child: ReusableText(
                  text: AppText.kCategories,
                  style: appStyle(16, Kolors.kPrimary, FontWeight.bold))),
        ),
        body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return ListTile(
              onTap: () {
             
                context.read<CategoryNotifier>().setCategory(category.title,category.id);
                context.push('/category');
              },
              leading: CircleAvatar(
                backgroundColor: Kolors.kSecondaryLight,
                radius: 18,
                child: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: SvgPicture.network(category.imageUrl),
                ),
              ),
              title: ReusableText(
                  text: category.title,
                  style: appStyle(12, Kolors.kGray, FontWeight.normal)),
              trailing: const Icon(
                MaterialCommunityIcons.chevron_double_right,
                size: 18,
              ),
            );
          },
        ));
  }
}
