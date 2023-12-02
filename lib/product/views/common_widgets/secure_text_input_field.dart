import 'package:amazon_clone/product/app_assets/svg_icons.dart';
import 'package:amazon_clone/product/constants/app_border_radius.dart';
import 'package:amazon_clone/product/constants/app_padding.dart';
import 'package:flutter/material.dart';

class SecureTextInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const SecureTextInputField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  State<SecureTextInputField> createState() => _SecureTextInputFieldState();
}

class _SecureTextInputFieldState extends State<SecureTextInputField> {
  late bool _isSecure;

  @override
  void initState() {
    super.initState();

    _isSecure = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isSecure,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: AppBorderRadius.instance.all16,
        ),
        hintText: widget.hintText,
        suffixIcon: Padding(
          padding: AppPadding.instance.r8,
          child: InkWell(
            onTap: _toggleVisibility,
            child: Padding(
              padding: AppPadding.instance.all8,
              child: _isSecure
                  ? SvgIcons.eye.toWidget(size: SvgIconSizes.xxl)
                  : SvgIcons.eye_slash.toWidget(
                      size: SvgIconSizes.xxl,
                    ),
            ),
          ),
        ),
        suffixIconConstraints: const BoxConstraints(),
        contentPadding: AppPadding.instance.all16,
        isDense: true,
      ),
    );
  }

  void _toggleVisibility() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }
}
