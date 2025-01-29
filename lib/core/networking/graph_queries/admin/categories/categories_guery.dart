import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';
import 'package:my_store/features/admin/categories/data/models/create_category_request_model.dart';

class CategoriesGuery {
  static Map<String, dynamic> getCategoriesQuery() {
    return {
      'query': '''
        {
          categories{
              id
              name
              image
          }
        }
      ''',
    };
  }

  static Map<String, dynamic> createCategoryQuery({
    required CreateCategoryRequestModel model,
  }) {
    return {
      'query': r'''
          mutation CreateCategory($name: String!, $image: String!){
            addCategory(data: {name: $name, image: $image}){
              id
              name
              image
            }
          }
      ''',
      'variables': {
        'name': model.name,
        'image': model.image,
      },
    };
  }

  static Map<String, dynamic> deleteCategoryQuery({
    required String id,
  }) {
    return {
      'query': r'''
          mutation DeleteCategory($id: ID!){
            deleteCategory(id: $id)
          }
      ''',
      'variables': {
        'id': id,
      },
    };
  }

  static Map<String, dynamic> updateCategoryQuery({
    required Category model,
  }) {
    return {
      'query': r'''
          mutation UpdateCategory($id: ID!, $name: String!, $image: String!){
            updateCategory(id: $id, changes: {name: $name, image: $image}){
              id
              name
              image
            }
          }
      ''',
      'variables': {
        'id': model.id,
        'name': model.name,
        'image': model.image,
      },
    };
  }
}
