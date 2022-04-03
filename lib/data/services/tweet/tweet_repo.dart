import 'package:http/http.dart';

import 'package:rutter/data/models/tweet_model.dart';
import 'package:rutter/data/services/tweet/tweet_api_provider.dart';

class TweetRepository {
  final TweetNetworkService networkService;
  TweetRepository(this.networkService);

  Future<Response> addTweet(TweetModel tweet) async {
    return await networkService.addTweet(tweet);
  }

  Future<Response> getTweets() async {
    return await networkService.getTweets();
  }

  Future<Response> updateTweet(TweetModel tweet) async {
    return await networkService.updateTweet(tweet);
  }
}
