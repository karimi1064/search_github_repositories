import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_github_repositories/src/screens/home/model/repo_model.dart';

import '../../common_widget/app_expandable_text.dart';
import '../bloc/github_repo_bloc.dart';

class ListItem extends StatelessWidget {
  final RepoModel repo;

  const ListItem(this.repo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => BlocProvider.of<GithubRepoBloc>(context)
            .add(RepoDetailsEvent(repo)),
        highlightColor: Colors.grey,
        splashColor: Colors.white,
        child: Container(
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                repo.name ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      child: ExpandableText(repo.description ?? ''),
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(repo.owner ?? '',
                          style: Theme.of(context).textTheme.caption)),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.star_border,
                          color: Colors.white,
                        ),
                        Text('${repo.watchersCount} ',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.caption),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Text(repo.language ?? '',
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.caption)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
