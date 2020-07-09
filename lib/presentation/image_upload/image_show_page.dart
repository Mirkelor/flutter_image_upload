import 'package:flutter/material.dart';

import 'image_upload_page.dart';

class ImageShowPage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Flutter Image Upload'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            'Please upload a image, then you can see your images here!',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Image Upload'),
        icon: Icon(Icons.file_upload),
        onPressed: () => Navigator.of(context)
            .pushReplacementNamed(ImageUploadPage.routeName),
      ),
    );
  }
}
