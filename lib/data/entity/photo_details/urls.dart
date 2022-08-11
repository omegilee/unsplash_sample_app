class Urls {
	String? raw;
	String? full;
	String? regular;
	String? small;
	String? thumb;
	String? smallS3;

	Urls({
		this.raw, 
		this.full, 
		this.regular, 
		this.small, 
		this.thumb, 
		this.smallS3, 
	});

	factory Urls.fromJson(Map<String, dynamic> json) => Urls(
				raw: json['raw'] as String?,
				full: json['full'] as String?,
				regular: json['regular'] as String?,
				small: json['small'] as String?,
				thumb: json['thumb'] as String?,
				smallS3: json['small_s3'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'raw': raw,
				'full': full,
				'regular': regular,
				'small': small,
				'thumb': thumb,
				'small_s3': smallS3,
			};
}
