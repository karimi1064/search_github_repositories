import 'package:flutter/material.dart';

import '../../../constants/string_constants.dart';
import '../widget/github_repo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(title: const Text(appBarTitle)),
        body: const GithubRepoList(),
      ),
      onWillPop: () async => false,
    );
  }
}
