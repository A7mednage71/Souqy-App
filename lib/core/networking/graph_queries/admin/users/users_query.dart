class UsersQuery {
  static Map<String, dynamic> getUsersQuery() {
    return {
      'query': '''
      {
        users{
       		id
	      	name
		      email
        }
      }
          ''',
    };
  }
}
