import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_tracker/utils/colours.dart';

enum ImageSourceType { asset, network, file, svg }

class RoundedImage extends StatelessWidget {
  final EdgeInsets padding;
  final double width;
  final String source;
  final ImageSourceType type;
  final BoxFit fit;
  final Color color;
  final Color borderColor;

  const RoundedImage({
    super.key,
    this.padding = const EdgeInsets.all(0),
    this.width = 50,
    required this.source,
    this.type = ImageSourceType.asset,
    this.fit = BoxFit.cover,
    this.color = Colours.whiteColor,
    this.borderColor = Colors.transparent,
  });

  Widget _buildImage() {
    switch (type) {
      case ImageSourceType.network:
        return Image.network(source, width: width, height: width, fit: fit);

      case ImageSourceType.file:
        return Image.file(
          File(source),
          width: width,
          height: width,
          fit: fit,

          errorBuilder: (context, error, stackTrace) => _errorPlaceholder(),
        );

      case ImageSourceType.svg:
        return SvgPicture.asset(source, width: width, height: width, fit: fit);

      case ImageSourceType.asset:
        return Image.asset(
          source,
          width: width,
          height: width,
          fit: fit,
          errorBuilder: (context, error, stackTrace) => _errorPlaceholder(),
        );
    }
  }

  Widget _errorPlaceholder() {
    return Container(
      color: Colors.grey[300],
      child: Icon(
        Icons.image_not_supported,
        size: width * 0.5,
        color: Colors.grey[600],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor),
      ),
      child: ClipRRect(child: _buildImage()),
    );
  }
}
