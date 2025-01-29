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
        {
          mutation addCategory($name: String!, $image: String!){
            addCategory(id: $id){
              id
              name
              image
            }
          }
        }
      ''',
      'variables': {
        'name': model.name,
        'image': model.image,
      },
    };
  }
}
