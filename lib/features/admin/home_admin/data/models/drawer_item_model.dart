import 'package:flutter/material.dart';

class DrawerItemModel {
  DrawerItemModel({
    required this.title,
    required this.icon,
    required this.widget,
  });
  final String title;
  final Icon icon;
  final Widget widget;
}
