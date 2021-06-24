import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:taekwondo_app/shared/shared.dart';

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
      overlayBlur: 3,
      snackPosition: SnackPosition.TOP,
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

  static showConfirmDialog(
    BuildContext context, {
    @required String? title,
    @required String? message,
    @required String? confirmText,
    @required String? cancelText,
    @required VoidCallback? onConfirm,
    @required VoidCallback? onCancel,
  }) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: title ?? '',
      desc: message,
      style: AlertStyle(titleStyle: normalDark2, descStyle: normalDark1),
      buttons: [
        DialogButton(
          child: Text(
            cancelText ?? 'Batal',
            style: normalLight1,
          ),
          onPressed: onCancel,
          color: Colors.grey,
        ),
        DialogButton(
          child: Text(
            confirmText ?? 'Konfirmasi',
            style: normalLight1,
          ),
          onPressed: onConfirm,
          gradient: LinearGradient(
              colors: [primaryColor, midColor, secondaryColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
      ],
    ).show();
  }
}
