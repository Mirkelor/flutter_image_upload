import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_upload/core/constants.dart';
import 'package:flutter_image_upload/models/picked_image.dart';
import 'package:flutter_image_upload/repositories/picked_image_repository.dart';

part 'picked_image_event.dart';

part 'picked_image_state.dart';

class PickedImageBloc extends Bloc<PickedImageEvent, PickedImageState> {
  final PickedImageRepository _repository;
  StreamSubscription _imageSubscription;

  PickedImageBloc({@required PickedImageRepository repository})
      : _repository = repository,
        assert(repository != null),
        super(PickedImageEmpty());

  @override
  Stream<PickedImageState> mapEventToState(
    PickedImageEvent event,
  ) async* {
    if (event is EmptyPickedImage) {
      yield PickedImageEmpty();
    } else if (event is PickingPickedImage) {
      yield PickedImageLoading();
      yield* _mapLoadEventToState(event);
    } else if (event is LoadedPickedImage) {
      yield* _mapPickedImageListUpdateToState(event);
    } else if (event is UploadPickedImage) {
      yield* _mapUploadEventToState(event.pickedImageList);
    }
  }

  Stream<PickedImageState> _mapPickedImageListUpdateToState(
      LoadedPickedImage event) async* {
    yield PickedImageLoaded(event.pickedImageList);
  }

  Stream<PickedImageState> _mapLoadEventToState(
      PickingPickedImage event) async* {
    _imageSubscription?.cancel();
    _imageSubscription =
        _repository.pickedImageList().listen((failureOrPickedImage) {
      failureOrPickedImage.fold(
        (failure) => PickedImageError(message: PICKED_IMAGE_FAILURE_MESSAGE),
        (pickedImageList) => pickedImageList != null
            ? add(LoadedPickedImage(pickedImageList))
            : event.pickedImageList != null
                ? add(LoadedPickedImage(event.pickedImageList))
                : add(EmptyPickedImage()),
      );
    });
  }

  Stream<PickedImageState> _mapUploadEventToState(
      List<PickedImage> pickedImageList) async* {
    _imageSubscription?.cancel();
    _imageSubscription = _repository
        .uploadPickedImageList(pickedImageList)
        .listen((pickedImage) {
      pickedImageList = pickedImageList
          .map((e) => e.name == pickedImage.name ? pickedImage : e)
          .toList();
      add(LoadedPickedImage(pickedImageList));
    });
  }

  @override
  Future<void> close() {
    _imageSubscription?.cancel();
    return super.close();
  }
}
