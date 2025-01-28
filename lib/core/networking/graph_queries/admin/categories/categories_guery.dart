class CategoriesGuery {
  static Map<String, dynamic> categoriesQuery() {
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
}
