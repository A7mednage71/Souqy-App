import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/helpers/my_validator.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/features/auth/register/presentation/bloc/sighn_up_bloc.dart';

class UserNameTextFormField extends StatelessWidget {
  const UserNameTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 200,
      child: CustomTextField(
        controller: context.read<SighnUpBloc>().name,
        hintText: LocalizationKeys.fullName,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (!MyValidator.isNamevalidator(value!)) {
            return context.translate(LocalizationKeys.validName);
          }
          return null;
        },
      ),
    );
  }
}
