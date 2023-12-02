// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SvgIcons {
  eye,
  eye_slash,
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
        return 8.0;
      case SvgIconSizes.m:
        return 12.0;
      case SvgIconSizes.l:
        return 16.0;
      case SvgIconSizes.xl:
        return 20.0;
      case SvgIconSizes.xxl:
        return 24.0;
    }
  }
}

extension SvgIconPaths on SvgIcons {
  String get path {
    return 'assets/icons/svg/$name.svg';
  }

  Widget toWidget({SvgIconSizes size = SvgIconSizes.l, double width = 24, double height = 24, BoxFit fit = BoxFit.contain, Color? color}) {
    if (size != SvgIconSizes.l && width != 24 && height != 24) {
      throw Exception("You can't set size and width-height at the same time");
    }

    return SvgPicture.asset(
      path,
      width: (width != 24) ? width : size.toDouble(),
      height: (height != 24) ? height : size.toDouble(),
      fit: fit,
      colorFilter: (color != null) ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }
}
