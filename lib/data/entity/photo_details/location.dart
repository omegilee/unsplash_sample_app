import 'position.dart';

class Location {
	String? title;
	String? name;
	String? city;
	String? country;
	Position? position;

	Location({this.title, this.name, this.city, this.country, this.position});

	factory Location.fromJson(Map<String, dynamic> json) => Location(
				title: json['title'] as String?,
				name: json['name'] as String?,
				city: json['city'] as String?,
				country: json['country'] as String?,
				position: json['position'] == null
						? null
						: Position.fromJson(json['position'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'title': title,
				'name': name,
				'city': city,
				'country': country,
				'position': position?.toJson(),
			};
}
