import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user_api_model.dart';

class ApiService {
  static const String baseUrl = 'https://reqres.in/api/users?page=2';

  Future<UserApiModel> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return UserApiModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load users');
    }
  }
}