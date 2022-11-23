import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNetworkSvg extends StatelessWidget {
  const CustomNetworkSvg({super.key, required this.url, this.height, this.color});

  final String url;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      "$url",
      width: height,
      height: height,
      color: color,
      placeholderBuilder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(30.0),
        child: const CircularProgressIndicator()
      ),
    );
  }
}