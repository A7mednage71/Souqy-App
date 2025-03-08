import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_store/core/extensions/theme_context.dart';

class CustomAdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAdminAppBar({
    required this.title,
    this.isMainScreen = true,
    super.key,
  });

  @override
  Size get preferredSize => Size(double.infinity, 60.h);

  final String title;
  final bool isMainScreen;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: context.textStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      leading: isMainScreen
          ? IconButton(
              splashColor: Colors.transparent,
              color: Colors.transparent,
              onPressed: () {
                ZoomDrawer.of(context)!.toggle();
              },
              icon: Icon(
                Icons.menu,
                color: context.themeColors.textColor,
              ),
            )
          : null,
    );
  }
}
