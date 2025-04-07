import '../../domain/models/user.dart';

class UserApiModel {
  final List<User> users;

  UserApiModel({required this.users});

  factory UserApiModel.fromJson(Map<String, dynamic> json) {
    return UserApiModel(
      users: (json['data'] as List)
          .map((userJson) => User.fromJson(userJson))
          .toList(),
    );
  }
}
