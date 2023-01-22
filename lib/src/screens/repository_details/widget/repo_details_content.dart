import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_github_repositories/src/screens/repository_details/bloc/details_bloc.dart';
import 'package:search_github_repositories/src/screens/repository_details/model/repo_details_model.dart';
import 'package:search_github_repositories/src/screens/repository_details/repository/repo_details_repository_imp.dart';

import '../../../constants/string_constants.dart';
import '../../common_widget/app_refresh_search.dart';
import '../../common_widget/center_widget.dart';
import 'issues_item.dart';

class RepoDetailsContent extends StatefulWidget {
  final String owner;
  final String name;

  const RepoDetailsContent({Key? key, required this.owner, required this.name})
      : super(key: key);

  @override
  State<RepoDetailsContent> createState() => _RepoDetailsContentState();
}

class _RepoDetailsContentState extends State<RepoDetailsContent> {
  List<RepoDetailsModel> repoDetails = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailsBloc(repoDetailsRepository: RepoDetailsRepositoryImp()),
      child: BlocConsumer<DetailsBloc, DetailsState>(
        buildWhen: (_, currState) => (currState is DetailsInitialState ||
            currState is RepoDetailsState ||
            currState is DetailsLoadingState ||
            currState is DetailsSuccessState ||
            currState is DetailsBackPressedState ||
            currState is DetailsErrorState),
        listener: (context, state) async {
          var repoBloc = BlocProvider.of<DetailsBloc>(context);
          if (state is DetailsInitialState) {
            repoBloc.add(RepoDetailsFetchEvent(
                nameOfTheRepo: widget.name, ownerOfTheRepo: widget.owner));
          } else if (state is DetailsLoadingState) {
          } else if (state is DetailsErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
            repoBloc.isFetching = false;
          } else if (state is DetailsBackPressedState) {
            Navigator.of(context).pop();
          }
          // return;
        },
        builder: (context, state) {
          final bloc = BlocProvider.of<DetailsBloc>(context);
          return RefreshIndicator(
            onRefresh: () async {
              bloc.add(const RepoDetailsInitialEvent());
              bloc.add(RepoDetailsFetchEvent(
                  nameOfTheRepo: widget.name, ownerOfTheRepo: widget.owner));
            },
            child: buildBody(context, state, bloc),
          );
        },
      ),
    );
  }

  Widget buildBody(BuildContext context, DetailsState state, bloc) {
    if (state is DetailsLoadingState || state is DetailsInitialState) {
      BlocProvider.of<DetailsBloc>(context).add(RepoDetailsFetchEvent(
          nameOfTheRepo: widget.name, ownerOfTheRepo: widget.owner));
      return const Center(child: CircularProgressIndicator());
    } else if (state is DetailsSuccessState) {
      repoDetails = state.repoDetails;
      BlocProvider.of<DetailsBloc>(context).isFetching = false;
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    } else if (state is DetailsErrorState) {
      return AppRefreshSearch(
          onPressed: () {
            BlocProvider.of<DetailsBloc>(context)
              ..isFetching = true
              ..add(RepoDetailsFetchEvent(
                  nameOfTheRepo: widget.name, ownerOfTheRepo: widget.owner));
          },
          error: state.error);
    }
    return (repoDetails.isEmpty)
        ? const CenterWidget(text: notResultFound)
        : _buildListView(context);
  }

  Widget _buildListView(context) {
    return ListView.builder(
        controller: _scrollController
          ..addListener(() {
            if (_scrollController.offset ==
                    _scrollController.position.maxScrollExtent &&
                !BlocProvider.of<DetailsBloc>(context).isFetching) {
              BlocProvider.of<DetailsBloc>(context)
                ..isFetching = true
                ..add(RepoDetailsFetchEvent(
                    nameOfTheRepo: widget.name, ownerOfTheRepo: widget.owner));
            }
          }),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        shrinkWrap: true,
        itemCount: repoDetails.length,
        itemBuilder: (context, index) {
          return IssuesItem(repoDetails[index]);
        });
  }
}
