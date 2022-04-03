import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:rutter/constants/paths.dart';
import 'package:rutter/constants/storage.dart';

class LoginNetworkService {
  login(String email, String password) async {
    final response = await http.post(Uri.parse('$BASE_URL/api/v1/token/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}));
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      await storage.write(key: 'token', value: jsonResponse['access']);
    }
    return response;
  }
}