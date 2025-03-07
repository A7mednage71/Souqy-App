import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_linear_button.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/features/customer/search/presentation/bloc/search_products/search_products_bloc.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchProductsBloc>();
    return CustomLinearButton(
      onTap: () {
        if (searchBloc.searchWithNameFormKey.currentState?.validate() ??
            false) {
          searchBloc.add(const SearchProductsEvent.searchProducts());
        }
        if (searchBloc.searchWithPriceFormKey.currentState?.validate() ??
            false) {
          searchBloc.add(const SearchProductsEvent.searchProducts());
        }
      },
      width: 100.w,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Search',
            style: context.textStyle.copyWith(fontSize: 14.sp),
          ),
          Icon(
            Icons.search,
            color: context.themeColors.textColor,
            size: 20.sp,
          ),
        ],
      ),
    );
  }
}
