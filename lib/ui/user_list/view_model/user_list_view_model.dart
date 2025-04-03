import 'package:flutter/material.dart';
import '../../../domain/models/user.dart';
import '../../../data/repositories/user_repository.dart';

class UserListViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  List<User> users = [];
  bool isLoading = true;

  UserListViewModel({required this.userRepository}) {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final userApiModel = await userRepository.getUsers();
      users = userApiModel.users;
    } catch (e) {
      print("Error fetching users: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
