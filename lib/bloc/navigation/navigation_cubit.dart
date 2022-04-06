import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState('HOME', 0));

  void getNavBarItem(String navbarItem) {
    switch (navbarItem) {
      case 'HOME':
        emit(const NavigationState('HOME', 0));
        break;
      // case NavbarItem.settings:
      //   emit(NavigationState(NavbarItem.settings, 1));
      //   break;
      case 'PROFILE':
        emit(const NavigationState('PROFILE', 2));
        break;
    }
  }
}