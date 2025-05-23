class DashboardQueries {
  DashboardQueries._();

  // products query
  static Map<String, dynamic> productsQuery() {
    return {
      'query': '''
        {
          products{
            title
          }
        }
              ''',
    };
  }

  // categories query
  static Map<String, dynamic> categoriesQuery() {
    return {
      'query': '''
        {
          categories{
            name
          }
        }
            ''',
    };
  }

  // users query
  static Map<String, dynamic> usersQuery() {
    return {
      'query': '''
        {
          users{
            name
          }
        }
            ''',
    };
  }
}
