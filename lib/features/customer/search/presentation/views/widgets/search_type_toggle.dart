import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/features/customer/search/presentation/bloc/search_products/search_products_bloc.dart';
import 'package:my_store/features/customer/search/presentation/views/widgets/max_min_text_field.dart';
import 'package:my_store/features/customer/search/presentation/views/widgets/product_name_text_field.dart';

class SearchTypeToggle extends StatefulWidget {
  const SearchTypeToggle({super.key});

  @override
  State<SearchTypeToggle> createState() => _SearchTypeToggleState();
}

class _SearchTypeToggleState extends State<SearchTypeToggle>
    with TickerProviderStateMixin {
  late TabController _clickController;

  @override
  void initState() {
    super.initState();
    _clickController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _clickController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchProductsBloc>();
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            tabs: const [
              Tab(text: 'Search By Name'),
              Tab(text: 'Search By Price'),
            ],
            controller: _clickController,
            labelColor: Colors.white,
            unselectedLabelColor: context.themeColors.textColor,
            indicatorSize: TabBarIndicatorSize.tab,
            tabAlignment: TabAlignment.fill,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              color: context.themeColors.bluePinkLight,
              borderRadius: BorderRadius.circular(15.r),
            ),
            onTap: (index) {
              if (index == 0) {
                searchCubit.maxPriceController.text = '';
                searchCubit.minPriceController.text = '';
              } else {
                searchCubit.productNameController.text = '';
              }
              searchCubit.resetState();
            },
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 70.h,
            child: TabBarView(
              controller: _clickController,
              children: const [
                ProductNameTextField(),
                MaxAndMinPriceTextField(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
