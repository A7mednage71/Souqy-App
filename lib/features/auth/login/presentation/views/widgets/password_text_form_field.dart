import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/helpers/my_validator.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/features/auth/login/presentation/bloc/login_bloc.dart';

class LoginPasswordTextFormField extends StatefulWidget {
  const LoginPasswordTextFormField({super.key});

  @override
  State<LoginPasswordTextFormField> createState() =>
      _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<LoginPasswordTextFormField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 300,
      child: CustomTextField(
        controller: context.read<LoginBloc>().password,
        hintText: LocalizationKeys.password,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        suffixIcon: GestureDetector(
          child: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
          onTap: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
        validator: (value) {
          if (!MyValidator.isEmailValid(value ?? '')) {
            return context.translate(LocalizationKeys.validPasswrod);
          }
          return null;
        },
      ),
    );
  }
}
