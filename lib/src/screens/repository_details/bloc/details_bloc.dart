
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_github_repositories/src/screens/repository_details/model/repo_details_model.dart';
import 'package:search_github_repositories/src/screens/repository_details/repository/repo_details_repository.dart';

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
        if (response is DioError) {
          emit(DetailsErrorState(error: response.message));
        } else {
          List<RepoDetailsModel> dataList =
              RepoDetailsModel.mapJSONListToRepoDetailsList(response);
          emit(
            DetailsSuccessState(
              repoDetails: dataList,
            ),
          );
        }
      } else if (event is RepoBackPressedEvent) {
        emit(const DetailsBackPressedState());
      }
    });
  }
}
