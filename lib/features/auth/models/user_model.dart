class UserModel {
  final String id;
  final String email;
  final String name;
  final int tokenBalance;
  final String role; // 'student' or 'admin'

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.tokenBalance,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      email: json['email'],
      name: json['name'],
      tokenBalance: json['tokenBalance'] ?? 0,
      role: json['role'] ?? 'student',
    );
  }
}
