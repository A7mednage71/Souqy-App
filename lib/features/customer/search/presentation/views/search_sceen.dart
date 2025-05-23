import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_appbar_with_gradient_back_button.dart';
import 'package:my_store/features/customer/search/presentation/views/widgets/search_button.dart';
import 'package:my_store/features/customer/search/presentation/views/widgets/search_result.dart';
import 'package:my_store/features/customer/search/presentation/views/widgets/search_type_toggle.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarWithGradientBackButton(title: 'Search'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              const SearchTypeToggle(),
              SizedBox(height: 10.h),
              const Align(
                alignment: Alignment.centerRight,
                child: SearchButton(),
              ),
              SizedBox(height: 20.h),
              const SearchResult(),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
