import 'package:json_annotation/json_annotation.dart';

part 'business_work.g.dart';

@JsonSerializable()
class BusinessWork {
	String? status;
	@JsonKey(name: 'approved_on') 
	String? approvedOn;

	BusinessWork({this.status, this.approvedOn});

	factory BusinessWork.fromJson(Map<String, dynamic> json) {
		return _$BusinessWorkFromJson(json);
	}

	Map<String, dynamic> toJson() => _$BusinessWorkToJson(this);
}
