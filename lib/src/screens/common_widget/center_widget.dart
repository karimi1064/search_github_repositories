import 'package:flutter/material.dart';

class CenterWidget extends StatelessWidget {
  final String text;

  const CenterWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
