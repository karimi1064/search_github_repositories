import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_github_repositories/src/screens/home/bloc/github_repo_bloc.dart';
import 'package:search_github_repositories/src/screens/home/model/repo_model.dart';
import 'package:search_github_repositories/src/screens/home/repository/repos_list_repository.dart';
import 'package:search_github_repositories/src/screens/repository_details/page/repository_details_page.dart';

import '../../../constants/string_constants.dart';
import '../../common_widget/app_refresh_search.dart';
import '../../common_widget/center_widget.dart';
import 'list_item.dart';

class GithubRepoList extends StatefulWidget {
  const GithubRepoList({Key? key}) : super(key: key);

  @override
  State<GithubRepoList> createState() => _GithubRepoListState();
}

class _GithubRepoListState extends State<GithubRepoList> {
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<RepoModel> _repositories = [];

  @override
  void dispose() {
    _searchQuery.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GithubRepoBloc(repoRepository: ReposListRepository()),
      child: BlocConsumer<GithubRepoBloc, GithubRepoState>(
        buildWhen: (_, currState) => (currState is RepoDetailsState ||
            currState is GithubRepoLoadingState ||
            currState is GithubRepoSuccessState ||
            currState is GithubRepoErrorState),
        listener: (context, repoState) async {
          var repoBloc = BlocProvider.of<GithubRepoBloc>(context);
          if (repoState is GithubRepoLoadingState) {
          } else if (repoState is GithubRepoErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(repoState.error)));
            repoBloc.isFetching = false;
          } else if (repoState is RepoDetailsState) {
            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return RepositoryDetailsPage(
                  repoModel: repoState.repo,
                );
              },
            ));
            if (_searchQuery.text.length > 3) {
              repoBloc.add(RepoFetchEvent(query: _searchQuery.text));
            }
          }
        },
        builder: (context, repoState) {
          final bloc = BlocProvider.of<GithubRepoBloc>(context);
          return Scaffold(
              key: key,
              appBar: AppBar(title: _buildSearchBox(bloc)),
              body: RefreshIndicator(
                  onRefresh: () async {
                    if (_searchQuery.text.length > 3) {
                      _repositories.clear();
                      bloc.add(const RepoInitialEvent());
                      bloc.add(RepoFetchEvent(query: _searchQuery.text));
                    }
                  },
                  child: buildBody(context, repoState)));
        },
      ),
    );
  }

  Widget _buildSearchBox(bloc) {
    return TextField(
      autofocus: true,
      controller: _searchQuery,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Padding(
              padding: EdgeInsetsDirectional.only(end: 16.0),
              child: Icon(
                Icons.search,
                color: Colors.white,
              )),
          hintText: searchRepo,
          hintStyle: TextStyle(color: Colors.white)),
      onChanged: (newValue) {
        if (newValue.length > 3) {
          _repositories.clear();
          bloc.add(const RepoInitialEvent());
          bloc.add(RepoFetchEvent(query: _searchQuery.text));
        }
      },
    );
  }

  Widget buildBody(BuildContext context, GithubRepoState state) {
    if (state is GithubRepoLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is GithubRepoSuccessState) {
      _repositories.addAll(state.repos);
      BlocProvider.of<GithubRepoBloc>(context).isFetching = false;
    } else if (state is GithubRepoErrorState &&
        _repositories.isNotEmpty &&
        _searchQuery.text.length > 3) {
      return AppRefreshSearch(
          onPressed: () {
            BlocProvider.of<GithubRepoBloc>(context)
              ..isFetching = true
              ..add(RepoFetchEvent(query: _searchQuery.text));
          },
          error: state.error);
    }
    return (_repositories.isEmpty)
        ? const CenterWidget(text: beginSearch)
        : _buildListView(context);
  }

  Widget _buildListView(context) {
    return ListView.builder(
        controller: _scrollController
          ..addListener(() {
            if (_scrollController.offset ==
                    _scrollController.position.maxScrollExtent &&
                !BlocProvider.of<GithubRepoBloc>(context).isFetching) {
              BlocProvider.of<GithubRepoBloc>(context)
                ..isFetching = true
                ..add(RepoFetchEvent(query: _searchQuery.text));
            }
          }),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        shrinkWrap: true,
        itemCount: _repositories.length,
        itemBuilder: (context, index) {
          return ListItem(_repositories[index]);
        });
  }
}
