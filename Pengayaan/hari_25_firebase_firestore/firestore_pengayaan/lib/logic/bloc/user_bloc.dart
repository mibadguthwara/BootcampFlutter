import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final db = FirebaseFirestore.instance;

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? streamSubscription;

  UserBloc() : super(const UserState()) {
    on<UsersFetch>((event, emit) {
      final col = db.collection('users');

      streamSubscription = col.snapshots().listen((data) {
        add(
          UsersUpdated(
            users: data.docs.map((e) => e.data()).toList(),
          ),
        );
      });
    });

    on<UsersAdded>((event, emit) async {
      await db.collection('users').add(
        {'nama': event.nama, 'umur': event.umur},
      );
    });

    on<UsersUpdated>((event, emit) {
      emit(UserState(users: event.users));
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
