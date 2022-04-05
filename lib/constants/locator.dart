import 'package:get_it/get_it.dart';
import 'package:rutter/bloc/authentication/authentication_cubit.dart';
import 'package:rutter/bloc/login/login_cubit.dart';
import 'package:rutter/bloc/register/register_cubit.dart';
import 'package:rutter/bloc/tweet/tweet_cubit.dart';
import 'package:rutter/data/services/authentication/auth_api_provider.dart';
import 'package:rutter/data/services/authentication/auth_repo.dart';
import 'package:rutter/data/services/login/login_api_provider.dart';
import 'package:rutter/data/services/login/login_repo.dart';
import 'package:rutter/data/services/register/register_api_provider.dart';
import 'package:rutter/data/services/register/register_repo.dart';
import 'package:rutter/data/services/tweet/tweet_api_provider.dart';
import 'package:rutter/data/services/tweet/tweet_repo.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // LogIn
  getIt.registerSingleton(LoginNetworkService());
  getIt.registerSingleton(LoginRepository(getIt<LoginNetworkService>()));
  getIt.registerSingleton(LogInCubit(getIt<LoginRepository>()));


  // Authentication
  getIt.registerSingleton(AuthenticationNetworkService());
  getIt.registerSingleton(
      AuthenticationRepository(getIt<AuthenticationNetworkService>()));
  getIt.registerSingleton(
      AuthenticationCubit(getIt<AuthenticationRepository>()));

  // Registration
  getIt.registerSingleton(RegisterNetworkService());
  getIt.registerSingleton(
      RegisterRepository(getIt<RegisterNetworkService>()));
  getIt.registerSingleton(
      RegisterCubit(getIt<RegisterRepository>()));

  // Tweet
  getIt.registerSingleton(TweetNetworkService());
  getIt.registerSingleton(TweetRepository(getIt<TweetNetworkService>()));
  getIt.registerSingleton(TweetCubit(getIt<TweetRepository>()));


}