import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/common/utils/kstrings.dart';
import 'package:ecom_t/common/widgets/app_style.dart';
import 'package:ecom_t/common/widgets/back_button.dart';
import 'package:ecom_t/common/widgets/error_modal.dart';
import 'package:ecom_t/common/widgets/login_bottom_sheet.dart';
import 'package:ecom_t/common/widgets/reusable_text.dart';
import 'package:ecom_t/src/products/controllers/colors_sizes_notifier.dart';
// import 'package:ecom_t/const/constants.dart';
import 'package:ecom_t/src/products/controllers/product_notifier.dart';
import 'package:ecom_t/src/products/widgets/color_selection_widget.dart';
import 'package:ecom_t/src/products/widgets/expandable_text.dart';
import 'package:ecom_t/src/products/widgets/product_bottom_bar.dart';
import 'package:ecom_t/src/products/widgets/product_sizes_widget.dart';
import 'package:ecom_t/src/products/widgets/similar_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import '../../../common/services/storage.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accesToken');
    final productNotifier = context.read<ProductNotifier>();

    // Ensure product is fetched and available
    final product = productNotifier.product;
    if (product == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Consumer<ProductNotifier>(
      builder: (context, productNotifier, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Kolors.kWhite,
                expandedHeight: 320.h,
                collapsedHeight: 65.h,
                floating: false,
                pinned: true,
                leading: const AppBackButton(),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        // Handle favorite action
                      },
                      child: const CircleAvatar(
                        backgroundColor: Kolors.kSecondaryLight,
                        child: Icon(
                          AntDesign.heart,
                          color: Kolors.kRed,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: ImageSlideshow(
                    indicatorColor: Kolors.kPrimaryLight,
                    autoPlayInterval: 15000,
                    isLoop: product.imageUrls.isNotEmpty,
                    children: product.imageUrls.map((url) {
                      return CachedNetworkImage(
                        imageUrl: url,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        height: 415.h,
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                        text: product.clothesType.toUpperCase(),
                        style: appStyle(13, Kolors.kGray, FontWeight.w600)),
                    Row(children: [
                      const Icon(
                        AntDesign.star,
                        color: Kolors.kGold,
                        size: 14,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      ReusableText(
                          text: product.ratings.toStringAsFixed(1),
                          style: appStyle(13, Kolors.kGray, FontWeight.normal)),
                    ])
                  ],
                ),
              )),
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 10.h,
              )),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ReusableText(
                      text: product.title,
                      style: appStyle(16, Kolors.kDark, FontWeight.w600)),
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.all(12),
                child: ExpandableText(text: product.description),
              )),
              // SliverToBoxAdapter(
              //     child: SizedBox(
              //   height: 10.h,
              // )),

              SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Divider(
                  thickness: .5.h,
                ),
              )),
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 10.h,
              )),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ReusableText(
                    text: "Select Sizes",
                    style: appStyle(16, Kolors.kDark, FontWeight.w600)),
              )),

              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ProductSizesWidget(),
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ReusableText(
                    text: "Select  color",
                    style: appStyle(16, Kolors.kDark, FontWeight.w600)),
              )),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ColorSelectionWidget(),
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ReusableText(
                    text: "smilar products",
                    style: appStyle(16, Kolors.kDark, FontWeight.w600)),
              )),
              const SliverToBoxAdapter(child: SimilarProducts()),
            ],
          ),
          bottomNavigationBar: ProductBottomBar(
              onPressed: () {
                if (accessToken == null) {
                  loginBottomSheet(context);
                } else {
                  if (context.read<ColorsSizesNotifier>().colors == '' ||
                      context.read<ColorsSizesNotifier>().sizes == '') {
                    showErrorPopup(context, AppText.kCartErrorText,
                        "error adding to cart ", false);
                  } else {}
                }
           //TODO:  Add To Cart logic 
              },
              price: context
                  .read<ProductNotifier>()
                  .product!
                  .price
                  .toStringAsFixed(2)),
        );
      },
    );
  }
}
