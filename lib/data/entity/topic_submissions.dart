import 'package:json_annotation/json_annotation.dart';

import 'business_work.dart';

part 'topic_submissions.g.dart';

@JsonSerializable()
class TopicSubmissions {
  @JsonKey(name: 'business-work')
  BusinessWork? businessWork;

  TopicSubmissions({this.businessWork});

  factory TopicSubmissions.fromJson(Map<String, dynamic> json) {
    return _$TopicSubmissionsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopicSubmissionsToJson(this);
}
