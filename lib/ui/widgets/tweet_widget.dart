import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:rutter/bloc/comment/comment_cubit.dart';
import 'package:rutter/constants/paths.dart';
import 'package:rutter/data/models/tweet_model.dart';
import 'package:rutter/ui/widgets/nested_widget.dart';

class TweetWidget extends StatelessWidget {
  TweetModel tweet;
  TweetWidget({Key? key, required this.tweet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.yMMMMd('en');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 10,
            surfaceIntensity: 0.1,
            lightSource: LightSource.topRight,
            color: Colors.white,
            intensity: 1,
          ),
          // elevation: 4.0,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                          Navigator.pushNamed(context, PROFILE, arguments: tweet.owner!);
                      },
                      child: Text(
                        tweet.owner!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      "  ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dateFormat.format(DateTime.parse(tweet.createdAt!)),
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    )
                  ],
                ),
              ),
              // Container(
              //   height: 200.0,
              //   child: Ink.image(
              //     image: cardImage,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  tweet.text!,
                  maxLines: 4,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              ButtonBar(
                children: [
                  TextButton.icon(
                    label: Text(
                      tweet.likesCount.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      print("like");
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                  ),
                  TextButton.icon(
                    label: Text(
                      tweet.commentsCount.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    onPressed: tweet.commentsCount !=0? () => showBarModalBottomSheet(
                        expand: true,
                        context: context,
                        builder: (_) => BlocProvider.value(
                            value: context.read<CommentCubit>(),
                            child: NestedScrollModal(tweet: tweet)),
                    ): null,
                    icon: Icon(
                      Icons.comment,
                      color: tweet.commentsCount !=0? Colors.black : Colors.grey,
                    ),
                  ),
                  TextButton.icon(
                    label: const Text(''
                    ),
                    onPressed: () {
                      print("reply");
                    },
                    icon: const Icon(
                      Icons.reply,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
