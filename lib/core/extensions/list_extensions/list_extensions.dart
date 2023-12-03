import 'package:flutter/material.dart';

extension SeperatorWidgetExtension on List {
  List<T> addHorizontalSeperator<T>({required Widget seperator}) {
    List li = [];

    forEach((element) {
      if (lastIndexOf(element) == length - 1) {
        return;
      }
      li.add(element);
      li.add(seperator);
    });

    return li as List<T>;
  }
}
