import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/image_path_provider.dart';

class MultiImagePicker extends StatefulWidget {
  final Map<String, String> paths;
  final bool loadingPath;

  const MultiImagePicker({
    @required this.paths,
    @required this.loadingPath,
  });

  @override
  _MultiImagePickerState createState() => _MultiImagePickerState();
}

class _MultiImagePickerState extends State<MultiImagePicker> {
  FileType _pickingType = FileType.image;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Theme.of(context).accentColor,
      onPressed: _openFileExplorer,
      child: Text(
        'Pick Images',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _openFileExplorer() async {
    final imagePath = Provider.of<ImagePathProvider>(context, listen: false);
    imagePath.setLoadingPath(true);
    try {
      imagePath.setPaths(await FilePicker.getMultiFilePath(
            type: _pickingType,
          ) ??
          widget.paths);
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    imagePath.setLoadingPath(false);
  }
}
