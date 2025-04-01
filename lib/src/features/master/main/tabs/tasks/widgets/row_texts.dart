import 'package:flutter/material.dart';

class RowTexts extends StatelessWidget {
  final String text1;
  final String text2;
  const RowTexts({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
            child: Text(
              text1,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
            child: Text(
              text2,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),
              textAlign: TextAlign.end,
            ),
          ),
        ])
      ],
    );
  }
}
