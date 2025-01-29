import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/delete_category/delete_category_bloc.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/get_categories/get_categories_bloc.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/categories_list_view.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/create_category/add_category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetCategoriesBloc>()
            ..add(const GetCategoriesEvent.getCategories()),
        ),
        BlocProvider(
          create: (context) => getIt<DeleteCategoryBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: const CustomAdminAppBar(title: 'Categories'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: Column(
            children: [
              const AddCategory(),
              SizedBox(height: 20.h),
              const CategoriesListView(),
            ],
          ),
        ),
      ),
    );
  }
}
