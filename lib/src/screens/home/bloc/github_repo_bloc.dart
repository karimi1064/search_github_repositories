import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_github_repositories/src/screens/home/model/repo_model.dart';

import '../repository/repos_list_repository.dart';
import 'package:http/http.dart' as http;

part 'github_repo_event.dart';

part 'github_repo_state.dart';

class GithubRepoBloc extends Bloc<GithubRepoEvent, GithubRepoState> {
  final ReposListRepository repoRepository;
  int page = 0;
  bool isFetching = false;

  GithubRepoBloc({
    required this.repoRepository,
  }) : super(const GithubRepoInitialState()) {
    on<GithubRepoEvent>((event, emit) async {
      if (event is RepoInitialEvent) {
        page = 0;
      } else if (event is RepoFetchEvent) {
        emit(const GithubRepoLoadingState());

        final response = await ReposListRepository.getRepos(
          page: page,
          query: event.query,
        );
        if (response is http.Response) {
          if (response.statusCode == 200) {
            List<RepoModel> dataList = RepoModel.mapJSONStringToList(
                json.decode(response.body)['items'] as List);
            emit(
              GithubRepoSuccessState(
                repos: dataList,
              ),
            );
            page++;
          } else {
            emit(GithubRepoErrorState(error: response.body));
          }
        } else if (response is String) {
          emit(GithubRepoErrorState(error: response));
        }
      } else if (event is RepoDetailsEvent) {
        emit(RepoDetailsState(repo: event.repo));
      }
    });
  }
}