class Meta {
	bool? index;

	Meta({this.index});

	factory Meta.fromJson(Map<String, dynamic> json) => Meta(
				index: json['index'] as bool?,
			);

	Map<String, dynamic> toJson() => {
				'index': index,
			};
}
