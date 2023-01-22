import 'package:flutter_test/flutter_test.dart';
import 'package:search_github_repositories/src/screens/repository_details/model/repo_details_model.dart';
import 'package:search_github_repositories/src/screens/repository_details/repository/repo_details_repository.dart';

void main() {
  //test get request

  group('Get method', () {
    test('can be used to get repository details', () async {

      final response = await RepoDetailsRepository.getRepoDetails(nameOfTheRepo: 'ai_barcode_web', owner: 'pdliuw', page: 0);

      List<RepoDetailsModel> dataList =
      RepoDetailsModel.mapJSONListToRepoDetailsList(response);

      var expected = "[]";

      expect(dataList.toString(), equals(expected));
    });
  });
}