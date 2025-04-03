import '../../domain/models/user.dart';

class UserApiModel {
  final List<User> users;

  UserApiModel({required this.users});

  factory UserApiModel.fromJson(Map<String, dynamic> json) {
    var usersJson = json['data'] as List;
    List<User> usersList = usersJson.map((user) => User.fromJson(user)).toList();
    return UserApiModel(users: usersList);
  }
}