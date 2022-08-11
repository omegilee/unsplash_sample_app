import 'urls.dart';

class PreviewPhoto {
	String? id;
	String? createdAt;
	String? updatedAt;
	String? blurHash;
	Urls? urls;

	PreviewPhoto({
		this.id, 
		this.createdAt, 
		this.updatedAt, 
		this.blurHash, 
		this.urls, 
	});

	factory PreviewPhoto.fromJson(Map<String, dynamic> json) => PreviewPhoto(
				id: json['id'] as String?,
				createdAt: json['created_at'] as String?,
				updatedAt: json['updated_at'] as String?,
				blurHash: json['blur_hash'] as String?,
				urls: json['urls'] == null
						? null
						: Urls.fromJson(json['urls'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'created_at': createdAt,
				'updated_at': updatedAt,
				'blur_hash': blurHash,
				'urls': urls?.toJson(),
			};
}
