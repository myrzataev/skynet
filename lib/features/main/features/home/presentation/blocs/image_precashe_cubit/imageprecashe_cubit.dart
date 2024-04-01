import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'imageprecashe_state.dart';

class ImageprecasheCubit extends Cubit<ImageprecasheState> {
  ImageprecasheCubit() : super(ImageprecasheInitial());

  Future<void> precacheImage(BuildContext context, String imageUrl) async {
    emit(ImageprecasheLoading());
    try {
      final ImageProvider imageProvider = NetworkImage(imageUrl);
      final ImageStream imageStream =
          imageProvider.resolve(const ImageConfiguration());
      final Completer<void> completer = Completer<void>();

      // Define a variable for the listener outside the listener itself.
      ImageStreamListener? imageStreamListener;

      // Now instantiate the listener and assign it to the variable.
      imageStreamListener = ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          if (imageStreamListener != null) {
            imageStream.removeListener(imageStreamListener);
          }
          completer.complete();
        },
        onError: (exception, stackTrace) {
          if (imageStreamListener != null) {
            imageStream.removeListener(imageStreamListener);
          }
          emit(ImageprecasheError());
          completer.complete();
        },
      );

      // Add the listener to the stream.
      imageStream.addListener(imageStreamListener);
      await completer.future;
      emit(ImageprecasheSuccess());
    } catch (_) {
      emit(ImageprecasheError());
    }
  }
}
