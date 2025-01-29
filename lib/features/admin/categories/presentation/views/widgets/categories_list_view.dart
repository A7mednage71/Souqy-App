import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/screens/empty_data.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/get_categories/get_categories_bloc.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/categories_listview_loading.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/category_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          context
              .read<GetCategoriesBloc>()
              .add(const GetCategoriesEvent.getCategories());
        },
        child: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
          builder: (context, state) {
            return state.when(
              success: (categories) {
                return categories.isEmpty
                    ? const EmptyData()
                    : ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(top: index == 0 ? 0 : 20.h),
                          child: CategoryItem(category: categories[index]),
                        ),
                      );
              },
              loading: () {
                return const CategoriesListViewLoading();
              },
              failure: (message) => Center(child: Text(message)),
              initial: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
