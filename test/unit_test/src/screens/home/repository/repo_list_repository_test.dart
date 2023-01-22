import 'package:flutter_test/flutter_test.dart';
import 'package:search_github_repositories/src/screens/home/model/repo_model.dart';
import 'package:search_github_repositories/src/screens/home/repository/repos_list_repository.dart';

void main() {
  //test get request

  group('Get method', () {
    test('can be used to get repositories', () async {

      final response = await ReposListRepository.getRepos(query: 'ai_barcode_web', page: 0);
      List<RepoModel> dataList =
      RepoModel.mapJSONListToRepoList(response['items']);

      var expected = '[RepoModel(https://api.github.com/repos/pdliuw/ai_barcode_web, 3, Dart, support "ai_barcode" plugin web platform, ai_barcode_web, pdliuw), RepoModel(https://api.github.com/repos/liangzemian/ai_barcode_web, 0, JavaScript, null, ai_barcode_web, liangzemian)]';

      expect(dataList.toString(), equals(expected));
    });
  });
}