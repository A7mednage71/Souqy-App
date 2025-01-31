import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/common/widgets/custom_dropdown_button_form_field.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/get_categories/get_categories_bloc.dart';
import 'package:my_store/features/admin/products/presentation/bloc/update_product/update_product_bloc.dart';

class UpdateSelectedCategoryDropButton extends StatelessWidget {
  const UpdateSelectedCategoryDropButton({
    required this.selectedCategory,
    super.key,
  });
  final String selectedCategory;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
      builder: (context, state) {
        return state.maybeMap(
          success: (categories) {
            return CustomDropdownButtonFormField(
              hint: 'Select a category',
              vaidationText: 'Please select a category',
              items: categories.categories.map((e) => e.name).toList(),
              chosenValue: selectedCategory,
              onChanged: (value) {
                context.read<UpdateProductBloc>().categoryId =
                    categories.categories.firstWhere((e) => e.name == value).id;
              },
            );
          },
          orElse: () {
            return CustomDropdownButtonFormField(
              hint: 'Select a category',
              vaidationText: 'Please select a category',
              items: const [],
              onChanged: (value) {},
            );
          },
        );
      },
    );
  }
}
