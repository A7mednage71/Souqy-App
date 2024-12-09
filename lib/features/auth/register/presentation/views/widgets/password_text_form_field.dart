import 'package:flutter/material.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/helpers/my_validator.dart';
import 'package:my_store/core/languages/localization_keys.dart';

class SighnUpPasswordTextFormField extends StatefulWidget {
  const SighnUpPasswordTextFormField({super.key});

  @override
  State<SighnUpPasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<SighnUpPasswordTextFormField> {
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
