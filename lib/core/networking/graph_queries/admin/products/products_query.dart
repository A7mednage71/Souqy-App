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
            category{
              id
              name
            }
          }
        }
      ''',
    };
  }
}
