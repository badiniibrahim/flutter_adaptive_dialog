import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveAlertDialog {
  /// Displays an adaptive alert dialog for both Android and iOS.
  ///
  /// [context] is the BuildContext to show the dialog.
  /// [title] is the title of the dialog.
  /// [content] is the content/message of the dialog.
  /// [confirmText] is the text for the confirmation button.
  /// [cancelText] is the text for the cancellation button. If null, the cancel button will not be displayed.
  /// [titleStyle] is the optional style for the title text.
  /// [contentStyle] is the optional style for the content text.
  /// [confirmButtonStyle] is the optional style for the confirmation button text.
  /// [cancelButtonStyle] is the optional style for the cancellation button text.
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String content,
    required String confirmText,
    String? cancelText,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    TextStyle? confirmButtonStyle,
    TextStyle? cancelButtonStyle,
  }) async {
    // Check the platform and show the respective dialog
    if (Platform.isIOS) {
      return await showCupertinoDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(title, style: titleStyle),
            content: Text(content, style: contentStyle),
            actions: [
              if (cancelText != null)
                CupertinoDialogAction(
                  child: Text(cancelText, style: cancelButtonStyle),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              CupertinoDialogAction(
                child: Text(confirmText, style: confirmButtonStyle),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
    } else {
      return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title, style: titleStyle),
            content: Text(content, style: contentStyle),
            actions: [
              if (cancelText != null)
                TextButton(
                  child: Text(cancelText, style: cancelButtonStyle),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              TextButton(
                child: Text(confirmText, style: confirmButtonStyle),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
    }
  }
}
