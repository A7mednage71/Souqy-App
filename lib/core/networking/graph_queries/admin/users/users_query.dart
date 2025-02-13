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

  static Map<String, dynamic> deleteUserQuery({required String id}) {
    return {
      'query': r'''
      mutation DeleteUser($id: ID!){
        deleteUser(id: $id)
      }
    ''',
      'variables': {
        'id': id,
      },
    };
  }
}
