import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:rutter/bloc/add_comment/add_comment_cubit.dart';
import 'package:rutter/bloc/comment/comment_cubit.dart';
import 'package:rutter/constants/locator.dart';
import 'package:rutter/data/services/comment/comment_repo.dart';

Future<dynamic> AddCommentBottomSheet(BuildContext context, int parent) {
  if (getIt.isRegistered<AddCommentCubit>()) {
    getIt.unregister<AddCommentCubit>();
  }
  getIt.registerSingleton(
      AddCommentCubit(getIt<CommentRepository>(), getIt<CommentCubit>()));
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => BlocProvider(
      create: (context) => getIt<AddCommentCubit>(),
      child: BottomSheet(parent: parent,),
    ),
  );
}

class BottomSheet extends StatelessWidget {
  final int parent;
  const BottomSheet({
    Key? key, required this.parent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).copyWith().size.height * (2.5 / 4),
      //height: 600,
      decoration: const BoxDecoration(
        // gradient: LinearGradient(
        //     colors: [
        //       Color(0xff252934),
        //       Color.fromARGB(255, 17, 17, 17),
        //     ],
        //     begin: FractionalOffset(0.0, 0.0),
        //     end: FractionalOffset(0.0, 0.9),
        //     stops: [0.0, 1.0],
        //     tileMode: TileMode.clamp),
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Center(
        child: Column(children: [
          Transform.rotate(
            angle: 90 * pi / 180,
            child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 20,
                  color: Colors.grey,
                ),
                onPressed: () => Navigator.pop(context)),
          ),
          const Text(
            'Create',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          BlocBuilder<AddCommentCubit, AddCommentState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case AddingComment:
                  return const CircularProgressIndicator();
                default:
                  return Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                              color:
                              const Color(0xffC4C4C4).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8)),
                          width: 330,
                          height: 55,
                          child: Center(
                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(20, 4, 20, 5),
                              child: TextField(
                                onChanged: (String value) async {
                                  context
                                      .read<AddCommentCubit>()
                                      .updateText(value, parent);
                                },
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14),
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    labelStyle: TextStyle(
                                      color: Color(0x80FFFFFF),
                                    ),
                                    // hintText: 'Text:',
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            ),
                          )),
                      // Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //       TextButton(
                      //           onPressed: () {
                      //             context
                      //                 .read<AddCommentCubit>()
                      //                 .dropProject();
                      //           },
                      //           child: Text(
                      //             "Cбросить",
                      //             style: TextStyle(
                      //                 color: Color.fromARGB(
                      //                     255, 245, 136, 128)),
                      //           ))
                      //     ]),
                      Container(
                        width: 270,
                        height: 50,
                        margin: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                            child: const Text('Comment',
                                style: TextStyle(
                                    fontSize: 16)),
                            onPressed: () async {
                              BlocProvider.of<AddCommentCubit>(context)
                                  .addComment(context
                                  .read<AddCommentCubit>()
                                  .state
                                  .comment);
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.black),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )))),
                      ),
                    ],
                  );
              }
            },
          ),
        ]),
      ),
    );
  }
}