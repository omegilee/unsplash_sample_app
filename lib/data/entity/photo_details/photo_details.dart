import 'exif.dart';
import 'links.dart';
import 'location.dart';
import 'meta.dart';
import 'related_collections.dart';
import 'tag.dart';
import 'tags_preview.dart';
import 'topic.dart';
import 'topic_submissions.dart';
import 'urls.dart';
import 'user.dart';

class PhotoDetails {
	String? id;
	String? createdAt;
	String? updatedAt;
	String? promotedAt;
	int? width;
	int? height;
	String? color;
	String? blurHash;
	String? description;
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
	Exif? exif;
	Location? location;
	Meta? meta;
	bool? publicDomain;
	List<Tag>? tags;
	List<TagsPreview>? tagsPreview;
	RelatedCollections? relatedCollections;
	int? views;
	int? downloads;
	List<Topic>? topics;

	PhotoDetails({
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
		this.exif, 
		this.location, 
		this.meta, 
		this.publicDomain, 
		this.tags, 
		this.tagsPreview, 
		this.relatedCollections, 
		this.views, 
		this.downloads, 
		this.topics, 
	});

	factory PhotoDetails.fromJson(Map<String, dynamic> json) => PhotoDetails(
				id: json['id'] as String?,
				createdAt: json['created_at'] as String?,
				updatedAt: json['updated_at'] as String?,
				promotedAt: json['promoted_at'] as String?,
				width: json['width'] as int?,
				height: json['height'] as int?,
				color: json['color'] as String?,
				blurHash: json['blur_hash'] as String?,
				description: json['description'] as String?,
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
				exif: json['exif'] == null
						? null
						: Exif.fromJson(json['exif'] as Map<String, dynamic>),
				location: json['location'] == null
						? null
						: Location.fromJson(json['location'] as Map<String, dynamic>),
				meta: json['meta'] == null
						? null
						: Meta.fromJson(json['meta'] as Map<String, dynamic>),
				publicDomain: json['public_domain'] as bool?,
				tags: (json['tags'] as List<dynamic>?)
						?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
						.toList(),
				tagsPreview: (json['tags_preview'] as List<dynamic>?)
						?.map((e) => TagsPreview.fromJson(e as Map<String, dynamic>))
						.toList(),
				relatedCollections: json['related_collections'] == null
						? null
						: RelatedCollections.fromJson(json['related_collections'] as Map<String, dynamic>),
				views: json['views'] as int?,
				downloads: json['downloads'] as int?,
				topics: (json['topics'] as List<dynamic>?)
						?.map((e) => Topic.fromJson(e as Map<String, dynamic>))
						.toList(),
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
				'exif': exif?.toJson(),
				'location': location?.toJson(),
				'meta': meta?.toJson(),
				'public_domain': publicDomain,
				'tags': tags?.map((e) => e.toJson()).toList(),
				'tags_preview': tagsPreview?.map((e) => e.toJson()).toList(),
				'related_collections': relatedCollections?.toJson(),
				'views': views,
				'downloads': downloads,
				'topics': topics?.map((e) => e.toJson()).toList(),
			};
}
