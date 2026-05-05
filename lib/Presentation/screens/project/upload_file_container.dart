import 'dart:io';
import 'package:flutter/material.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/hardcoded_data.dart';
import '../../../utilities/image_data.dart';
import '../../../widgets/document_widget.dart';
import '../../../widgets/custom_bottom_sheet.dart';
import '../../../widgets/custom_text.dart';

class UploadImageContainer extends StatelessWidget {
  final File? file;
  final String title;
  final VoidCallback onCamera;
  final VoidCallback onGallery;
  final VoidCallback onRemove;

  const UploadImageContainer({
    super.key,
    required this.file,
    required this.title,
    required this.onCamera,
    required this.onGallery,
    required this.onRemove,
  });

  bool isVideo(String path) {
    return path.toLowerCase().endsWith(".mp4") ||
        path.toLowerCase().endsWith(".mov") ||
        path.toLowerCase().endsWith(".mkv");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: buildDocumentWidget(
        child: SizedBox(
          width: double.infinity,
          height: 120,
          child: file != null
              ? Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: isVideo(file!.path)
                            ? Container(
                                color: Colors.black,
                                child: const Center(
                                  child: Icon(
                                    Icons.play_circle_fill,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              )
                            : Image.file(file!, fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: -2,
                      right: -2,
                      child: GestureDetector(
                        onTap: onRemove,
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Image.asset(
                    uploadImage,
                    color: primaryColor,
                    scale: 2.5,
                  ),
                ),
        ),
        title: file != null ? file!.path.split('/').last : title,
        onTap: () {
          customBottomSheet(
            context: context,
            title: "Select Media",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: mediaPickerColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            camera,
                            height: 20,
                            width: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      title: const CustomText(
                        text: "Camera",
                        fontWeight: FontWeight.w600,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        onCamera();
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: mediaPickerColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            gallery,
                            height: 20,
                            width: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      title: const CustomText(
                        text: "Gallery",
                        fontWeight: FontWeight.w600,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        onGallery();
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Close",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
        containerColor: cardColor,
        backgroundColor: mediaPickerColor,
        border: BoxBorder.all(color: borderColor),
        buttonText: upload,
      ),
    );
  }
}
