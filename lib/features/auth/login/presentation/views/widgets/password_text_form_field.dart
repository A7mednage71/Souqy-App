import 'package:flutter/material.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/helpers/my_validator.dart';
import 'package:my_store/core/languages/localization_keys.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key});

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 300,
      child: CustomTextField(
        controller: TextEditingController(),
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
          if (!MyValidator.isEmailValid(value!)) {
            return context.translate(LocalizationKeys.validPasswrod);
          }
          return null;
        },
      ),
    );
  }
}
