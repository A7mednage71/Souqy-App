import 'package:flutter/material.dart';
import 'package:my_store/core/extensions/theme_context.dart';

class CustomShareButton extends StatelessWidget {
  const CustomShareButton({required this.size, super.key});
  final double size;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.share,
        color: context.themeColors.textColor,
        size: size,
      ),
    );
  }
}
