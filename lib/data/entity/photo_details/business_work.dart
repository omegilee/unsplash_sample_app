class BusinessWork {
	String? status;
	String? approvedOn;

	BusinessWork({this.status, this.approvedOn});

	factory BusinessWork.fromJson(Map<String, dynamic> json) => BusinessWork(
				status: json['status'] as String?,
				approvedOn: json['approved_on'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'approved_on': approvedOn,
			};
}
