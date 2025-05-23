import 'package:my_store/features/auth/register/data/models/sighn_up_request_model.dart';

class SignUpQuery {
  SignUpQuery._();

  static SignUpQuery instance = SignUpQuery._();

  static Map<String, dynamic> signUpQuery({
    required SighnUpRequestModel model,
  }) {
    return {
      'query': r'''
        mutation SignUp($name: String! , $email: String! , $password: String! , $avatar: String!) {
          addUser(
              data: {
                name: $name
                email: $email
                password: $password
                avatar: $avatar
                role:customer
              }
    	      ){
                  id
                  name
                  email
                  avatar
                  role
             }       
        }
      ''',
      'variables': {
        'name': model.name,
        'email': model.email,
        'password': model.password,
        'avatar': model.avatar,
      },
    };
  }
}
