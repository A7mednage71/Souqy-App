import 'package:flutter/material.dart';

class DeleteProductButton extends StatelessWidget {
  const DeleteProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.delete, color: Colors.red),
    );
  }
}
