import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/helpers/my_validator.dart';
import 'package:my_store/core/languages/localization_keys.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.always;
  GlobalKey<FormState> formKey = GlobalKey();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomFadeInRight(
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
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: TextEditingController(),
              hintText: LocalizationKeys.password,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              suffixIcon: GestureDetector(
                child:
                    Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
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
          ),
        ],
      ),
    );
  }
}
