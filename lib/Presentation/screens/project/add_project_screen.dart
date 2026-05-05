import 'dart:io';
import 'package:bocw_contractor_app/Presentation/screens/project/upload_file_container.dart';
import 'package:bocw_contractor_app/utilities/validators.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utilities/app_color.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/custom_button.dart';
import 'map_selection_screen.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController regController = TextEditingController();
  final ImagePicker picker = ImagePicker();

  String? selectedLocation;
  double? lat;
  double? lng;
  File? documentFile;
  File? videoFile;

  bool isDocumentUploaded = false;
  bool isVideoUploaded = false;

  @override
  void dispose() {
    projectNameController.dispose();
    addressController.dispose();
    regController.dispose();
    super.dispose();
  }

  void saveProject() {
    if (projectNameController.text.isEmpty ||
        addressController.text.isEmpty ||
        regController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    if (selectedLocation == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please select location")));
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Project Saved Successfully")));
  }

  Future<void> pickDocumentFromCamera() async {
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      setState(() {
        documentFile = File(file.path);
      });
    }
  }

  Future<void> pickDocumentFromGallery() async {
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        documentFile = File(file.path);
      });
    }
  }

  Future<void> pickVideoFromCamera() async {
    final XFile? file = await picker.pickVideo(source: ImageSource.camera);
    if (file != null) {
      setState(() {
        videoFile = File(file.path);
      });
    }
  }

  Future<void> pickVideoFromGallery() async {
    final XFile? file = await picker.pickVideo(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        videoFile = File(file.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const CustomText(
          text: "Add Project",
          textColor: whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Project Name",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hint: "Enter project name",
                      controller: projectNameController,
                      readOnly: false,
                      textCapitalization: TextCapitalization.words,
                      validator: (value) =>
                          Validators.textValidation(value ?? "", context),
                    ),
                    const SizedBox(height: 12),
                    CustomText(
                      text: "Address",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hint: "Enter address",
                      controller: addressController,
                      readOnly: false,
                      maxLines: 3,
                      textCapitalization: TextCapitalization.sentences,
                      validator: (value) =>
                          Validators.textValidation(value ?? "", context),
                    ),
                    const SizedBox(height: 12),
                    CustomText(
                      text: "Registration No",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hint: "Enter registration no",
                      controller: regController,
                      readOnly: false,
                      textCapitalization: TextCapitalization.characters,
                      validator: (value) =>
                          Validators.textValidation(value ?? "", context),
                    ),
                    const SizedBox(height: 16),
                    CustomText(
                      text: "Select Location",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 10),
                    CustomContainer(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const MapSelectionScreen(),),
                        );
                        if (result != null) {
                          setState(() {
                            lat = result['lat'];
                            lng = result['lng'];
                            selectedLocation = result['address'];
                            addressController.text = result['address'];
                          });
                        }
                      },
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedLocation == null ? borderColor : primaryColor,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: selectedLocation ?? "Select Location",
                            fontSize: 14,
                            textColor: selectedLocation == null
                                ? textSecondary
                                : textPrimary,
                          ),
                          Icon(Icons.location_on, color: primaryColor),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomText(
                      text: "Upload Document",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 10),
                    UploadImageContainer(
                      file: documentFile,
                      title: "Upload Document",
                      onCamera: pickDocumentFromCamera,
                      onGallery: pickDocumentFromGallery,
                      onRemove: () => setState(() => documentFile = null),
                    ),
                    const SizedBox(height: 16),
                    CustomText(
                      text: "Upload Video",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 10),
                    UploadImageContainer(
                      file: videoFile,
                      title: "Upload Video",
                      onCamera: pickVideoFromCamera,
                      onGallery: pickVideoFromGallery,
                      onRemove: () => setState(() => videoFile = null),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: backgroundColor,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: SafeArea(
                child: CustomButton(
                  buttonText: "Save Project",
                  onPress: saveProject,
                  backgroundColor: primaryColor,
                  foregroundColor: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fontSize: 14,
                  width: double.infinity,
                  height: 45,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
