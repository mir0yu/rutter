import 'package:flutter/material.dart';
import 'package:rutter/data/models/tweet_model.dart';
import 'package:rutter/ui/widgets/tweet_widget.dart';

class TweetsList extends StatelessWidget {
  final List<TweetModel> tweets;
  const TweetsList({
    Key? key,
    required this.tweets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = ScrollController();

    return ListView.builder(
        shrinkWrap: true,
        // itemExtent: 255,
        itemCount: tweets.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(2, 2, 2,0),
        itemBuilder: (BuildContext context, int index) {
          return TweetWidget(tweet: tweets[index]);});
  }
}