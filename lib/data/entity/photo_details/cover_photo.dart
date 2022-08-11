import 'links.dart';
import 'topic_submissions.dart';
import 'urls.dart';
import 'user.dart';

class CoverPhoto {
	String? id;
	String? createdAt;
	String? updatedAt;
	String? promotedAt;
	int? width;
	int? height;
	String? color;
	String? blurHash;
	dynamic description;
	String? altDescription;
	Urls? urls;
	Links? links;
	List<dynamic>? categories;
	int? likes;
	bool? likedByUser;
	List<dynamic>? currentUserCollections;
	dynamic sponsorship;
	TopicSubmissions? topicSubmissions;
	User? user;

	CoverPhoto({
		this.id, 
		this.createdAt, 
		this.updatedAt, 
		this.promotedAt, 
		this.width, 
		this.height, 
		this.color, 
		this.blurHash, 
		this.description, 
		this.altDescription, 
		this.urls, 
		this.links, 
		this.categories, 
		this.likes, 
		this.likedByUser, 
		this.currentUserCollections, 
		this.sponsorship, 
		this.topicSubmissions, 
		this.user, 
	});

	factory CoverPhoto.fromJson(Map<String, dynamic> json) => CoverPhoto(
				id: json['id'] as String?,
				createdAt: json['created_at'] as String?,
				updatedAt: json['updated_at'] as String?,
				promotedAt: json['promoted_at'] as String?,
				width: json['width'] as int?,
				height: json['height'] as int?,
				color: json['color'] as String?,
				blurHash: json['blur_hash'] as String?,
				description: json['description'] as dynamic,
				altDescription: json['alt_description'] as String?,
				urls: json['urls'] == null
						? null
						: Urls.fromJson(json['urls'] as Map<String, dynamic>),
				links: json['links'] == null
						? null
						: Links.fromJson(json['links'] as Map<String, dynamic>),
				categories: json['categories'] as List<dynamic>?,
				likes: json['likes'] as int?,
				likedByUser: json['liked_by_user'] as bool?,
				currentUserCollections: json['current_user_collections'] as List<dynamic>?,
				sponsorship: json['sponsorship'] as dynamic,
				topicSubmissions: json['topic_submissions'] == null
						? null
						: TopicSubmissions.fromJson(json['topic_submissions'] as Map<String, dynamic>),
				user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'created_at': createdAt,
				'updated_at': updatedAt,
				'promoted_at': promotedAt,
				'width': width,
				'height': height,
				'color': color,
				'blur_hash': blurHash,
				'description': description,
				'alt_description': altDescription,
				'urls': urls?.toJson(),
				'links': links?.toJson(),
				'categories': categories,
				'likes': likes,
				'liked_by_user': likedByUser,
				'current_user_collections': currentUserCollections,
				'sponsorship': sponsorship,
				'topic_submissions': topicSubmissions?.toJson(),
				'user': user?.toJson(),
			};
}
