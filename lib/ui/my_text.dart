import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  const MyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
