import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:rutter/constants/paths.dart';
import 'package:rutter/constants/storage.dart';
import 'package:rutter/data/models/comment_model.dart';

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

  addComment(CommentModel comment) async {
    String? t = await storage.read(key: 'token');
    String? token = t.toString();

    final response = await http.post(Uri.parse('$BASE_URL/api/v1/tweet/comments/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer $token'
        },
        body: jsonEncode({
          "text": comment.text,
          "parent": comment.parent,
        }));
    return response;
  }
}