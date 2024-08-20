import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/models/user.dart';
import '/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository = UserRepository();

  UserBloc() : super(UserInitial()) {
    on<LoadUserById>((event, emit) async {
      emit(UserLoading());
      try {
        final User user = await _userRepository.getById(event.id);
        emit(UserByIdLoaded(user));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
