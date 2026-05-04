import 'dart:io';
import 'package:bocw_contractor_app/utilities/app_color.dart';
import 'package:bocw_contractor_app/utilities/image_data.dart';
import 'package:bocw_contractor_app/widgets/image_assets.dart';
import 'package:flutter/material.dart';

class FullScreenImageViewer extends StatelessWidget {
  final String imagePath;
  final bool isLocal;

  const FullScreenImageViewer({
    super.key,
    required this.imagePath,
    required this.isLocal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [

          Center(
            child: InteractiveViewer(
              panEnabled: true,
              minScale: 0.5,
              maxScale: 2,
              child:
              //Image.network(imagePath),
              //Image.asset(imagePath)
              isLocal
                  ? Image.file(File(imagePath))
                  : Image.network(imagePath),
            ),
          ),
          Positioned(
            right: 20,
            top: 40,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: whiteColor,
                  shape: BoxShape.circle,
                ),
                child: ImageAssets(
                  image: closeImage,
                  color: blackColor,
                  height: 10,
                  width: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
