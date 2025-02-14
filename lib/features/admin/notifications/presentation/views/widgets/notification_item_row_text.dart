import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';

class NotificatonItemRowText extends StatelessWidget {
  const NotificatonItemRowText({
    required this.title,
    required this.body,
    super.key,
  });
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title:  ',
          style: context.textStyle.copyWith(
            fontSize: 16.sp,
          ),
        ),
        Flexible(
          child: Text(
            body,
            style: context.textStyle.copyWith(
              fontSize: 14.sp,
              color: ColorsDark.blueLight,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
