class Health {
	String? status;
	String? approvedOn;

	Health({this.status, this.approvedOn});

	factory Health.fromJson(Map<String, dynamic> json) => Health(
				status: json['status'] as String?,
				approvedOn: json['approved_on'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'approved_on': approvedOn,
			};
}
