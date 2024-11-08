import 'package:flutter/material.dart';

class WarningDialog extends StatelessWidget {
  final Widget actionButton;
  final String title;
  final String message;
  final icon;
  final iconColor;

  const WarningDialog({
    super.key,
    required this.actionButton,
    required this.title,
    required this.message,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        height: 250,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 100,
              color: iconColor,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              message,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: actionButton,
            )
          ],
        ),
      ),
    );
  }
}
