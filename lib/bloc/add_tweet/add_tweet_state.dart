part of 'add_tweet_cubit.dart';

abstract class AddTweetState {
  late TweetModel tweet;
}

class AddTweetInitial extends AddTweetState {

}

class AddingTweetDataChanged extends AddTweetState {
  final TweetModel tweet;
  AddingTweetDataChanged({required this.tweet});
}

class AddingTweet extends AddTweetState {}

class AddingTweetSuccess extends AddTweetState {}

class AddingTweetError extends AddTweetState {
  final TweetModel tweet;
  AddingTweetError({required this.tweet});
}