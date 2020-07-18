import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_upload/entities/picked_image_status.dart';
import 'package:flutter_image_upload/models/picked_image.dart';

class PickedImageGridItem extends StatelessWidget {
  final PickedImage pickedImage;

  const PickedImageGridItem({@required this.pickedImage})
      : assert(pickedImage != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(File(pickedImage.path)),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: pickedImage.status != PickedImageStatus.INITIAL
          ? Builder(
              builder: (context) {
                if (pickedImage.status == PickedImageStatus.IN_PROGRESS) {
                  return Container(
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (pickedImage.status == PickedImageStatus.SUCCESS) {
                  return Icon(
                    Icons.check_box,
                    color: Colors.green,
                  );
                } else if (pickedImage.status == PickedImageStatus.FAIL) {
                  return Icon(
                    Icons.cancel,
                    color: Colors.red,
                  );
                } else {
                  return Container();
                }
              },
            )
          : Container(),
    );
  }
}
