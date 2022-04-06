import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:rutter/bloc/tweet/tweet_cubit.dart';
import 'package:rutter/data/models/tweet_model.dart';
import 'package:rutter/data/services/tweet/tweet_repo.dart';


part 'add_tweet_state.dart';

class AddTweetCubit extends Cubit<AddTweetState> {
  final TweetRepository repository;
  final TweetCubit tweetCubit;
  AddTweetCubit(this.repository, this.tweetCubit)
      : super(AddTweetInitial());

  void updateText(String text) {
    final currentState = state;
    if (currentState is AddingTweetDataChanged ||
        currentState is AddTweetInitial) {
      emit(AddingTweetDataChanged(
          tweet: TweetModel(text: text)));
    }
  }


  void addTweet(TweetModel tweet) {
    final currentState = state;
    emit(AddingTweet());
    repository.addTweet(tweet).then((response) {
      if (response.statusCode == 200) {
        var newTweet = jsonDecode(response.body);
        emit(AddingTweetSuccess());
        emit(AddTweetInitial());
        tweetCubit.addTweetToState(TweetModel.fromJson(newTweet));
      } else if (response.statusCode == 400) {
        emit(AddingTweetError(tweet: currentState.tweet));
      }
    });
  }
}