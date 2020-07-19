import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_upload/presentation/bloc/image_bloc.dart';
import 'package:flutter_image_upload/presentation/widgets/image_grid_item.dart';
import 'package:flutter_image_upload/routes/router.gr.dart';

import '../../injection.dart';

class ImageShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _imageBloc = getIt<ImageBloc>();

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
                            itemBuilder: (context, index) => ImageGridItem(
                                imageUrl: snapshot.data.imageList
                                    ?.elementAt(index)
                                    ?.url),
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
            onPressed: () => ExtendedNavigator.root.pushImageUploadPage(),
          ),
        );
      },
    );
  }
}
