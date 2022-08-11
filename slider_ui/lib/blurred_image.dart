import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlurredImage extends StatelessWidget {
  const BlurredImage({
    Key? key,
    required this.shrinkFactor,
    required this.imageUrl,
    required this.opacity,
  }) : super(key: key);

  final double shrinkFactor;
  final double opacity;

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: shrinkFactor * 25, sigmaY: shrinkFactor * 25),
          child: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(opacity)),
          ),
        ),
      ),
    );
  }
}
