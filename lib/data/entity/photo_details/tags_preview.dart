class TagsPreview {
	String? type;
	String? title;

	TagsPreview({this.type, this.title});

	factory TagsPreview.fromJson(Map<String, dynamic> json) => TagsPreview(
				type: json['type'] as String?,
				title: json['title'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'type': type,
				'title': title,
			};
}
