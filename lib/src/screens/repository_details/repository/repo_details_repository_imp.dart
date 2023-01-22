import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:search_github_repositories/src/screens/repository_details/repository/repo_details_repository.dart';

class RepoDetailsRepositoryImp extends RepoDetailsRepository {
  static const String _url = "https://api.github.com";
  static const int _perPage = 10;
  Dio dio = Dio();

  RepoDetailsRepositoryImp();

  @override
  Future<dynamic> getRepoDetails({
    required String nameOfTheRepo,
    required String owner,
    required int page,
  }) async {
    var options = BaseOptions(
      baseUrl: _url,
      connectTimeout: 20000,
      receiveTimeout: 18000,
    );

    dio.options = options;

    try {
      var response = await dio
          .get('/repos/$owner/$nameOfTheRepo/issues', queryParameters: {
        'state': 'open',
        'sort': 'created',
        'direction': 'asc',
        'page': page.toString(),
        'per_page': _perPage.toString()
      });

      if (kDebugMode) {
        print(response.data.toString());
      }

      return response.data;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        if (kDebugMode) {
          print(e.response?.data);
        }
        if (kDebugMode) {
          print(e.response?.headers);
        }
        if (kDebugMode) {
          print(e.response?.requestOptions);
        }
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        if (kDebugMode) {
          print(e.requestOptions);
        }
        if (kDebugMode) {
          print(e.message);
        }
      }
      return e;
    }
  }
}
