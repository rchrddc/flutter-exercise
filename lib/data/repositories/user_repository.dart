import '../model/user_api_model.dart';
import '../services/api_service.dart'; // ✅ Import your service

class UserRepository {
  final ApiService apiService;

  UserRepository({required this.apiService}); // ✅ Constructor injection

  Future<UserApiModel> getUsers() {
    return apiService.fetchUsers(); // ✅ Delegate fetching to ApiService
  }
}
