import 'package:amazon_clone/product/constants/app_border_radius.dart';
import 'package:flutter/material.dart';

class FormSubmitButton extends ElevatedButton {
  FormSubmitButton({super.key, required super.onPressed, required super.child})
      : super(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: AppBorderRadius.instance.all16,
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
        );
}
