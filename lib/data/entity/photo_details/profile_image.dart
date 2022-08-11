class ProfileImage {
	String? small;
	String? medium;
	String? large;

	ProfileImage({this.small, this.medium, this.large});

	factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
				small: json['small'] as String?,
				medium: json['medium'] as String?,
				large: json['large'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'small': small,
				'medium': medium,
				'large': large,
			};
}
