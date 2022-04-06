import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutter/bloc/authentication/authentication_cubit.dart';
import 'package:rutter/bloc/comment/comment_cubit.dart';
import 'package:rutter/bloc/login/login_cubit.dart';
import 'package:rutter/bloc/register/register_cubit.dart';
import 'package:rutter/bloc/tweet/tweet_cubit.dart';
import 'package:rutter/bloc/user/user_cubit.dart';
import 'package:rutter/constants/locator.dart';
import 'package:rutter/constants/paths.dart';
import 'package:rutter/data/services/authentication/auth_repo.dart';
import 'package:rutter/data/services/comment/comment_repo.dart';
import 'package:rutter/data/services/login/login_repo.dart';
import 'package:rutter/data/services/register/register_repo.dart';
import 'package:rutter/data/services/tweet/tweet_repo.dart';
import 'package:rutter/data/services/user/user_repo.dart';
import 'package:rutter/ui/screens/home_screen.dart';
import 'package:rutter/ui/screens/login_screen.dart';
import 'package:rutter/ui/screens/profile_screen.dart';
import 'package:rutter/ui/screens/register_screen.dart';

import 'ui/screens/authentication_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AUTH:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
            AuthenticationCubit(getIt<AuthenticationRepository>())..auth(),
            child: const AuthenticationScreen(),
          ),
        );
      case LOGIN:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LogInCubit(getIt<LoginRepository>()),
            // child: const LogInPage(),
            child: const LogInPage(),
          ),
        );
      case HOME:
        getIt.unregister<TweetCubit>();
        getIt.registerSingleton(TweetCubit(getIt<TweetRepository>()));
        getIt.unregister<CommentCubit>();
        getIt.registerSingleton(CommentCubit(getIt<CommentRepository>()));
        return CupertinoPageRoute(
        builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<TweetCubit>()..fetchTweets(),
              ),
              BlocProvider(
                create: (context) => getIt<CommentCubit>(),
              ),
            ],
            child: const HomePage(),
          )
    );
      case REGISTER:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(getIt<RegisterRepository>()),
            child: const RegistrationPage(),
          ),
        );
      case PROFILE:
        final String args = settings.arguments as String;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UserCubit(getIt<UserRepository>()),
            child: ProfilePage(username: args,),
          ),
        );
      default:
        return null;
    }
  }
}
