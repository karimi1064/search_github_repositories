part of 'details_bloc.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

class DetailsInitialState extends DetailsState {
  const DetailsInitialState();
}

class DetailsLoadingState extends DetailsState {
  const DetailsLoadingState();
}

class DetailsSuccessState extends DetailsState {
  final List<RepoDetailsModel> repoDetails;

  const DetailsSuccessState({required this.repoDetails});
}

class DetailsErrorState extends DetailsState {
  final String error;

  const DetailsErrorState({required this.error});
}

class DetailsBackPressedState extends DetailsState {
  const DetailsBackPressedState();
}
