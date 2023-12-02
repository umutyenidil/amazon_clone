import 'package:amazon_clone/product/constants/app_border_radius.dart';
import 'package:amazon_clone/product/constants/app_padding.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;

  const TextInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: AppBorderRadius.instance.all16,
        ),
        hintText: hintText,
        contentPadding: AppPadding.instance.all16,
        isDense: true,
      ),
    );
  }
}
