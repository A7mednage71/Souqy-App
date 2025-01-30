import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProdutImagesListView extends StatelessWidget {
  const ProdutImagesListView({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: index == 0 ? 0 : 10.w),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(10.r),
            child: Container(
              height: 90.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.grey.withOpacity(0.4),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://i.imgur.com/QkIa5tT.jpeg',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.add_a_photo_outlined,
                  size: 50.h,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
