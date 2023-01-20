import 'package:flutter/material.dart';
import 'package:search_github_repositories/src/screens/repository_details/widget/repo_details_content.dart';

import '../../home/model/repo_model.dart';

class RepositoryDetailsPage extends StatelessWidget {
  final RepoModel? repoModel;

  const RepositoryDetailsPage({Key? key, this.repoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(repoModel?.name ?? '')),
      body: RepoDetailsContent(
          owner: repoModel?.owner ?? '', name: repoModel?.name ?? ''),
    );
  }
}
