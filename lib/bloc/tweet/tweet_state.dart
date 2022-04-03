part of 'tweet_cubit.dart';

@immutable
abstract class TweetState {
  late List<TweetModel> tweets;
}

class TweetInitial extends TweetState {}

//! Tweet load states
class TweetsLoading extends TweetState {}

class TweetsLoaded extends TweetState {
  final List<TweetModel> tweets;

  TweetsLoaded({required this.tweets});
}

class TweetsLoadingError extends TweetState {}