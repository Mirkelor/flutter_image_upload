import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_upload/presentation/bloc/image_bloc.dart';

import 'image_upload_page.dart';

class ImageShowPage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final ImageBloc _imageBloc = BlocProvider.of<ImageBloc>(context);

    return BlocBuilder<ImageBloc, ImageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('Flutter Image Upload'),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: StreamBuilder(
                  stream: _imageBloc..add(LoadImage()),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? GridView.builder(
                            itemCount: snapshot.data.imageList?.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 6,
                              crossAxisSpacing: 6,
                            ),
                            itemBuilder: (context, index) => CachedNetworkImage(
                              imageUrl: snapshot.data.imageList
                                  ?.elementAt(index)
                                  ?.url,
                              placeholder: (_, __) => Center(
                                child: SizedBox(
                                  width: 32,
                                  height: 32,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: Text(
                            'Please upload some images here',
                            style: TextStyle(fontSize: 32),
                          ));
                  }),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: Text('Image Upload'),
            icon: Icon(Icons.file_upload),
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(ImageUploadPage.routeName),
          ),
        );
      },
    );
  }
}
