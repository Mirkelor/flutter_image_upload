import 'package:flutter/material.dart';
import 'package:flutter_image_upload/presentation/image_upload/image_show_page.dart';

class ImageUploadPage extends StatelessWidget {
  static const routeName = '/image-upload';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Image Upload Page'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          alignment: Alignment.topCenter,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Theme.of(context).accentColor,
            onPressed: () {},
            child: Text(
              'Pick Images',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Save'),
        icon: Icon(Icons.save),
        onPressed: () =>
            Navigator.of(context).pushReplacementNamed(ImageShowPage.routeName),
      ),
    );
  }
}
