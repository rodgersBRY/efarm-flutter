class UserModel {
  String username;
  String email;
  String password;
  String role;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
      );
}
