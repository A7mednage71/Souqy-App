import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/update_product/edit_product_bottom_sheet.dart';

class EditProduct extends StatelessWidget {
  const EditProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showEditProductBottomSheet(context);
      },
      icon: const Icon(Icons.edit, color: Colors.white),
    );
  }

  void showEditProductBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      builder: (context) => const EditProductBottomSheet(),
    );
  }
}
