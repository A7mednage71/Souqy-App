import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';

class CustomDropdownButtonFormField extends StatefulWidget {
  const CustomDropdownButtonFormField({
    required this.hint,
    required this.vaidationText,
    required this.items,
    super.key,
    this.onChanged,
    this.chosenValue,
  });
  final String hint;
  final String vaidationText;
  final List<String> items;
  final void Function(String?)? onChanged;
  final String? chosenValue;
  @override
  State<CustomDropdownButtonFormField> createState() =>
      _CustomDropdownButtonFormFieldState();
}

class _CustomDropdownButtonFormFieldState
    extends State<CustomDropdownButtonFormField> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: Text(
        widget.hint,
        style: const TextStyle(color: Colors.white),
      ),
      value: value ?? widget.chosenValue,
      iconSize: 30.r,
      iconEnabledColor: context.themeColors.textColor,
      style: context.textStyle.copyWith(
        fontSize: 14.sp,
        color: Colors.white,
      ),
      validator: (value) {
        if (value == null) {
          return widget.vaidationText;
        }
        return null;
      },
      iconDisabledColor: Colors.transparent,
      dropdownColor: ColorsDark.navBarDark,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: context.themeColors.textFormBorder!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: context.themeColors.textFormBorder!),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      items: widget.items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: widget.onChanged,
    );
  }
}
