import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/screens/failure_state.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/routes/routes.dart';
import 'package:my_store/features/customer/customer_home/presentation/bloc/get_customer_categories/get_customer_categories_bloc.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/customer_category_item.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/customer_home_category_loading.dart';

class CustomerHomeCategoriesListView extends StatelessWidget {
  const CustomerHomeCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCustomerCategoriesBloc, GetCustomerCategoriesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          failure: (message) => const FailureState(),
          loading: () => const CustomerHomeCategoryLoading(),
          success: (categories) => SizedBox(
            height: 110.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      Routes.categorySpecificProducts,
                      arguments: categories[index],
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: CustomerCategoryItem(category: categories[index]),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
