
abstract class RepoDetailsRepository {
  Future<dynamic> getRepoDetails({
    required String nameOfTheRepo,
    required String owner,
    required int page,
  });
}
