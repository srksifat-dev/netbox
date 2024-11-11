import 'package:flutter/material.dart';
import 'package:netbox/core/utils/extensions/widget_extensions.dart';
import 'package:netbox/core/utils/widgets/placeholders.dart';
import 'package:shimmer/shimmer.dart';

Widget loadingHomeScreen(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade900,
    enabled: true,
    highlightColor: Colors.grey.shade600,
    child: SafeArea(
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) => const MovieThumbnailPlaceholder(),
      ).paddingSymmetric(horizontal: 16)
    ),
  );
}
