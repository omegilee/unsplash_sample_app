import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'search.g.dart';

@JsonSerializable()
class SearchResponse {
  int? total;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  List<Result>? results;

  SearchResponse({this.total, this.totalPages, this.results});

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return _$SearchResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
