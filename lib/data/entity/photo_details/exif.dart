class Exif {
	String? make;
	String? model;
	String? name;
	String? exposureTime;
	String? aperture;
	String? focalLength;
	int? iso;

	Exif({
		this.make, 
		this.model, 
		this.name, 
		this.exposureTime, 
		this.aperture, 
		this.focalLength, 
		this.iso, 
	});

	factory Exif.fromJson(Map<String, dynamic> json) => Exif(
				make: json['make'] as String?,
				model: json['model'] as String?,
				name: json['name'] as String?,
				exposureTime: json['exposure_time'] as String?,
				aperture: json['aperture'] as String?,
				focalLength: json['focal_length'] as String?,
				iso: json['iso'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'make': make,
				'model': model,
				'name': name,
				'exposure_time': exposureTime,
				'aperture': aperture,
				'focal_length': focalLength,
				'iso': iso,
			};
}
