class Social {
	String? instagramUsername;
	String? portfolioUrl;
	dynamic twitterUsername;
	dynamic paypalEmail;

	Social({
		this.instagramUsername, 
		this.portfolioUrl, 
		this.twitterUsername, 
		this.paypalEmail, 
	});

	factory Social.fromJson(Map<String, dynamic> json) => Social(
				instagramUsername: json['instagram_username'] as String?,
				portfolioUrl: json['portfolio_url'] as String?,
				twitterUsername: json['twitter_username'] as dynamic,
				paypalEmail: json['paypal_email'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'instagram_username': instagramUsername,
				'portfolio_url': portfolioUrl,
				'twitter_username': twitterUsername,
				'paypal_email': paypalEmail,
			};
}
