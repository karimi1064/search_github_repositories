import 'package:flutter/material.dart';
import 'package:search_github_repositories/src/screens/repository_details/model/repo_details_model.dart';

import '../../common_widget/app_expandable_text.dart';

class IssuesItem extends StatelessWidget {
  final RepoDetailsModel repo;

  const IssuesItem(this.repo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              repo.title ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    child: ExpandableText(repo.body ?? ''),
                  ),
                ),
              ),
            ),
            Text(repo.createdAt ?? '',
                style: Theme.of(context).textTheme.caption),
          ],
        ),
      ),
    );
  }
}
