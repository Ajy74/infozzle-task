part of 'posts_cubit.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

final class PostsLoadingState extends PostsState {}

final class PostsLoadedState extends PostsState {
  final List<AllPostModel> posts;
  PostsLoadedState({required this.posts});
}

final class PostsErrorState extends PostsState {
  final String message;
  PostsErrorState({required this.message});
}
