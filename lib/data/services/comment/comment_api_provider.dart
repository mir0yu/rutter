import 'package:http/http.dart' as http;

import 'package:rutter/constants/paths.dart';
import 'package:rutter/constants/storage.dart';

class CommentNetworkService {
  getComments(int tweetId) async {
    String? token = await storage.read(key: 'token');
    final response = await http.get(
      Uri.parse('$BASE_URL/api/v1/tweet/comments/$tweetId'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token.toString()
      },
    );

    return response;
  }
}