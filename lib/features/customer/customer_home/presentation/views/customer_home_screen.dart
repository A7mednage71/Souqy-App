import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/features/customer/customer_home/presentation/bloc/get_customer_categories/get_customer_categories_bloc.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/customer_home_categories_list_view.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/customer_home_products_grid_view.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/home_screen_banners_slider.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/view_all_products_button.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetCustomerCategoriesBloc>()
        ..add(const GetCustomerCategoriesEvent.getCategories()),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: () async {},
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    const HomeScreenBannersSlider(),
                    SizedBox(height: 20.h),
                    const CustomerHomeCategoriesListView(),
                    SizedBox(height: 20.h),
                    const CustomerHomeProductsGridView(),
                    SizedBox(height: 20.h),
                    const ViewAllProductsButton(),
                    SizedBox(height: 50.h),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomFadeInLeft(
                duration: 200,
                child: FloatingActionButton(
                  backgroundColor: context.themeColors.bluePinkLight,
                  child: const Icon(Icons.arrow_upward, color: Colors.white),
                  onPressed: () {
                    scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
