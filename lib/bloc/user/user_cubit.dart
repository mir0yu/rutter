import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rutter/data/models/user_model.dart';
import 'package:rutter/data/services/user/user_repo.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository repository;

  UserCubit(this.repository) : super(UserInitial());
  void fetchUser(String username) {
    emit(UserLoading());
    repository.getUser(username).then((response) {
      if (response.statusCode == 200) {
        var rawUser = jsonDecode(utf8.decode(response.bodyBytes));
        UserModel user = UserModel.fromJson((rawUser));
        emit(UserLoaded(User: user));
      } else {
        emit(UserLoadingError());
      }
    });
  }
  void fetchSelfUser() {
    emit(UserLoading());
    repository.getSelfUser().then((response) {
      if (response.statusCode == 200) {
        var rawUser = jsonDecode(utf8.decode(response.bodyBytes));
        UserModel user = UserModel.fromJson((rawUser));
        emit(UserLoaded(User: user));
      } else {
        emit(UserLoadingError());
      }
    });
  }
}
