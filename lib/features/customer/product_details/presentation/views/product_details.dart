// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_store/core/common/widgets/customer_appbar.dart';
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
      appBar: CustomerAppbar(),
    );
  }
}
