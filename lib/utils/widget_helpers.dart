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
      margin: EdgeInsets.all(16),
      duration: Duration(seconds: 3),
      overlayBlur: 4,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      icon: snackbarType == SnackbarType.error
          ? Icon(
              Icons.error,
              color: Colors.white,
            )
          : snackbarType == SnackbarType.info
              ? Icon(Icons.info, color: Colors.white)
              : snackbarType == SnackbarType.warning
                  ? Icon(Icons.warning, color: Colors.white)
                  : Icon(Icons.check, color: Colors.white),
      backgroundColor: snackbarType == SnackbarType.error
          ? Colors.red.withOpacity(0.8)
          : snackbarType == SnackbarType.info
              ? Colors.blue
              : snackbarType == SnackbarType.warning
                  ? Colors.orange.withOpacity(0.6)
                  : Colors.green,
      barBlur: 0.3,
    );
  }
}
