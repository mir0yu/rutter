import 'dart:convert';

import 'package:rutter/constants/paths.dart';
import 'package:rutter/constants/storage.dart';
import 'package:http/http.dart' as http;

class AuthenticationNetworkService {
  auth() async {
    String? token = await storage.read(key: 'token');
    final response = await http.post(Uri.parse('$BASE_URL/api/v1/token/verify/'),
      headers: {"Content-Type": "application/json",},
      body: jsonEncode({"token": token.toString()}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}