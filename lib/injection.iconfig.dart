// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_image_upload/repositories/firebase_image_repository.dart';
import 'package:flutter_image_upload/repositories/image_repository.dart';
import 'package:flutter_image_upload/datasources/picked_image_local_data_source.dart';
import 'package:flutter_image_upload/datasources/picked_image_remote_data_source.dart';
import 'package:flutter_image_upload/repositories/picked_image_repository.dart';
import 'package:flutter_image_upload/presentation/bloc/image_bloc.dart';
import 'package:flutter_image_upload/presentation/bloc/picked_image_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<ImageRepository>(() => FirebaseImageRepository());
  g.registerLazySingleton<PickedImageLocalDataSource>(
      () => PickedImageLocalDataSource());
  g.registerLazySingleton<PickedImageRemoteDataSource>(
      () => PickedImageRemoteDataSource());
  g.registerLazySingleton<PickedImageRepository>(() => PickedImageRepository(
      localDataSource: g<PickedImageLocalDataSource>(),
      remoteDataSource: g<PickedImageRemoteDataSource>()));
  g.registerFactory<ImageBloc>(
      () => ImageBloc(imageRepository: g<ImageRepository>()));
  g.registerFactory<PickedImageBloc>(
      () => PickedImageBloc(repository: g<PickedImageRepository>()));
}
