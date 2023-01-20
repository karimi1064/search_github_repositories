import 'package:flutter/material.dart';

class AppRefreshSearch extends StatelessWidget {
  final Function()? onPressed;
  final String? error;

  const AppRefreshSearch({Key? key, this.onPressed, this.error})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.refresh),
          ),
          const SizedBox(height: 15),
          Text(error ?? '', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
