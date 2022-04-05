import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:rutter/bloc/tweet/tweet_cubit.dart';
import 'package:rutter/ui/widgets/background.dart';
import 'package:rutter/ui/widgets/tweets_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TweetCubit>(context).fetchTweets();
    return Scaffold(
        // extendBodyBehindAppBar: true,
        // drawer: const Drawer(backgroundColor: Colors.white,),
      // endDrawer: const Drawer(backgroundColor: Colors.lightGreenAccent,),
      appBar: AppBar(
        // bottomOpacity: 0.5,
        centerTitle: true,
        title: NeumorphicText(
          "Rutter",
          style: const NeumorphicStyle(
            depth: 3,
            color: Colors.white,
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: 30,
            fontFamily: 'General Sans'
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          NeumorphicButton(
            child: NeumorphicIcon(
              Icons.account_circle_outlined,
              size: 40,
              style: const NeumorphicStyle(color: Colors.white),
            ),
              style: const NeumorphicStyle(
                disableDepth: true,
                color: Colors.transparent,
              ),
            onPressed: () => {}),
        ],
      ),
        extendBodyBehindAppBar: true,
        body: Stack(
            children: [
              const Background(),
              // const SizedBox(height: 100),
              BlocBuilder<TweetCubit, TweetState>(
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case TweetsLoaded:
                        return Padding(
                          padding: const EdgeInsets.only(top: 80, bottom: 50),
                          child: TweetsList(tweets: state.tweets),
                        );
                      default:
                        return const Center(child: CircularProgressIndicator());
                    }
                  })]
      ),
      );
  }
}
