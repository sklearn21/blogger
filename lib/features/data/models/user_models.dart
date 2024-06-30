import 'package:blogger/features/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] ?? '',
        email: json['email'] ?? '',
        name: json['name'] ?? '',
      );
}
