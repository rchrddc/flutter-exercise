import '../services/api_service.dart';
import '../model/user_api_model.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository({required this.apiService});

  Future<UserApiModel> getUsers() async {
    return await apiService.fetchUsers();
  }
}