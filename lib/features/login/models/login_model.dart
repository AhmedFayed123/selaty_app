class LoginResponseModel {
  final bool status;
  final String message;
  final String? token;

  LoginResponseModel({
    required this.status,
    required this.message,
    this.token,
  });

  // تحويل من JSON إلى كائن Dart
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      token: json['data'] != null ? json['data']['token'] : null,
    );
  }

  // تحويل من كائن Dart إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'token': token,
    };
  }
}
