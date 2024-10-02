class RegisterModel {
  final String name;
  final String mobile;
  final String email;
  final String password;
  final String confirmPassword;
  final String profilePhotoPath; // اختياري، إذا كان هناك صورة
  final String onesignalId;

  RegisterModel({
    required this.name,
    required this.mobile,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.profilePhotoPath = '', // اختياري
    required this.onesignalId,
  });

  // لتحويل الـ Model إلى Map لإرساله كـ Body في طلب POST
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobile': mobile,
      'email': email,
      'password': password,
      'c_password': confirmPassword,
      'profile_photo_path': profilePhotoPath,
      'onesignal_id': onesignalId,
    };
  }

  // لتحويل الـ JSON الوارد من API إلى Model
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json['name'],
      mobile: json['mobile'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['c_password'],
      profilePhotoPath: json['profile_photo_path'] ?? '',
      onesignalId: json['onesignal_id'],
    );
  }
}
