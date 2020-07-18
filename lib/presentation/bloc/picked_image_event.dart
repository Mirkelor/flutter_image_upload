part of 'picked_image_bloc.dart';

abstract class PickedImageEvent extends Equatable {
  const PickedImageEvent();

  @override
  List<Object> get props => [];
}

class EmptyPickedImage extends PickedImageEvent {}

class LoadingPickedImage extends PickedImageEvent {}

class PickingPickedImage extends PickedImageEvent {
  final List<PickedImage> pickedImageList;

  const PickingPickedImage(this.pickedImageList);

  @override
  List<Object> get props => [pickedImageList];
}

class LoadedPickedImage extends PickedImageEvent {
  final List<PickedImage> pickedImageList;

  const LoadedPickedImage(this.pickedImageList);

  @override
  List<Object> get props => [pickedImageList];
}

class UploadPickedImage extends PickedImageEvent {
  final List<PickedImage> pickedImageList;

  const UploadPickedImage(this.pickedImageList);

  @override
  List<Object> get props => [pickedImageList];
}
