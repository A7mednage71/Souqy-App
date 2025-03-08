import 'package:flutter/material.dart';
import 'package:my_store/features/admin/categories/presentation/views/categories_screen.dart';
import 'package:my_store/features/admin/dashboard/views/presentation/dashboard_screen.dart';
import 'package:my_store/features/admin/home_admin/data/models/drawer_item_model.dart';
import 'package:my_store/features/admin/notifications/presentation/views/notifications_screen.dart';
import 'package:my_store/features/admin/products/presentation/views/products_screen.dart';
import 'package:my_store/features/admin/users/presentation/views/users_screen.dart';

class DrawerItemsList {
  static List<DrawerItemModel> drawerItems = [
    DrawerItemModel(
      title: 'Dashboard',
      icon: const Icon(
        Icons.dashboard,
        color: Colors.white,
      ),
      widget: const DashboardScreen(),
    ),
    DrawerItemModel(
      title: 'Categories',
      icon: const Icon(
        Icons.category_outlined,
        color: Colors.white,
      ),
      widget: const CategoriesScreen(),
    ),
    DrawerItemModel(
      title: 'Products',
      icon: const Icon(
        Icons.production_quantity_limits,
        color: Colors.white,
      ),
      widget: const ProductsScreen(),
    ),
    DrawerItemModel(
      title: 'Users',
      icon: const Icon(
        Icons.people_alt_rounded,
        color: Colors.white,
      ),
      widget: const UsersScreen(),
    ),
    DrawerItemModel(
      title: 'Notifications',
      icon: const Icon(
        Icons.notifications,
        color: Colors.white,
      ),
      widget: const NotificationsScreen(),
    ),
    DrawerItemModel(
      title: 'Logout',
      icon: const Icon(Icons.logout, color: Colors.white),
      widget: Container(
        alignment: Alignment.center,
        child: const Text('Logout'),
      ),
    ),
  ];
}
