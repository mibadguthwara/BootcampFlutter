import 'dart:io';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(const ImagesState());

  Future<void> uploadImage({required String path}) async {
    final imageRef = FirebaseStorage.instance.ref().child('images');

    try {
      emit(const ImagesState(isLoading: true));

      final randomID = "${Random().nextInt(99) * 256}";
      final uploadTask = imageRef.child(randomID).putFile(File(path));

      uploadTask.snapshotEvents.listen(
        (event) {
          switch (event.state) {
            case TaskState.running:
              final progress =
                  100 * (event.bytesTransferred / event.totalBytes);

              emit(
                ImagesState(
                  isLoading: true,
                  uploadProgress: progress / 100,
                ),
              );
              break;

            case TaskState.success:
              event.ref.getDownloadURL().then(
                    (value) => emit(
                      ImagesState(
                        isLoading: false,
                        linkGambar: value,
                      ),
                    ),
                  );
              break;

            case TaskState.error:
              emit(ImagesState(errorMessage: e.toString()));
              break;

            case TaskState.canceled || TaskState.paused:
              break;
          }
        },
      );
    } catch (e) {
      emit(ImagesState(errorMessage: e.toString()));
    }
  }
}
