import 'package:flutter/material.dart';

showAlertDialog({
  required BuildContext context,
  required String message,
  String? btnText,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(btnText ?? "Ok"),
          ),
        ],
      );
    },
  );
}

showConfirmDialog({
  required BuildContext context,
  String? title,
  required String message,
  required String confirmBtnText,
  required String cancelBtnText,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title ?? ""),
        content: Text(message),
        actions: [
          TextButton(
            child: Text(cancelBtnText),
            onPressed: () {},
          ),
          TextButton(
            child: Text(confirmBtnText),
            onPressed: () {},
          )
        ],
      );
    },
  );
}
