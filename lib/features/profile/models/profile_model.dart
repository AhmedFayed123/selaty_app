class ProfileModel {
  final String name;
  final String email;
  final String? profileImage;

  ProfileModel({
    required this.name,
    required this.email,
    this.profileImage,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profileImage: json['profile_image'],
    );
  }
}
