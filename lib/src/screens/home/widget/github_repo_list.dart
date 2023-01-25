import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_github_repositories/src/screens/home/bloc/github_repo_bloc.dart';
import 'package:search_github_repositories/src/screens/home/model/repo_model.dart';
import 'package:search_github_repositories/src/screens/home/repository/repos_list_repository_imp.dart';
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
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GithubRepoBloc(repoRepository: ReposListRepositoryImp(Dio())),
      child: BlocConsumer<GithubRepoBloc, GithubRepoState>(
        listener: (context, repoState) async {
          var repoBloc = BlocProvider.of<GithubRepoBloc>(context);
          if (repoState is GithubRepoInitialState) {
            _repositories.clear();
          } else if (repoState is GithubRepoSuccessState) {
            if (repoState.repos.isEmpty) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text(fetchAll)));
            } else {
              _repositories.addAll(repoState.repos);
            }
            BlocProvider.of<GithubRepoBloc>(context).isFetching = false;
          } else if (repoState is GithubRepoErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(repoState.error)));
            repoBloc.isFetching = false;
          } else if (repoState is RepoDetailsState) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return RepositoryDetailsPage(repoModel: repoState.repo);
              },
            )).then(
              (value) => repoBloc
                ..add(const RepoInitialEvent())
                ..isFetching = true
                ..add(RepoFetchEvent(query: _searchQuery.text)),
            );
          }
        },
        buildWhen: (_, state) => (state is GithubRepoLoadingState ||
            state is GithubRepoErrorState ||
            state is GithubRepoInitialState ||
            state is GithubRepoSuccessState),
        // do not need rebuild when state is RepoDetailsState
        builder: (context, repoState) {
          final bloc = BlocProvider.of<GithubRepoBloc>(context);
          return Scaffold(
              key: key,
              appBar: AppBar(title: _buildSearchBox(bloc)),
              body: RefreshIndicator(
                  onRefresh: () async {
                    _repositories.clear();
                    if (_searchQuery.text.length > 3) {
                      bloc
                        ..add(const RepoInitialEvent())
                        ..isFetching = true
                        ..add(RepoFetchEvent(query: _searchQuery.text));
                    }
                  },
                  child: _buildBody(context, repoState)));
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
        if (_repositories.isNotEmpty) {
          bloc.add(const RepoInitialEvent());
        }
        if (newValue.length > 3) {
          bloc
            ..isFetching = true
            ..add(RepoFetchEvent(query: _searchQuery.text));
        }
      },
    );
  }

  Widget _buildBody(BuildContext context, GithubRepoState state) {
    if (state is GithubRepoLoadingState && _repositories.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state is GithubRepoErrorState) {
      return AppRefreshSearch(
          onPressed: () => BlocProvider.of<GithubRepoBloc>(context)
            ..isFetching = true
            ..add(RepoFetchEvent(query: _searchQuery.text)),
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
