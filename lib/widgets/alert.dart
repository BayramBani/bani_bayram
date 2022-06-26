import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

void mySnackBar(BuildContext context, String message, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppTheme.theme.textTheme.subtitle2!
            .merge(TextStyle(color: AppTheme.theme.colorScheme.onPrimary)),
      ),
      backgroundColor: color ?? AppTheme.theme.colorScheme.primary,
    ),
  );
}

void myFloatingSnackBar(BuildContext context, String message, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message,
          style: TextStyle(color: AppTheme.theme.colorScheme.onPrimary)),
      backgroundColor: color ?? AppTheme.theme.colorScheme.primary,
      behavior: SnackBarBehavior.floating,
    ),
  );
}

void myAlertDialog(
    {required BuildContext context, required String message, required Function onAccept}) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(message),
      //content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text('Oui'),
          onPressed: () {
            onAccept();
            Navigator.pop(context, 'yes');
          },
        ),
        TextButton(
          child: const Text('Non'),
          onPressed: () {
            Navigator.pop(context, 'no');
          },
        ),
      ],
    ),
  );
}
