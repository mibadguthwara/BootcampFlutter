import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/model/post.dart';
import '/repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository = PostRepository();

  PostBloc() : super(PostInitial()) {
    on<LoadPost>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await _postRepository.getAll();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });
  }
}
