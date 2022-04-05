import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:rutter/data/models/tweet_model.dart';

class TweetWidget extends StatelessWidget {
  TweetModel tweet;
  TweetWidget({Key? key, required this.tweet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Neumorphic(
            style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: 10,
                surfaceIntensity: 0.1,
                lightSource: LightSource.top,
                color: Colors.white,
                intensity: 0.8,
            ),
          // elevation: 4.0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, );
                      print("tap on username");
                      },
                      child: Text(tweet.owner!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  const Text("  ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                  Text(tweet.createdAt!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16
                    ),)
                ],),
              ),
              // Container(
              //   height: 200.0,
              //   child: Ink.image(
              //     image: cardImage,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                alignment: Alignment.centerLeft,
                child: Text(tweet.text!,
                  maxLines: 4,
                  style: const TextStyle(
                      color: Colors.black,
                    fontSize: 18,
                  ),),
              ),
              ButtonBar(
                children: [
                  TextButton.icon(
                    label: Text(tweet.likesCount.toString(),
                      style: const TextStyle(color: Colors.black),),
                    onPressed: () {print("like");},
                    icon: const Icon(Icons.favorite_border,
                      color: Colors.black,),
                  ),
                  TextButton.icon(
                    label: Text(tweet.commentsCount.toString(),
                      style: const TextStyle(color: Colors.black),),
                    onPressed: () {print("comment");},
                    icon: const Icon(Icons.comment,
                      color: Colors.black,),
                  )
                ],
              )
            ],
          )),
      );
  }
}