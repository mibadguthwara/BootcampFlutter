import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tugas_bloc/services/model/post_model.dart';
import 'package:tugas_bloc/services/repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;

  PostBloc(this._postRepository) : super(PostLoadingState()) {
    on<LoadPostEvent>(
      (event, emit) async {
        emit(PostLoadingState());
        try {
          final posts = await _postRepository.getPosts();
          emit(PostLoadedState(posts));
        } catch (e) {
          emit(
            PostErrorState(
              e.toString(),
            ),
          );
        }
      },
    );
  }
}
