part of 'posts_cubit.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<PostsResponseModel> response;

  PostsLoaded({required this.response});
}

class PostsError extends PostsState {
  final String error;

  PostsError({required this.error});
}
