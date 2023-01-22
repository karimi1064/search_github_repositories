// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoModel _$RepoModelFromJson(Map<String, dynamic> json) => RepoModel(
      htmlUrl: json['url'] as String?,
      watchersCount: json['watchers_count'] as int?,
      language: json['language'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      owner: json['owner']['login'] as String?,
);

Map<String, dynamic> _$RepoModelToJson(RepoModel instance) => <String, dynamic>{
      'url': instance.htmlUrl,
      'watchers_count': instance.watchersCount,
      'language': instance.language,
      'description': instance.description,
      'name': instance.name,
      'owner': instance.owner,
};
