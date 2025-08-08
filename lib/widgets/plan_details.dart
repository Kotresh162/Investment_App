
import 'package:flutter/material.dart';

Widget buildCustomLayout(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 252,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          height: 758,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ],
    ),
  );
}
