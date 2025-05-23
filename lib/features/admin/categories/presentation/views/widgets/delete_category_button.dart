import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/delete_category/delete_category_bloc.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/get_categories/get_categories_bloc.dart';
import 'package:my_store/core/common/widgets/custom_alert_dailog.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';

class DeleteCategoryButton extends StatelessWidget {
  const DeleteCategoryButton({
    required this.categoryId,
    super.key,
  });
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteCategoryBloc, DeleteCategoryState>(
      listener: (context, state) {
        state.whenOrNull(
          failure: (message) {
            ShowToast.showFailureToast(
              message,
            );
          },
          success: () {
            context.read<GetCategoriesBloc>().add(
                  const GetCategoriesEvent.getCategories(),
                );
            ShowToast.showSuccessToast(
              'Category deleted successfully',
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (id) {
            if (id == categoryId) {
              return const IconButton(
                onPressed: null,
                icon: Center(
                  child: SpinKitDualRing(
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              );
            } else {
              return const Icon(
                Icons.delete,
                color: Colors.red,
              );
            }
          },
          orElse: () => IconButton(
            onPressed: () {
              final bloc = context.read<DeleteCategoryBloc>();
              // ignore: inference_failure_on_function_invocation
              showDialog(
                context: context,
                builder: (context) {
                  return CustomAlertDialog(
                    title: 'Delete category',
                    message: 'Are you sure you want to delete this category?',
                    onPressed: () {
                      bloc.add(
                        DeleteCategoryEvent.deleteCategory(id: categoryId),
                      );
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}
