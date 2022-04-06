import 'package:http/http.dart' as http;

import 'package:rutter/constants/paths.dart';
import 'package:rutter/constants/storage.dart';

class UserNetworkService {
  getSelfUser() async {
    String? t = await storage.read(key: 'token');
    String? token = t.toString();
    final response = await http.get(
      Uri.parse('$BASE_URL/users/me/'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    return response;
  }
  getUser(String username) async {
    String? t = await storage.read(key: 'token');
    String? token = t.toString();
    final response = await http.get(
      Uri.parse('$BASE_URL/users/$username'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    return response;
  }
}