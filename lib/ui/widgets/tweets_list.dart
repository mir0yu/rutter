import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rutter/bloc/tweet/tweet_cubit.dart';
import 'package:rutter/data/models/tweet_model.dart';
import 'package:rutter/ui/widgets/tweet_widget.dart';

class TweetsList extends StatefulWidget {
  final List<TweetModel> tweets;
  TweetsList({
    Key? key,
    required this.tweets,
  }) : super(key: key);

  @override
  State<TweetsList> createState() => _TweetsListState();
}
class _TweetsListState extends State<TweetsList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);


  void _onRefresh() async {
    // monitor network fetch
    BlocProvider.of<TweetCubit>(context).fetchTweets();
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SmartRefresher(
            enablePullDown: true,
            // enablePullUp: true,
            header: const ClassicHeader(),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.tweets.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(2, 2, 2, 0),
                itemBuilder: (BuildContext context, int index) {
                  return TweetWidget(tweet: widget.tweets[index]);
                })));
  }
}
