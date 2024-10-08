import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/repository/user_repository.dart';
import '../../services/model/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>(
      (event, emit) async {
        emit(UserLoadingState());
        try {
          final users = await _userRepository.getUsers();
          emit(UserLoadedState(users));
        } catch (e) {
          emit(
            UserErrorState(
              e.toString(),
            ),
          );
        }
      },
    );
  }
}
