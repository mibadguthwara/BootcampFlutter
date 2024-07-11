part of 'drawer_bloc.dart';

@immutable
sealed class DrawerEvent {}

class OpenDrawer extends DrawerEvent {
  List<Object> get props => [];
}

class CloseDrawer extends DrawerEvent {
  List<Object> get props => [];
}
