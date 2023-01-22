abstract class ReposListRepository {
  Future<dynamic> getRepos({required String query, required int page});
}
