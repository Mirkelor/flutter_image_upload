import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_image_upload/models/image.dart';
import 'package:flutter_image_upload/repositories/firebase_image_repository.dart';
import 'package:flutter_image_upload/repositories/image_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'image_event.dart';
part 'image_state.dart';

@injectable
class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final FirebaseImageRepository _imageRepository;
  StreamSubscription _imageSubscription;

  ImageBloc({@required ImageRepository imageRepository})
      : assert(imageRepository != null),
        _imageRepository = imageRepository,
        super(ImageLoaded([]));

  @override
  Stream<ImageState> mapEventToState(
    ImageEvent event,
  ) async* {
    if (event is LoadImage) {
      yield* _mapLoadImageToState();
    } else if (event is ImageListUpdated) {
      yield* _mapImageListUpdateToState(event);
    }
  }

  Stream<ImageState> _mapLoadImageToState() async* {
    _imageSubscription?.cancel();
    _imageSubscription = _imageRepository.imageList().listen((imageList) {
      add(ImageListUpdated(imageList));
    });
  }

  Stream<ImageState> _mapImageListUpdateToState(ImageListUpdated event) async* {
    yield ImageLoaded(event.imageList);
  }

  @override
  Future<void> close() {
    _imageSubscription?.cancel();
    return super.close();
  }
}
