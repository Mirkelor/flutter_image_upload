import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_upload/entities/picked_image_status.dart';
import 'package:flutter_image_upload/injection.dart';
import 'package:flutter_image_upload/models/picked_image.dart';
import 'package:flutter_image_upload/presentation/bloc/picked_image_bloc.dart';
import 'package:flutter_image_upload/presentation/widgets/picked_image_grid_item.dart';
import 'package:flutter_image_upload/routes/router.gr.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ImageUploadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PickedImage> _pickedImageList;
    bool _isAllSuccess = false;
    return BlocBuilder<PickedImageBloc, PickedImageState>(
      builder: (context, state) {
        return buildScaffold(context, _pickedImageList, _isAllSuccess);
      },
    );
  }

  Scaffold buildScaffold(BuildContext context,
      List<PickedImage> _pickedImageList, bool _isAllSuccess) {
    final _bloc = getIt<PickedImageBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<PickedImageBloc, PickedImageState>(
          builder: (context, state) {
            return Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      _bloc.add(PickingPickedImage(_pickedImageList));
                    },
                    child: Text(
                      'Pick Images',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  BlocBuilder(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (state is PickedImageEmpty) {
                        return Container();
                      } else if (state is PickedImageLoading) {
                        return CircularProgressIndicator();
                      } else if (state is PickedImageLoaded) {
                        _pickedImageList = state.pickedImageList;
                        _isAllSuccess = _pickedImageList
                                .where((e) =>
                                    e.status == PickedImageStatus.SUCCESS)
                                .length ==
                            _pickedImageList.length;
                        if (_isAllSuccess) {
                          Fluttertoast.showToast(
                              msg: '✔ Upload Successful',
                              backgroundColor: Colors.green);
                          Future.delayed(Duration(seconds: 3)).then((value) =>
                              ExtendedNavigator.root
                                  .push(Routes.imageShowPage));
                        }
                        return buildImageGrid(_pickedImageList);
                      } else if (state is PickedImageError) {
                        Fluttertoast.showToast(
                            msg: 'It failed', backgroundColor: Colors.red);
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Upload'),
        icon: Icon(Icons.file_upload),
        onPressed: () {
          if (_pickedImageList != null) {
            if (_isAllSuccess) {
              _isAllSuccess = false;
              ExtendedNavigator.root.push(Routes.imageShowPage);
            } else {
              _bloc..add(UploadPickedImage(_pickedImageList));
            }
          }
        },
      ),
    );
  }

  Widget buildImageGrid(List<PickedImage> _pickedImageList) {
    return Expanded(
      child: GridView.count(
          padding: EdgeInsets.all(8),
          crossAxisCount: 3,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          children: _pickedImageList
              .map((pickedImage) =>
                  PickedImageGridItem(pickedImage: pickedImage))
              .toList()),
    );
  }
}
