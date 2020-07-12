import 'dart:io';

import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  final Map<String, String> paths;
  final bool loadingPath;

  const ImageGrid({
    @required this.paths,
    @required this.loadingPath,
  });

  @override
  Widget build(BuildContext context) {
    return paths != null
        ? GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            padding: EdgeInsets.all(6),
            children: List.generate(paths.length, (index) {
              return loadingPath
                  ? Center(
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(File(paths.values.elementAt(index))),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    );
            }),
          )
        : Container();
  }
}
