import 'dart:convert';

import 'package:rutter/constants/paths.dart';
import 'package:rutter/constants/storage.dart';
import 'package:rutter/data/models/tweet_model.dart';

import 'package:http/http.dart' as http;

class TweetNetworkService {
  addTweet(TweetModel tweet) async {
    String? t = await storage.read(key: 'token');
    String? token = t.toString();

    final response = await http.post(Uri.parse('$BASE_URL/api/v1/tweet/'),
    headers: {
      "Content-Type": "application/json",
      "Authorization": 'Bearer $token'
    },
        body: jsonEncode({
          "text": tweet.text,
        }));
    return response;
  }

  getTweets() async {
    String? t = await storage.read(key: 'token');
    String? token = t.toString();

    final response = await http.get(Uri.parse('$BASE_URL/api/v1/tweet/public/'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token'
      },
    );
    return response;
  }

  updateTweet(TweetModel tweet) async {
    String? t = await storage.read(key: 'token');
    String? token = t.toString();

    int? tweetId = tweet.id;

    final response = await http.put(Uri.parse('$BASE_URL/api/v1/tweet/$tweetId'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token'
      },
      body: jsonEncode({
        "text": tweet.text,
      })
    );
    return response;
  }

  // getAllUserTweets()
}