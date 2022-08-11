class Links {
	String? self;
	String? html;
	String? download;
	String? downloadLocation;

	Links({this.self, this.html, this.download, this.downloadLocation});

	factory Links.fromJson(Map<String, dynamic> json) => Links(
				self: json['self'] as String?,
				html: json['html'] as String?,
				download: json['download'] as String?,
				downloadLocation: json['download_location'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'self': self,
				'html': html,
				'download': download,
				'download_location': downloadLocation,
			};
}
