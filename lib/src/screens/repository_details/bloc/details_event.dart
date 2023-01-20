part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class RepoDetailsFetchEvent extends DetailsEvent {
  final String nameOfTheRepo;
  final String ownerOfTheRepo;

  const RepoDetailsFetchEvent(
      {required this.nameOfTheRepo, required this.ownerOfTheRepo});
}

class RepoDetailsInitialEvent extends DetailsEvent {
  const RepoDetailsInitialEvent();
}

class RepoBackPressedEvent extends DetailsEvent {
  const RepoBackPressedEvent();
}
