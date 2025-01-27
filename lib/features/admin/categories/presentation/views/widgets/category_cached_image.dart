import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryCachedImage extends StatelessWidget {
  const CategoryCachedImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'https://static1.pocketlintimages.com/wordpress/wp-content/uploads/wm/161396-laptops-review-hands-on-macbook-air-review-image1-v2jzcb3rqd.jpg?q=50&fit=crop&w=1100&h=618&dpr=1.5',
      imageBuilder: (context, imageProvider) => Container(
        height: 90.h,
        width: 120.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          period: const Duration(seconds: 2),
          child: Container(
            height: 90.h,
            width: 120.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          height: 90.h,
          width: 120.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.grey,
          ),
          child: const Icon(
            Icons.error,
            color: Colors.red,
          ),
        );
      },
    );
  }
}
