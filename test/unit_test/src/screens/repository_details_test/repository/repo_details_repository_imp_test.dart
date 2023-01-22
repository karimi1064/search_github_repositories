import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:search_github_repositories/src/screens/repository_details/repository/repo_details_repository_imp.dart';

import '../../home/repository/repo_list_repository_imp_test.mocks.dart';

@GenerateMocks([Dio])
Future<void> main() async {
  MockDio mockDio = MockDio();
  late RepoDetailsRepositoryImp repoDetails;

  var options = BaseOptions(
    baseUrl: 'https://api.github.com',
    connectTimeout: 20000,
    receiveTimeout: 18000,
  );

  var response = '';

  setUp(() {
    repoDetails = RepoDetailsRepositoryImp();
    mockDio.options = options;
  });

  test('Successfully fetch repo details', () async {
    when(mockDio.get('/repos/pdliuw/ai_barcode_web/issues', queryParameters: {
      'state': 'open',
      'sort': 'created',
      'direction': 'asc',
      'page': '0',
      'per_page': '10'
    }).whenComplete(() => response));

    var expected = [];

    expect(
      await repoDetails.getRepoDetails(
          nameOfTheRepo: 'ai_barcode_web', owner: 'pdliuw', page: 0),
      expected,
    );
  });
}
