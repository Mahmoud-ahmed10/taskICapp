class ProfileModel {
  final String fullName;
  final String email;
  final String mobileNumber;
  final String dateOfBirth;
  final String gender;

  ProfileModel({
    required this.fullName,
    required this.email,
    required this.mobileNumber,
    required this.dateOfBirth,
    required this.gender,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    fullName: json['fullName'] ?? '',
    email: json['email'] ?? '',
    mobileNumber: json['mobileNumber'] ?? '',
    dateOfBirth: json['dateOfBirth'] ?? '',
    gender: json['gender'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "email": email,
    "mobileNumber": mobileNumber,
    "dateOfBirth": dateOfBirth,
    "gender": gender,
  };

  ProfileModel copyWith({
    String? fullName,
    String? email,
    String? mobileNumber,
    String? dateOfBirth,
    String? gender,
  }) {
    return ProfileModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
    );
  }
}
