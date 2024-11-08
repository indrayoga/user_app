import 'package:flutter/material.dart';

class ItemInformation extends StatelessWidget {
  const ItemInformation({
    super.key,
    required this.icon,
    required this.title,
  });

  final icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
