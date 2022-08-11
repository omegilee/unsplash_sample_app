import 'cover_photo.dart';
import 'links.dart';
import 'preview_photo.dart';
import 'tag.dart';
import 'user.dart';

class Result {
	String? id;
	String? title;
	dynamic description;
	String? publishedAt;
	String? lastCollectedAt;
	String? updatedAt;
	bool? curated;
	bool? featured;
	int? totalPhotos;
	bool? private;
	String? shareKey;
	List<Tag>? tags;
	Links? links;
	User? user;
	CoverPhoto? coverPhoto;
	List<PreviewPhoto>? previewPhotos;

	Result({
		this.id, 
		this.title, 
		this.description, 
		this.publishedAt, 
		this.lastCollectedAt, 
		this.updatedAt, 
		this.curated, 
		this.featured, 
		this.totalPhotos, 
		this.private, 
		this.shareKey, 
		this.tags, 
		this.links, 
		this.user, 
		this.coverPhoto, 
		this.previewPhotos, 
	});

	factory Result.fromJson(Map<String, dynamic> json) => Result(
				id: json['id'] as String?,
				title: json['title'] as String?,
				description: json['description'] as dynamic,
				publishedAt: json['published_at'] as String?,
				lastCollectedAt: json['last_collected_at'] as String?,
				updatedAt: json['updated_at'] as String?,
				curated: json['curated'] as bool?,
				featured: json['featured'] as bool?,
				totalPhotos: json['total_photos'] as int?,
				private: json['private'] as bool?,
				shareKey: json['share_key'] as String?,
				tags: (json['tags'] as List<dynamic>?)
						?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
						.toList(),
				links: json['links'] == null
						? null
						: Links.fromJson(json['links'] as Map<String, dynamic>),
				user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
				coverPhoto: json['cover_photo'] == null
						? null
						: CoverPhoto.fromJson(json['cover_photo'] as Map<String, dynamic>),
				previewPhotos: (json['preview_photos'] as List<dynamic>?)
						?.map((e) => PreviewPhoto.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'title': title,
				'description': description,
				'published_at': publishedAt,
				'last_collected_at': lastCollectedAt,
				'updated_at': updatedAt,
				'curated': curated,
				'featured': featured,
				'total_photos': totalPhotos,
				'private': private,
				'share_key': shareKey,
				'tags': tags?.map((e) => e.toJson()).toList(),
				'links': links?.toJson(),
				'user': user?.toJson(),
				'cover_photo': coverPhoto?.toJson(),
				'preview_photos': previewPhotos?.map((e) => e.toJson()).toList(),
			};
}
