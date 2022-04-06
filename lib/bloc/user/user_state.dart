part of 'user_cubit.dart';

@immutable
abstract class UserState {
  late UserModel User;
}

class UserInitial extends UserState {}

//! user load states
class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserModel User;

  UserLoaded({required this.User});
}

class UserLoadingError extends UserState {}