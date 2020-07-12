import 'package:flutter/material.dart';
import 'package:flutter_image_upload/presentation/image_upload/image_show_page.dart';
import 'package:flutter_image_upload/presentation/image_upload/image_upload_page.dart';
import 'package:flutter_image_upload/presentation/image_upload/providers/image_path_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImagePathProvider>(
      create: (_) => ImagePathProvider(),
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
