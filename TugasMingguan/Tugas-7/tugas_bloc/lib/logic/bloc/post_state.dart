part of 'post_bloc.dart';

@immutable
abstract class PostState extends Equatable {}

class PostLoadingState extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoadedState extends PostState {
  final List<PostModel> posts;
  PostLoadedState(this.posts);
  @override
  List<Object> get props => [];
}

class PostErrorState extends PostState {
  final String error;
  PostErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
