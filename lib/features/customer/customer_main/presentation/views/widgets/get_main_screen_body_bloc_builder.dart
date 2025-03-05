import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/customer/categories/presentation/views/customer_categories_screen.dart';
import 'package:my_store/features/customer/customer_home/presentation/bloc/get_customer_categories/get_customer_categories_bloc.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/customer_home_screen.dart';
import 'package:my_store/features/customer/customer_main/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:my_store/features/customer/favorites/presentation/views/favorites_screen.dart';
import 'package:my_store/features/customer/profile/presentation/views/profile_screen.dart';

class GetMainScreenBodyBlocBuilder extends StatelessWidget {
  const GetMainScreenBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          return state.when(
            home: () => BlocProvider(
              create: (context) => getIt<GetCustomerCategoriesBloc>()
                ..add(const GetCustomerCategoriesEvent.getCategories()),
              child: const CustomerHomeScreen(),
            ),
            categories: () => const CustomerCategoriesScreen(),
            favorites: () => const FavoritesScreen(),
            profile: () => const ProfileScreen(),
          );
        },
      ),
    );
  }
}
