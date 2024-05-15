import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PersonCacheImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  const PersonCacheImage(
      {super.key,
      required this.imageUrl,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) => _imageWidget(imageProvider),
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => _imageWidget(
        const AssetImage('assets/images/noimage.jpg'),
      ),
    );
  }
}

Widget _imageWidget(ImageProvider imageProvider) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(16),
      ),
      image: DecorationImage(
        image: imageProvider,
        fit: BoxFit.cover,
      ),
    ),
  );
}
