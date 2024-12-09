import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/auth/register/presentation/views/widgets/email_text_form_field.dart';
import 'package:my_store/features/auth/register/presentation/views/widgets/password_text_form_field.dart';
import 'package:my_store/features/auth/register/presentation/views/widgets/user_name_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<SignUpForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.always;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const UserNameTextFormField(),
          SizedBox(
            height: 20.h,
          ),
          const SighnUpEmailTextFormField(),
          SizedBox(
            height: 20.h,
          ),
          const SighnUpPasswordTextFormField(),
        ],
      ),
    );
  }
}
