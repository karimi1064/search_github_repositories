// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoDetailsModel _$RepoDetailsModelFromJson(Map<String, dynamic> json) =>
    RepoDetailsModel(
      url: json['url'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$RepoDetailsModelToJson(RepoDetailsModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'body': instance.body,
      'created_at': instance.createdAt,
    };
