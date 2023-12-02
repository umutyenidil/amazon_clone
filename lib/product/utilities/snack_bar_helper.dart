import 'package:flutter/material.dart';

class SnackbarHelper {
  final BuildContext _context;

  SnackbarHelper._(BuildContext context) : _context = context;

  factory SnackbarHelper.of(BuildContext context) {
    return SnackbarHelper._(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(_context).showSnackBar(SnackBar(content: Text(message)));
  }

  void clearSnackBars(){
    ScaffoldMessenger.of(_context).clearSnackBars();
  }
}
