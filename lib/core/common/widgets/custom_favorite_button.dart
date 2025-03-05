import 'package:flutter/material.dart';
import 'package:my_store/core/extensions/theme_context.dart';

class CustomFavoriteButton extends StatelessWidget {
  const CustomFavoriteButton({required this.size, super.key});
  final double size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      icon: Icon(
        Icons.favorite_outline,
        color: context.themeColors.textColor,
        size: size,
      ),
    );
  }
}
