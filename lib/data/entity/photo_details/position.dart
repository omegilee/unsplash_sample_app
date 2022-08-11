class Position {
	double? latitude;
	double? longitude;

	Position({this.latitude, this.longitude});

	factory Position.fromJson(Map<String, dynamic> json) => Position(
				latitude: (json['latitude'] as num?)?.toDouble(),
				longitude: (json['longitude'] as num?)?.toDouble(),
			);

	Map<String, dynamic> toJson() => {
				'latitude': latitude,
				'longitude': longitude,
			};
}
