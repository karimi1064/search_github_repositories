import 'package:http/http.dart' as http;

class RepoDetailsRepository {
  static final RepoDetailsRepository _repoRepository =
      RepoDetailsRepository._();
  static const String _url = "api.github.com";
  static const int _perPage = 10;

  RepoDetailsRepository._();

  factory RepoDetailsRepository() {
    return _repoRepository;
  }

  static Future<dynamic> getRepoDetails({
    required String nameOfTheRepo,
    required String owner,
    required int page,
  }) async {
    try {
      final uri = Uri.https(_url, '/repos/$owner/$nameOfTheRepo/issues', {
        'state': 'open',
        'sort': 'created',
        'direction': 'asc',
        'page': page.toString(),
        'per_page': _perPage.toString()
      });

      return await http.get(uri);
    } catch (e) {
      return e.toString();
    }
  }
}
