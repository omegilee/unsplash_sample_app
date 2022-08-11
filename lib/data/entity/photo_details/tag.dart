class Tag {
	String? type;
	String? title;

	Tag({this.type, this.title});

	factory Tag.fromJson(Map<String, dynamic> json) => Tag(
				type: json['type'] as String?,
				title: json['title'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'type': type,
				'title': title,
			};
}
