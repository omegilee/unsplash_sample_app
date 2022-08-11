import 'links.dart';
import 'profile_image.dart';
import 'social.dart';

class User {
	String? id;
	String? updatedAt;
	String? username;
	String? name;
	String? firstName;
	String? lastName;
	dynamic twitterUsername;
	String? portfolioUrl;
	String? bio;
	String? location;
	Links? links;
	ProfileImage? profileImage;
	String? instagramUsername;
	int? totalCollections;
	int? totalLikes;
	int? totalPhotos;
	bool? acceptedTos;
	bool? forHire;
	Social? social;

	User({
		this.id, 
		this.updatedAt, 
		this.username, 
		this.name, 
		this.firstName, 
		this.lastName, 
		this.twitterUsername, 
		this.portfolioUrl, 
		this.bio, 
		this.location, 
		this.links, 
		this.profileImage, 
		this.instagramUsername, 
		this.totalCollections, 
		this.totalLikes, 
		this.totalPhotos, 
		this.acceptedTos, 
		this.forHire, 
		this.social, 
	});

	factory User.fromJson(Map<String, dynamic> json) => User(
				id: json['id'] as String?,
				updatedAt: json['updated_at'] as String?,
				username: json['username'] as String?,
				name: json['name'] as String?,
				firstName: json['first_name'] as String?,
				lastName: json['last_name'] as String?,
				twitterUsername: json['twitter_username'] as dynamic,
				portfolioUrl: json['portfolio_url'] as String?,
				bio: json['bio'] as String?,
				location: json['location'] as String?,
				links: json['links'] == null
						? null
						: Links.fromJson(json['links'] as Map<String, dynamic>),
				profileImage: json['profile_image'] == null
						? null
						: ProfileImage.fromJson(json['profile_image'] as Map<String, dynamic>),
				instagramUsername: json['instagram_username'] as String?,
				totalCollections: json['total_collections'] as int?,
				totalLikes: json['total_likes'] as int?,
				totalPhotos: json['total_photos'] as int?,
				acceptedTos: json['accepted_tos'] as bool?,
				forHire: json['for_hire'] as bool?,
				social: json['social'] == null
						? null
						: Social.fromJson(json['social'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'updated_at': updatedAt,
				'username': username,
				'name': name,
				'first_name': firstName,
				'last_name': lastName,
				'twitter_username': twitterUsername,
				'portfolio_url': portfolioUrl,
				'bio': bio,
				'location': location,
				'links': links?.toJson(),
				'profile_image': profileImage?.toJson(),
				'instagram_username': instagramUsername,
				'total_collections': totalCollections,
				'total_likes': totalLikes,
				'total_photos': totalPhotos,
				'accepted_tos': acceptedTos,
				'for_hire': forHire,
				'social': social?.toJson(),
			};
}
