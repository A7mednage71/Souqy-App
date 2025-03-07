import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/core/common/screens/failure_state.dart';
import 'package:my_store/core/common/widgets/custom_appbar_with_gradient_back_button.dart';
import 'package:my_store/features/customer/product_details/presentation/views/bloc/get_product_data/get_product_data_bloc.dart';
import 'package:my_store/features/customer/product_details/presentation/views/widgets/product_details_body.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarWithGradientBackButton(),
      body: BlocBuilder<GetProductDataBloc, GetProductDataState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            failure: (message) => const FailureState(),
            loading: () => const Center(
              child: SpinKitCircle(
                color: Colors.white,
              ),
            ),
            sccess: (product) => ProductDetailsBody(product: product),
          );
        },
      ),
    );
  }
}
