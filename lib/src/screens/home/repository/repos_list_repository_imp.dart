import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:search_github_repositories/src/screens/home/repository/repos_list_repository.dart';

class ReposListRepositoryImp extends ReposListRepository {
  final int _perPage = 10;
  final String _url = "https://api.github.com";
  final Dio _dio;

  ReposListRepositoryImp(this._dio);

  @override
  Future<dynamic> getRepos({required String query, required int page}) async {
    var options = BaseOptions(
      baseUrl: _url,
      connectTimeout: 20000,
      receiveTimeout: 18000,
    );

    _dio.options = options;

    try {
      var response = await _dio.get('/search/repositories', queryParameters: {
        'q': query,
        'sort': 'name',
        'order': 'asc',
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
