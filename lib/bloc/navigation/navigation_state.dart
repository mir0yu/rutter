
part of 'navigation_cubit.dart';

@immutable
class NavigationState {
  final String navbarItem;
  final int index;

  const NavigationState(this.navbarItem, this.index);

  List<Object> get props => [navbarItem, index];
}