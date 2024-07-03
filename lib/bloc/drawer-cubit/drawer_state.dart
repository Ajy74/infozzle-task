part of 'drawer_cubit.dart';

@immutable
sealed class DrawerState {}

final class DrawerInitial extends DrawerState {}

class DrawerLoadingState extends DrawerState {}

class DrawerLoadedState extends DrawerState {
  final List<CategoryModel> items;
  DrawerLoadedState(this.items);
}

class DrawerErrorState extends DrawerState {
  final String message;
  DrawerErrorState({required this.message});
}