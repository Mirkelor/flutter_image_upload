import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_upload/injection.dart';
import 'package:flutter_image_upload/presentation/bloc/image_bloc.dart';
import 'package:flutter_image_upload/presentation/bloc/picked_image_bloc.dart';
import 'package:flutter_image_upload/routes/router.gr.dart';

void main() {
  configureInjection();
  runApp(ImageApp());
}

class ImageApp extends StatelessWidget {
  final _exNavigatorKey = GlobalKey<ExtendedNavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImageBloc>(
          create: (context) => getIt<ImageBloc>(),
        ),
        BlocProvider<PickedImageBloc>(
          create: (context) => getIt<PickedImageBloc>(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Photo Upload',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red.shade800,
          accentColor: Colors.red.shade500,
        ),
        builder: ExtendedNavigator(
          initialRoute: Routes.imageShowPage,
          key: _exNavigatorKey,
          router: Router(),
        ),
      ),
    );
  }
}
