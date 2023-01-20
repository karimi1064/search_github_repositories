import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_github_repositories/src/screens/repository_details/model/repo_details_model.dart';
import 'package:search_github_repositories/src/screens/repository_details/repository/repo_details_repository.dart';
import 'package:http/http.dart' as http;

part 'details_event.dart';

part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final RepoDetailsRepository repoDetailsRepository;
  bool isFetching = false;
  int page = 0;

  DetailsBloc({
    required this.repoDetailsRepository,
  }) : super(const DetailsInitialState()) {
    on<DetailsEvent>((event, emit) async {
      if (event is RepoDetailsInitialEvent) {
        page = 0;
      } else if (event is RepoDetailsFetchEvent) {
        emit(const DetailsLoadingState());
        final response = await RepoDetailsRepository.getRepoDetails(
            page: page,
            nameOfTheRepo: event.nameOfTheRepo,
            owner: event.ownerOfTheRepo);
        if (response is http.Response) {
          if (response.statusCode == 200) {
            List<RepoDetailsModel> dataList =
                RepoDetailsModel.mapJSONStringToList(
                    json.decode(response.body) as List);
            emit(
              DetailsSuccessState(
                repoDetails: dataList,
              ),
            );
          } else {
            emit(DetailsErrorState(error: response.body));
          }
        } else if (response is String) {
          emit(DetailsErrorState(error: response));
        }
      } else if (event is RepoBackPressedEvent) {
        emit(const DetailsBackPressedState());
      }
    });
  }
}
