import 'package:json_annotation/json_annotation.dart';

part 'repo_details_model.g.dart';

@JsonSerializable()
class RepoDetailsModel {
  final String? url;
  final String? title;
  final String? body;
  final String? createdAt;

  RepoDetailsModel(this.url, this.title, this.body, this.createdAt);

  factory RepoDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$RepoDetailsModelFromJson(json);

  static List<RepoDetailsModel> mapJSONStringToList(List<dynamic> jsonList) {
    return jsonList
        .map((r) =>
            RepoDetailsModel(r['url'], r['title'], r['body'], r['created_at']))
        .toList();
  }
}
