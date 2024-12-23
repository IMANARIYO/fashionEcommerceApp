import 'package:ecom_t/common/services/storage.dart';
import 'package:ecom_t/common/widgets/login_bottom_sheet.dart';
import 'package:ecom_t/const/constants.dart';

// import 'package:ecom_t/src/products/models/products_model.dart';
import 'package:ecom_t/src/products/widgets/staggered_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SimilarProducts extends StatelessWidget {
  const SimilarProducts({super.key});

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');
    return Padding(
      padding: EdgeInsets.all(8.h), // Increased for better spacing
      child: MasonryGridView.count(
        crossAxisCount: 2, // Number of columns
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 8.h,
        itemCount: productsList.length,
        shrinkWrap: true, // Add this line to allow proper layout inside ListView
        physics: const NeverScrollableScrollPhysics(), // Prevent scrolling conflict
        itemBuilder: (context, i) {
          final double mainAxisCellCount = (i % 2 == 0 ? 2.17 : 2.4);
          final product = productsList[i];
          return StaggeredTileWidget(
            i: i,
            product: product,
            onTap: () {
              if (accessToken == null) {
                loginBottomSheet(context);
              } else {
                // TODO: Handle wishlist functionality
        
              }
            },
          );
        },
      ),
    );
  }
}
