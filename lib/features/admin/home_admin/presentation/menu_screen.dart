import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/home_admin/data/drawer_items_list.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({required this.onPageChanged, super.key});
  final void Function(Widget page) onPageChanged;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeColors.bluePinkLight,
      appBar: const CustomAdminAppBar(
        title: 'Souqy',
        isMainScreen: false,
      ),
      body: Column(
        children: DrawerItemsList.drawerItems
            .asMap()
            .entries
            .map(
              (e) => Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  leading: e.value.icon,
                  title: Text(
                    e.value.title,
                    style: context.textStyle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeightHelper.bold,
                      color: Colors.white,
                    ),
                  ),
                  selected: selectedIndex == e.key,
                  selectedTileColor: ColorsDark.mainColor.withOpacity(0.8),
                  onTap: () {
                    setState(() {
                      selectedIndex = e.key;
                    });
                    widget.onPageChanged(e.value.widget);
                    ZoomDrawer.of(context)!.close();
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
