// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_submissions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicSubmissions _$TopicSubmissionsFromJson(Map<String, dynamic> json) =>
    TopicSubmissions(
      businessWork: json['business-work'] == null
          ? null
          : BusinessWork.fromJson(
              json['business-work'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopicSubmissionsToJson(TopicSubmissions instance) =>
    <String, dynamic>{
      'business-work': instance.businessWork,
    };
