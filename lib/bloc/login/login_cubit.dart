import 'package:bloc/bloc.dart';

import 'package:rutter/data/models/login_data.dart';
import 'package:rutter/data/services/login/login_repo.dart';

part 'login_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final LoginRepository repository;
  LogInCubit(this.repository) : super(LogInInitial(data: LogInData()));

  void updateEmail(String email) {
    final currentState = state;
    if (currentState is LogInChanged || currentState is LogInInitial) {
      emit(LogInChanged(data: currentState.data.copyWith(email: email)));
    }
  }

  void updatePassword(String password) {
    final currentState = state;
    if (currentState is LogInChanged || currentState is LogInInitial) {
      emit(LogInChanged(data: currentState.data.copyWith(password: password)));
    }
  }

  void loginUser(LogInData data) {
    final currentState = state;
    repository.loginUser(data.email, data.password).then((response) => {
      if (response.statusCode == 200 || response.statusCode == 201)
        {emit(LoggedIn())}
      else if (response.statusCode == 400)
        {emit(LogInError(data: currentState.data))}
    });
  }

  void okWithError() {
    final currentState = state;
    emit(LogInChanged(data: currentState.data));
  }
}