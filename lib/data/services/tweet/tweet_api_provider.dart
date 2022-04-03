import 'dart:convert';

import 'package:rutter/constants/paths.dart';
import 'package:rutter/constants/storage.dart';
import 'package:rutter/data/models/tweet_model.dart';

import 'package:http/http.dart' as http;

class TweetNetworkService {
  addTweet(TweetModel tweet) async {
    String? token = await storage.read(key: 'token');
    final response = await http.post(Uri.parse('$BASE_URL/api/v1/tweet/'),
    headers: {
      "Content-Type": "application/json",
      "Authorization": token.toString()
    },
        body: jsonEncode({
          "text": tweet.text,
        }));
    return response;
  }

  getTweets() async {
    String? token = await storage.read(key: 'token');

    final response = await http.get(Uri.parse('$BASE_URL/api/v1/tweet/public/'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token.toString()
      },
    );
    return response;
  }

  updateTweet(TweetModel tweet) async {
    String? token = await storage.read(key: 'token');
    int? tweetId = tweet.id;

    final response = await http.put(Uri.parse('$BASE_URL/api/v1/tweet/$tweetId'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token.toString()
      },
      body: jsonEncode({
        "text": tweet.text,
      })
    );
    return response;
  }

  // getAllUserTweets()
}