import 'package:amazon_clone/product/constants/app_border_radius.dart';
import 'package:amazon_clone/product/constants/app_padding.dart';
import 'package:flutter/material.dart';

typedef ValidatorCallback = String? Function(String? value)?;

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final ValidatorCallback validator;
  final int? minLines;
  final int? maxLines;

  const TextInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.inputType = TextInputType.text,
    this.validator,
    this.minLines,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      minLines: minLines,
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
      validator: validator,
    );
  }
}
