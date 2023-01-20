// routes for the app

import 'package:flutter/material.dart';
import 'package:search_github_repositories/src/screens/repository_details/page/repository_details_page.dart';

import '../screens/home/page/home_page.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
    case '/home':
      return MaterialPageRoute(builder: (_) => const HomePage());
    case '/details':
      return MaterialPageRoute(builder: (_) => const RepositoryDetailsPage());
    default:
      return MaterialPageRoute(builder: (_) => const HomePage());
  }
}
