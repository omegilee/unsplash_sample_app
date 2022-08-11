import 'package:json_annotation/json_annotation.dart';

import 'links.dart';
import 'topic_submissions.dart';
import 'urls.dart';
import 'user.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  String? id;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'promoted_at')
  String? promotedAt;
  int? width;
  int? height;
  String? color;
  @JsonKey(name: 'blur_hash')
  String? blurHash;
  String? description;
  @JsonKey(name: 'alt_description')
  String? altDescription;
  Urls? urls;
  Links? links;
  List<dynamic>? categories;
  int? likes;
  @JsonKey(name: 'liked_by_user')
  bool? likedByUser;
  @JsonKey(name: 'current_user_collections')
  List<dynamic>? currentUserCollections;
  dynamic sponsorship;
  @JsonKey(name: 'topic_submissions')
  TopicSubmissions? topicSubmissions;
  User? user;

  Result({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.categories,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
    this.user,
  });

  double imageRatio() {
    final w = width;
    final h = height;
    if (w != null && h != null) {
      return w.toDouble() / h.toDouble();
    }
    return 1.0;
  }

  String toSnsName() {
    final items = List<String>.empty(growable: true);

    final instagram = user?.social?.instagramUsername ?? "";
    final twitter = user?.social?.twitterUsername ?? "";

    if (instagram.isNotEmpty) {
      items.add(instagram);
    }
    if (twitter.isNotEmpty) {
      items.add(twitter);
    }
    return items.join(",");
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
