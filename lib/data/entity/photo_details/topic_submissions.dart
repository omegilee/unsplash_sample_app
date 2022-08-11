import 'business_work.dart';

class TopicSubmissions {
	BusinessWork? businessWork;

	TopicSubmissions({this.businessWork});

	factory TopicSubmissions.fromJson(Map<String, dynamic> json) {
		return TopicSubmissions(
			businessWork: json['business-work'] == null
						? null
						: BusinessWork.fromJson(json['business-work'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'business-work': businessWork?.toJson(),
			};
}
