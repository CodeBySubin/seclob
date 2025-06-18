class LoginModel {
  final String message;
  final String accessToken;
  final String refreshToken;
  final String userId;
  final String name;

  LoginModel({
    required this.message,
    required this.accessToken,
    required this.refreshToken,
    required this.userId,
    required this.name,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      userId: json['userId'],
      name: json['name'],
    );
  }
}
