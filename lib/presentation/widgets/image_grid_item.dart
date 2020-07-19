import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageGridItem extends StatelessWidget {
  final String imageUrl;

  const ImageGridItem({@required this.imageUrl}) : assert(imageUrl != null);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      placeholder: (_, __) => Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
