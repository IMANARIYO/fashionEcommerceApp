import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/common/widgets/app_style.dart';
import 'package:ecom_t/src/products/controllers/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpandableText extends StatelessWidget {
  const ExpandableText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final isExpanded = context.watch<ProductNotifier>().description;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          textAlign: TextAlign.justify,
          maxLines: isExpanded ? 10 : 3,
          overflow: TextOverflow.ellipsis,
          style: appStyle(13, Kolors.kGray, FontWeight.normal),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                // Toggle description state
                context.read<ProductNotifier>().setDescription();
              },
              child: Text(
                isExpanded ? "View Less" : "View More",
                style: appStyle(13, Kolors.kPrimaryLight, FontWeight.normal),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
