// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      promotedAt: json['promoted_at'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      color: json['color'] as String?,
      blurHash: json['blur_hash'] as String?,
      description: json['description'] as String?,
      altDescription: json['alt_description'] as String?,
      urls: json['urls'] == null
          ? null
          : Urls.fromJson(json['urls'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      categories: json['categories'] as List<dynamic>?,
      likes: json['likes'] as int?,
      likedByUser: json['liked_by_user'] as bool?,
      currentUserCollections:
          json['current_user_collections'] as List<dynamic>?,
      sponsorship: json['sponsorship'],
      topicSubmissions: json['topic_submissions'] == null
          ? null
          : TopicSubmissions.fromJson(
              json['topic_submissions'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'promoted_at': instance.promotedAt,
      'width': instance.width,
      'height': instance.height,
      'color': instance.color,
      'blur_hash': instance.blurHash,
      'description': instance.description,
      'alt_description': instance.altDescription,
      'urls': instance.urls,
      'links': instance.links,
      'categories': instance.categories,
      'likes': instance.likes,
      'liked_by_user': instance.likedByUser,
      'current_user_collections': instance.currentUserCollections,
      'sponsorship': instance.sponsorship,
      'topic_submissions': instance.topicSubmissions,
      'user': instance.user,
    };
