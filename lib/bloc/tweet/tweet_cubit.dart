import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rutter/data/models/tweet_model.dart';
import 'package:rutter/data/services/tweet/tweet_repo.dart';

part 'tweet_state.dart';

class TweetCubit extends Cubit<TweetState> {
  final TweetRepository repository;

  TweetCubit(this.repository) : super(TweetInitial());
  void fetchTweets() {
    emit(TweetsLoading());
    repository.getTweets().then((response) {
      if (response.statusCode == 200) {
        var rawTweets = jsonDecode(response.body);
        List<TweetModel> tweets =
        rawTweets.map<TweetModel>((tweet) => TweetModel.fromJson((tweet))).toList();
        emit(TweetsLoaded(tweets: tweets));
      } else {
        emit(TweetsLoadingError());
      }
    });
  }
  addTweetToState(TweetModel tweet) {
    final currentState = state;
    final tweets = currentState.tweets;
    tweets.add(tweet);
    emit(TweetsLoaded(tweets: tweets));
  }
}
