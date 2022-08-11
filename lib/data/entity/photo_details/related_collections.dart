import 'result.dart';

class RelatedCollections {
	int? total;
	String? type;
	List<Result>? results;

	RelatedCollections({this.total, this.type, this.results});

	factory RelatedCollections.fromJson(Map<String, dynamic> json) {
		return RelatedCollections(
			total: json['total'] as int?,
			type: json['type'] as String?,
			results: (json['results'] as List<dynamic>?)
						?.map((e) => Result.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'total': total,
				'type': type,
				'results': results?.map((e) => e.toJson()).toList(),
			};
}
