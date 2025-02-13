import 'package:flutter/material.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';

class SearchForUser extends StatelessWidget {
  const SearchForUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: TextEditingController(),
      hintText: 'Search for users',
      suffixIcon: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.clear,
          color: Colors.blue,
        ),
      ),
    );
  }
}
