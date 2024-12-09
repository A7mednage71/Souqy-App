import 'package:flutter/material.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/helpers/my_validator.dart';
import 'package:my_store/core/languages/localization_keys.dart';

class LoginEmailTextFormField extends StatelessWidget {
  const LoginEmailTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 200,
      child: CustomTextField(
        controller: TextEditingController(),
        hintText: LocalizationKeys.email,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (!MyValidator.isEmailValid(value!)) {
            return context.translate(LocalizationKeys.validEmail);
          }
          return null;
        },
      ),
    );
  }
}
