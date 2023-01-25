part of 'github_repo_bloc.dart';

abstract class GithubRepoEvent extends Equatable {
  const GithubRepoEvent();

  @override
  List<Object> get props => [];
}

class RepoFetchEvent extends GithubRepoEvent {
  final String query;
  final bool isShowCircularProgress;

  const RepoFetchEvent(
      {required this.query, this.isShowCircularProgress = true});
}

class RepoInitialEvent extends GithubRepoEvent {
  const RepoInitialEvent();
}

class RepoDetailsEvent extends GithubRepoEvent {
  final RepoModel repo;

  const RepoDetailsEvent({required this.repo});
}
