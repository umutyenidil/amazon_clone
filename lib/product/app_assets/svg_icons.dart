// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SvgIcons {
  amazon,
  eye,
  eye_slash,
  home_2,
  notification,
  profile_circle,
  search_normal_1,
  shopping_cart,
  placeholder,
}

enum SvgIconSizes {
  s,
  m,
  l,
  xl,
  xxl,
}

extension SvgIconSizeDouble on SvgIconSizes {
  double toDouble() {
    switch (this) {
      case SvgIconSizes.s:
        return 20.0;
      case SvgIconSizes.m:
        return 24.0;
      case SvgIconSizes.l:
        return 28.0;
      case SvgIconSizes.xl:
        return 32.0;
      case SvgIconSizes.xxl:
        return 36.0;
    }
  }
}

extension SvgIconPaths on SvgIcons {
  String get path {
    return 'assets/icons/svg/$name.svg';
  }

  Widget toWidget({
    SvgIconSizes size = SvgIconSizes.l,
    double width = 24,
    double height = 24,
    BoxFit fit = BoxFit.contain,
    Color? color,
  }) {
    if (size != SvgIconSizes.l && width != 24 && height != 24) {
      throw Exception("You can't set size and width-height at the same time");
    }

    if (this == SvgIcons.placeholder) {
      return SvgPicture.asset(
        SvgIcons.values[0].path,
        width: (width != 24) ? width : size.toDouble(),
        height: (height != 24) ? height : size.toDouble(),
        colorFilter: const ColorFilter.mode(Colors.transparent, BlendMode.srcIn),
      );
    }

    return SvgPicture.asset(
      path,
      width: (width != 24) ? width : size.toDouble(),
      height: (height != 24) ? height : size.toDouble(),
      fit: fit,
      colorFilter: (color != null) ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }

  // todo: dinamik hale getirilecek
  Widget toBadgedWidget({
    required String badgeText,
    TextStyle? badgeStyle,
    Color backgroundColor = Colors.grey,
    Alignment badgeAlignment = Alignment.topRight,
    SvgIconSizes size = SvgIconSizes.l,
    double width = 24,
    double height = 24,
    BoxFit fit = BoxFit.contain,
    Color? color,
  }) {
    if (size != SvgIconSizes.l && width != 24 && height != 24) {
      throw Exception("You can't set size and width-height at the same time");
    }

    SvgPicture icon = SvgPicture.asset(
      path,
      width: (width != 24) ? width : size.toDouble(),
      height: (height != 24) ? height : size.toDouble(),
      fit: fit,
      colorFilter: (color != null) ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );

    Text badge = Text(
      badgeText,
      style: badgeStyle ?? const TextStyle(color: Colors.white),
    );

    return SizedBox.square(
      dimension: size.toDouble() + 16,
      child: Stack(
        children: [
          Center(child: icon),
          Positioned(
            right: 0,
            top: -4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: ShapeDecoration(
                shape: badgeText.length > 1 ? const StadiumBorder() : const CircleBorder(),
                color: backgroundColor,
              ),
              child: badge,
            ),
          ),
        ],
      ),
    );
  }
}
