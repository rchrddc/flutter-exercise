import '../model/user_api_model.dart';
import '../services/api_service.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository({required this.apiService});

  Future<UserApiModel> getUsers() {
    return apiService.fetchUsers();
  }
}
