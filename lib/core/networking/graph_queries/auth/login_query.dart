import 'package:my_store/features/auth/login/data/models/login_request_model.dart';

class LoginQuery {
  LoginQuery._();

  static final LoginQuery instance = LoginQuery._();

  static Map<String, dynamic> loginQuery({required LoginRequestModel model}) {
    return {
      'query': r'''
        mutation Login($email: String!, $password: String!) {
          login(email: $email, password: $password) {
            access_token
            refresh_token
          }
        }
      ''',
      'variables': {
        'email': model.email,
        'password': model.password,
      },
    };
  }
}
