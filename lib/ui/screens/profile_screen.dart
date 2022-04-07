import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutter/bloc/user/user_cubit.dart';
import 'package:rutter/ui/widgets/background.dart';
import 'package:rutter/ui/widgets/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  String username;
  ProfilePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserCubit>(context).fetchUser(username);
    bool me = username == 'me' ? true : false;
    return Stack(
      children: [
        const Background(),
        BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case UserLoaded:
                  return ProfileWidget(user: state.User, me: me,);
                default:
                  return const Center(child: CircularProgressIndicator());
              }
            })
      ],
    );
  }
}
