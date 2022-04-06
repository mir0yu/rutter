import 'package:http/http.dart' as http;

import 'package:rutter/constants/paths.dart';
import 'package:rutter/constants/storage.dart';

class CommentNetworkService {
  fetchComments(int tweetId) async {
    String? t = await storage.read(key: 'token');
    String? token = t.toString();
    final response = await http.get(
      Uri.parse('$BASE_URL/api/v1/tweet/comments/$tweetId'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    return response;
  }
}