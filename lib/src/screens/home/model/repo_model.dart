import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repo_model.g.dart';

@JsonSerializable()
class RepoModel extends Equatable {
  @JsonKey(name: 'url')
  final String? htmlUrl;

  @JsonKey(name: 'watchers_count')
  final int? watchersCount;
  final String? language;
  final String? description;
  final String? name;
  final String? owner;

  const RepoModel(
      {this.htmlUrl,
      this.watchersCount,
      this.language,
      this.description,
      this.name,
      this.owner
      });

  factory RepoModel.fromJson(Map<String, dynamic> json) =>
      _$RepoModelFromJson(json);

  Map<String, dynamic> toJson() => _$RepoModelToJson(this);

  static List<RepoModel> mapJSONListToRepoList(List<dynamic> jsonList) {
    return jsonList.map((item) => RepoModel.fromJson(item)).toList();
  }

  @override
  List<Object?> get props =>
      [htmlUrl, watchersCount, language, description, name, owner];
}
