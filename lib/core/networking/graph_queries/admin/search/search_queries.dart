import 'package:my_store/features/customer/search/data/models/search_request_model.dart';

class SearchQueries {
  static Map<String, dynamic> searchProductsQuery({
    required SearchRequestModel model,
  }) {
    return {
      'query': r'''
        query SearchProducts($title: String, $minPrice: Int, $maxPrice: Int) {
          products(title: $title, price_min: $minPrice, price_max: $maxPrice) {
            id
            title
            price
            images
            description
            category {
              id
              name
            }
          }
        }
      ''',
      'variables': {
        'title': model.productName,
        'minPrice': model.minPrice == null ? null : int.parse(model.minPrice!),
        'maxPrice': model.maxPrice == null ? null : int.parse(model.maxPrice!),
      },
    };
  }
}
