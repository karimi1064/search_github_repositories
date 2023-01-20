import 'package:http/http.dart' as http;

class ReposListRepository {
  static final ReposListRepository _repoRepository = ReposListRepository._();
  static const int _perPage = 10;
  static const String _url = "api.github.com";

  ReposListRepository._();

  factory ReposListRepository() {
    return _repoRepository;
  }

  static Future<dynamic> getRepos({
    required String query,
    required int page,
  }) async {
    try {
      final uri = Uri.https(_url, '/search/repositories', {
        'q': query,
        'sort': 'name',
        'order': 'asc',
        'page': page.toString(),
        'per_page': _perPage.toString()
      });

      return await http.get(uri);
    } catch (e) {
      return e.toString();
    }
  }
}
