import 'package:my_store/features/admin/products/data/models/create_product_request_model.dart';
import 'package:my_store/features/admin/products/data/models/update_product_request_model.dart';

class ProductsQuery {
  static Map<String, dynamic> allProductsQuery() {
    return {
      'query': '''
        {
          products{
            id
            title
            price
            images
            description
            category{
              id
              name
            }
          }
        }
      ''',
    };
  }

  static Map<String, dynamic> getProductsWithPaginationQuery({
    required int offset,
  }) {
    return {
      'query': '''
        {
          products(limit: 10, offset: $offset){
            id
            title
            price
            images
            description
            category{
              id
              name
            }
          }
        }
      ''',
    };
  }

  static Map<String, dynamic> getCategorySpecificProducts({
    required int id,
  }) {
    return {
      'query': r'''
        {
          products(categoryId: $id){
            id
            title
            price
            images
            description
            category{
              id
              name
            }
          }
        }
      ''',
    };
  }

  static Map<String, dynamic> createProductQuery({
    required CreateProductRequestModel model,
  }) {
    return {
      'query': r'''
        mutation CreateProduct($title: String!, $price: Float!, $description: String!, $categoryId: Float!, $images: [String!]!){
          addProduct(data: {title: $title, price: $price,description: $description,categoryId: $categoryId,images: $images}){
            title
            category{
             name
            }
          }
        }
      ''',
      'variables': {
        'title': model.title,
        'price': model.price,
        'images': model.images,
        'description': model.description,
        'categoryId': model.categoryId,
      },
    };
  }

  static Map<String, dynamic> deleteProductQuery({required String id}) {
    return {
      'query': r'''
        mutation DeleteProduct($id: ID!){
          deleteProduct(id: $id)
        }
      ''',
      'variables': {
        'id': id,
      },
    };
  }

  static Map<String, dynamic> updateProductQuery({
    required UpdateProductRequestModel product,
  }) {
    return {
      'query': r'''
        mutation UpdateProduct($id: ID!, $title: String!, $price: Float!, $description: String!, $categoryId: Float!, $images: [String!]!){
          updateProduct(id: $id, changes: {title: $title, price: $price,description: $description,categoryId: $categoryId,images: $images}){
            title
          }
        }
      ''',
      'variables': {
        'id': product.id,
        'title': product.title,
        'price': product.price,
        'images': product.images,
        'description': product.description,
        'categoryId': product.categoryId,
      },
    };
  }
}
