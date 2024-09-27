import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FetchImageWidget extends StatelessWidget {
  final String? image;
  final String? imagePlaceHolder;
  const FetchImageWidget(
      {required this.image, required this.imagePlaceHolder, super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image!,
      placeholder: (context, url) => Image.network(
        imagePlaceHolder!,
        fit: BoxFit.fill,
      ),
      errorWidget: (context, url, error) => Image.network(
        imagePlaceHolder!,
        fit: BoxFit.fill,
      ),
      fit: BoxFit.fill,
    );
  }
}
