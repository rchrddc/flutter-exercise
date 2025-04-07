import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user_api_model.dart';

class ApiService {
  Future<UserApiModel> fetchUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users'));

    if (response.statusCode == 200) {
      return UserApiModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}
