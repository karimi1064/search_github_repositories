import 'package:json_annotation/json_annotation.dart';

part 'repo_model.g.dart';

@JsonSerializable()
class RepoModel {
  final String? htmlUrl;
  final int? watchersCount;
  final String? language;
  final String? description;
  final String? name;
  final String? owner;

  RepoModel(this.htmlUrl, this.watchersCount, this.language, this.description,
      this.name, this.owner);

  factory RepoModel.fromJson(Map<String, dynamic> json) =>
      _$RepoModelFromJson(json);

  static List<RepoModel> mapJSONStringToList(List<dynamic> jsonList) {
    return jsonList
        .map((r) => RepoModel(r['url'], r['watchers_count'], r['language'],
            r['description'], r['name'], r['owner']['login']))
        .toList();
  }
}
