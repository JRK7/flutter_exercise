import 'package:flutter/material.dart';

class NetworkImageWithLoader extends StatelessWidget {
  const NetworkImageWithLoader(
      {super.key,
      required this.imageUrl,
      this.borderRadius = 5.0,
      this.fit = BoxFit.contain,
      this.width});

  final String imageUrl;
  final double borderRadius;
  final BoxFit fit;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(imageUrl, fit: fit, width: width,
          loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
