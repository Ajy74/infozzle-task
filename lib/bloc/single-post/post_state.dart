part of 'post_cubit.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoadingState extends PostState {}

final class PostLoadedState extends PostState {
  final SinglePostModel post;
  PostLoadedState({required this.post});
}

final class PostErrorState extends PostState {
  final String message;
  PostErrorState({required this.message});
}