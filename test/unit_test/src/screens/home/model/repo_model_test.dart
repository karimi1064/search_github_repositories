import 'package:flutter_test/flutter_test.dart';
import 'package:search_github_repositories/src/screens/home/model/repo_model.dart';

void main() {
  Map<String, dynamic> repoOneAsJson = {
    "url": "https://api.github.com/users/pdliuw",
    "watchers_count": 3,
    "language": "Dart",
    "description": "support ai_barcode plugin web platform",
    "name": "ai_barcode_web",
    "owner": {"login": "pdliuw"}
  };

  RepoModel expectedRepoOne = const RepoModel(
    htmlUrl: "https://api.github.com/users/pdliuw",
    watchersCount: 3,
    language: "Dart",
    description: "support ai_barcode plugin web platform",
    name: "ai_barcode_web",
    owner: 'pdliuw',
  );

  Map<String, dynamic> repoTwoAsJson = {
    "url": "https://api.github.com/repos/ToneoAn/AiBarcode",
    "watchers_count": 0,
    "language": "JavaScript",
    "description": "Testando o AiBarcode",
    "name": "AiBarcode",
    "owner": {"login": "ToneoAn"}
  };

  RepoModel expectedRepoTwo = const RepoModel(
      htmlUrl: "https://api.github.com/repos/ToneoAn/AiBarcode",
      watchersCount: 0,
      language: "JavaScript",
      description: "Testando o AiBarcode",
      name: "AiBarcode",
      owner: "ToneoAn");

  List<dynamic> repoListAsJson = [
    {
      "url": "https://api.github.com/users/pdliuw",
      "watchers_count": 3,
      "language": "Dart",
      "description": "support ai_barcode plugin web platform",
      "name": "ai_barcode_web",
      "owner": {"login": "pdliuw"}
    },
    {
      "url": "https://api.github.com/repos/ToneoAn/AiBarcode",
      "watchers_count": 0,
      "language": "JavaScript",
      "description": "Testando o AiBarcode",
      "name": "AiBarcode",
      "owner": {"login": "ToneoAn"}
    }
  ];

  List<RepoModel> expectedRepoList = [
    const RepoModel(
        htmlUrl: "https://api.github.com/users/pdliuw",
        watchersCount: 3,
        language: "Dart",
        description: "support ai_barcode plugin web platform",
        name: "ai_barcode_web",
        owner: 'pdliuw'),
    const RepoModel(
        htmlUrl: "https://api.github.com/repos/ToneoAn/AiBarcode",
        watchersCount: 0,
        language: "JavaScript",
        description: "Testando o AiBarcode",
        name: "AiBarcode",
        owner: "ToneoAn")
  ];

  group("Test RepoModel initialization from JSON", () {
    test('Test using json one', () {
      expect(RepoModel.fromJson(repoOneAsJson), expectedRepoOne);
    });
    test('Test using json two', () {
      expect(RepoModel.fromJson(repoTwoAsJson), expectedRepoTwo);
    });
  });

  group("Test mapJSONList To RepoList", () {
    test('Test mapJSONListToRepoList using json one', () {
      expect(RepoModel.mapJSONListToRepoList(repoListAsJson),
          expectedRepoList);
    });
  });
}
