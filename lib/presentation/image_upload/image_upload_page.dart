import 'package:flutter/material.dart';
import 'package:flutter_image_upload/presentation/image_upload/image_show_page.dart';
import 'package:flutter_image_upload/presentation/image_upload/providers/image_path_provider.dart';
import 'package:flutter_image_upload/presentation/image_upload/widgets/image_grid.dart';
import 'package:provider/provider.dart';

import 'widgets/widgets.dart';

class ImageUploadPage extends StatelessWidget {
  static const routeName = '/image-upload';

  @override
  Widget build(BuildContext context) {
    final imagePath = Provider.of<ImagePathProvider>(context, listen: false);
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
          child: Consumer<ImagePathProvider>(
            builder: (_, imagePath, __) => Column(
              children: <Widget>[
                MultiImagePicker(
                  loadingPath: imagePath.loadingPath,
                  paths: imagePath.paths,
                ),
                Expanded(
                  child: ImageGrid(
                    paths: imagePath.paths,
                    loadingPath: imagePath.loadingPath,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Save'),
        icon: Icon(Icons.save),
        onPressed: () {
          imagePath.clear();
          return Navigator.of(context)
              .pushReplacementNamed(ImageShowPage.routeName);
        },
      ),
    );
  }
}
