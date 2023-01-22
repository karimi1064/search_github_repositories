import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repo_details_model.g.dart';

@JsonSerializable()
class RepoDetailsModel extends Equatable {
  final String? url;
  final String? title;
  final String? body;
  final String? createdAt;

  const RepoDetailsModel({this.url, this.title, this.body, this.createdAt});

  factory RepoDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$RepoDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RepoDetailsModelToJson(this);

  static List<RepoDetailsModel> mapJSONListToRepoDetailsList(
      List<dynamic> jsonList) {
    return jsonList.map((item) => RepoDetailsModel.fromJson(item)).toList();
  }

  @override
  List<Object?> get props => [url, title, body, createdAt];
}
