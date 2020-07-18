import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_upload/datasources/picked_image_local_data_source.dart';
import 'package:flutter_image_upload/datasources/picked_image_remote_data_source.dart';
import 'package:flutter_image_upload/presentation/bloc/image_bloc.dart';
import 'package:flutter_image_upload/presentation/bloc/picked_image_bloc.dart';
import 'package:flutter_image_upload/presentation/pages/image_show_page.dart';
import 'package:flutter_image_upload/presentation/pages/image_upload_page.dart';
import 'package:flutter_image_upload/repositories/firebase_image_repository.dart';
import 'package:flutter_image_upload/repositories/picked_image_repository.dart';

void main() {
  runApp(ImageApp());
}

class ImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImageBloc>(
          create: (context) =>
              ImageBloc(imageRepository: FirebaseImageRepository()),
        ),
        BlocProvider<PickedImageBloc>(
          create: (context) => PickedImageBloc(
              repository: PickedImageRepository(
            localDataSource: PickedImageLocalDataSource(),
            remoteDataSource: PickedImageRemoteDataSource(),
          )),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Photo Upload',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red.shade800,
          accentColor: Colors.red.shade500,
        ),
        initialRoute: '/',
        routes: {
          ImageShowPage.routeName: (ctx) => ImageShowPage(),
          ImageUploadPage.routeName: (ctx) => ImageUploadPage(),
        },
      ),
    );
  }
}

//return ChangeNotifierProvider<ImagePathProvider>(
//create: (_) => ImagePathProvider(),
