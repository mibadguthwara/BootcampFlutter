part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {
  @override
  List<Object> get props => [];
}

final class PostLoaded extends PostState {
  final List<Post> posts;
  const PostLoaded(this.posts);
  @override
  List<Object> get props => [posts];
}

final class PostError extends PostState {
  final String error;
  const PostError(this.error);
  @override
  List<Object> get props => [error];
}
