import 'package:flutter/material.dart';
import 'package:search_github_repositories/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark(),

      title: 'Repositories',
      onGenerateRoute: routes,
    );
  }
}
