import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackbarType { error, warning, success, info }

class WidgetHelpers {

  // Snackbar
  static snackbar(BuildContext context, SnackbarType snackbarType,
      {String title = "", String message = ""}) {
    Get.snackbar(
      title,
      message,
      duration: Duration(seconds: 3),
      icon: snackbarType == SnackbarType.error
          ? Icon(Icons.error)
          : snackbarType == SnackbarType.info
              ? Icon(Icons.info)
              : snackbarType == SnackbarType.warning
                  ? Icon(Icons.warning)
                  : Icon(Icons.check),
      backgroundColor: snackbarType == SnackbarType.error
          ? Colors.red
          : snackbarType == SnackbarType.info
              ? Colors.blue
              : snackbarType == SnackbarType.warning
                  ? Colors.orange
                  : Colors.green,
      barBlur: 0.3,
    );
  }
}
