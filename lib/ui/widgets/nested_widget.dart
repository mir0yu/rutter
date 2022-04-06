import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:rutter/bloc/comment/comment_cubit.dart';
import 'package:rutter/data/models/tweet_model.dart';
import 'package:rutter/ui/widgets/tweet_widget.dart';

class NestedScrollModal extends StatelessWidget {
  final TweetModel tweet;
  const NestedScrollModal({Key? key, required this.tweet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CommentCubit>(context).fetchComments(tweet.id!);
    return Column(
      children: [
        TweetWidget(tweet: tweet),
        Expanded(
          child: BlocBuilder<CommentCubit, CommentState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case CommentsLoaded:
                    return ListView.builder(
                      shrinkWrap: true,
                      controller: ModalScrollController.of(context),
                      itemCount: state.comments.length,
                      itemBuilder: (context, index) {
                        var owner = state.comments[index].owner;
                        var text = state.comments[index].text;
                        return ListTile(
                          title: Text(owner),
                          subtitle: Text(text),
                        );
                      },
                    );
                  default:
                    return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ],
    );
  }
}
