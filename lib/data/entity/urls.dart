import 'package:json_annotation/json_annotation.dart';

part 'urls.g.dart';

@JsonSerializable()
class Urls {
	String? raw;
	String? full;
	String? regular;
	String? small;
	String? thumb;
	@JsonKey(name: 'small_s3') 
	String? smallS3;

	Urls({
		this.raw, 
		this.full, 
		this.regular, 
		this.small, 
		this.thumb, 
		this.smallS3, 
	});

	factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

	Map<String, dynamic> toJson() => _$UrlsToJson(this);
}
