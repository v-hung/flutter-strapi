import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.url, this.fit});

  final String url;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$url",
      errorBuilder: (context, error, stackTrace) {
        return Image.asset('images/404.png');
      },
      fit: fit,
    );
  }
}