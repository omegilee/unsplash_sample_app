class Fashion {
	String? status;
	String? approvedOn;

	Fashion({this.status, this.approvedOn});

	factory Fashion.fromJson(Map<String, dynamic> json) => Fashion(
				status: json['status'] as String?,
				approvedOn: json['approved_on'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'approved_on': approvedOn,
			};
}
