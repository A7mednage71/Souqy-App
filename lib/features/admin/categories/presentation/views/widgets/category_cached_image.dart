import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';
import 'package:shimmer/shimmer.dart';

class CategoryCachedImage extends StatelessWidget {
  const CategoryCachedImage({
    required this.category,
    super.key,
  });
  final Category category;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: category.image,
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
