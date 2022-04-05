import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutter/bloc/authentication/authentication_cubit.dart';
import 'package:rutter/bloc/login/login_cubit.dart';
import 'package:rutter/bloc/register/register_cubit.dart';
import 'package:rutter/bloc/tweet/tweet_cubit.dart';
import 'package:rutter/constants/locator.dart';
import 'package:rutter/constants/paths.dart';
import 'package:rutter/data/services/authentication/auth_repo.dart';
import 'package:rutter/data/services/login/login_repo.dart';
import 'package:rutter/data/services/register/register_repo.dart';
import 'package:rutter/data/services/tweet/tweet_repo.dart';
import 'package:rutter/ui/screens/home_screen.dart';
import 'package:rutter/ui/screens/login_screen.dart';
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
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TweetCubit(getIt<TweetRepository>()),
            child: const HomePage(),
          ),
          // builder: (_) => MultiBlocProvider(
          //   providers: [
          //     BlocProvider(
          //       create: (context) => getIt<TaskCubit>()..fetchTasks(),
          //     ),
          //     BlocProvider(
          //       create: (context) => getIt<ProjectsCubit>()..fetchProjects(),
          //     )
          //   ],
          //   child: HomePage(),
          // ),
        );
      case REGISTER:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(getIt<RegisterRepository>()),
            child: const RegistrationPage(),
          ),
        );
      // case PROJECT_DETAILS:
      //   if (getIt.isRegistered<ProjectTasksCubit>()) {
      //     getIt.unregister<ProjectTasksCubit>();
      //   }
      //   getIt.registerSingleton(ProjectTasksCubit(getIt<TaskRepository>()));
      //   final args = settings.arguments as ProjectDetailsScreenArguments;
      //   return CupertinoPageRoute(
      //     builder: (_) => MultiBlocProvider(
      //       providers: [
      //         BlocProvider(
      //           create: (context) => getIt<ProjectTasksCubit>(),
      //         ),
      //       ],
      //       child: ProjectDetails(id: args.id, title: args.title),
      //     ),
      //   );
      // case PROFILE:
      //   return CupertinoPageRoute(
      //     builder: (_) => const Profile(),
      //   );
      default:
        return null;
    }
  }
}