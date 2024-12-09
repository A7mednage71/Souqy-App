import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/auth/login/presentation/views/widgets/email_text_form_field.dart';
import 'package:my_store/features/auth/login/presentation/views/widgets/password_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.always;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const LoginEmailTextFormField(),
          SizedBox(
            height: 20.h,
          ),
          const LoginPasswordTextFormField(),
        ],
      ),
    );
  }
}
