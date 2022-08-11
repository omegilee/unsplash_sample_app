class Topic {
	String? id;
	String? title;
	String? slug;
	String? visibility;

	Topic({this.id, this.title, this.slug, this.visibility});

	factory Topic.fromJson(Map<String, dynamic> json) => Topic(
				id: json['id'] as String?,
				title: json['title'] as String?,
				slug: json['slug'] as String?,
				visibility: json['visibility'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'title': title,
				'slug': slug,
				'visibility': visibility,
			};
}
