import 'package:bocw_contractor_app/utilities/image_data.dart';
import 'package:flutter/material.dart';

class ImageAssets extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final double? scale;
  final bool? switchToNetwork;
  const ImageAssets({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.switchToNetwork = false,
    this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return switchToNetwork == false
        ? Image.asset(
            image,
            scale: scale,
            width: width,
            height: height,
            fit: fit,
            color: color,
          )
        : Image.network(
            image,
            fit: fit,
            width: width,
            height: height,
            errorBuilder: (_, __, ___) => Image.asset(emptyImage),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return SizedBox(
                width: width,
                height: height,
                child: const Center(
                  child: SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 1.5),
                  ),
                ),
              );
            },
          );
  }
}
