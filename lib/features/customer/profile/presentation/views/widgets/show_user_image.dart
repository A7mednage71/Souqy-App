import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/constants/app_constants.dart';

class ShowUserImage extends StatelessWidget {
  const ShowUserImage({super.key, this.image});
  final String? image;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image ?? AppConstants.userAvatar,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundImage: imageProvider,
        radius: 40.r,
        backgroundColor: Colors.transparent,
      ),
      errorWidget: (context, url, error) {
        return CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 40.r,
          child: const Icon(
            Icons.error,
            color: Colors.red,
          ),
        );
      },
    );
  }
}
