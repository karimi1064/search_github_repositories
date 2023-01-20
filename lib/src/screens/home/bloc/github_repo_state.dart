part of 'github_repo_bloc.dart';

abstract class GithubRepoState extends Equatable {
  const GithubRepoState();

  @override
  List<Object> get props => [];
}

class GithubRepoInitialState extends GithubRepoState {
  const GithubRepoInitialState();
}

class GithubRepoLoadingState extends GithubRepoState {
  const GithubRepoLoadingState();
}

class RepoDetailsState extends GithubRepoState {
  final RepoModel repo;

  const RepoDetailsState({required this.repo});
}

class GithubRepoSuccessState extends GithubRepoState {
  final List<RepoModel> repos;

  const GithubRepoSuccessState({required this.repos});

  @override
  List<Object> get props => repos;
}

class GithubRepoErrorState extends GithubRepoState {
  final String error;

  const GithubRepoErrorState({required this.error});
}
