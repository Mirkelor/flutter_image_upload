import 'package:flutter/material.dart';
import 'package:flutter_image_upload/presentation/image_upload/image_show_page.dart';
import 'package:flutter_image_upload/presentation/image_upload/image_upload_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
