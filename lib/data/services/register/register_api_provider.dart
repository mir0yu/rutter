import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rutter/constants/paths.dart';

class RegisterNetworkService {
  register(String username, String email, String password) async {
    final response = await http.post(Uri.parse('$BASE_URL/users/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": password
        }));
    return response;
  }
}