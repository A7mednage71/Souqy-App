import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/routes/routes.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/customer_product_item.dart';
import 'package:my_store/features/customer/view_all_products/presentation/bloc/get_all_products/get_all_products_with_pagination_bloc.dart';

class AllProductsGridView extends StatefulWidget {
  const AllProductsGridView({
    required this.products,
    super.key,
  });
  final List<ProductModel> products;

  @override
  State<AllProductsGridView> createState() => _AllProductsGridViewState();
}

class _AllProductsGridViewState extends State<AllProductsGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final bloc = context.read<GetAllProductsWithPaginationBloc>();

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.7 &&
        !bloc.isFetching &&
        bloc.hasNextPage) {
      bloc.add(const GetProducts(isRefresh: false));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<GetAllProductsWithPaginationBloc>().add(
              const GetProducts(isRefresh: true),
            );
      },
      child: GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.w,
          childAspectRatio: 0.6,
        ),
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.pushNamed(
                Routes.productDetails,
                arguments: widget.products[index].id,
              );
            },
            child: CustomerProductItem(productModel: widget.products[index]),
          );
        },
      ),
    );
  }
}
