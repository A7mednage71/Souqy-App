import 'package:flutter/material.dart';
import 'package:my_store/core/common/widgets/custom_appbar_with_gradient_back_button.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    required this.product,
    super.key,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarWithGradientBackButton(),
    );
  }
}
