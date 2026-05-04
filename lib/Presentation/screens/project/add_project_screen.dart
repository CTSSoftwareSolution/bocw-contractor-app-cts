import 'package:bocw_contractor_app/utilities/validators.dart';
import 'package:flutter/material.dart';
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

  String? selectedLocation;
  double? lat;
  double? lng;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const CustomText(
          text: "Add Project",
          textColor: whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              hint: "Project Name",
              controller: projectNameController,
              readOnly: false,
              textCapitalization: TextCapitalization.words,
              validator: (value) =>
                  Validators.textValidation(value ?? "", context),
            ),
            const SizedBox(height: 12),
            CustomTextField(
              hint: "Address",
              controller: addressController,
              readOnly: false,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 3,
              validator: (value) =>
                  Validators.textValidation(value ?? "", context),
            ),
            const SizedBox(height: 12),
            CustomTextField(
              hint: "Registration No",
              controller: regController,
              readOnly: false,
              textCapitalization: TextCapitalization.characters,
              validator: (value) =>
                  Validators.textValidation(value ?? "", context),
            ),
            const SizedBox(height: 16),
            CustomContainer(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MapSelectionScreen()),
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
            uploadBox("Upload Document", isDocumentUploaded, () {
              setState(() {
                isDocumentUploaded = true;
              });
            }),
            const SizedBox(height: 12),
            uploadBox("Upload Video (Optional)", isVideoUploaded, () {
              setState(() {
                isVideoUploaded = true;
              });
            }),
            const SizedBox(height: 24),
            CustomButton(
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
          ],
        ),
      ),
    );
  }

  Widget uploadBox(String title, bool isUploaded, VoidCallback onTap) {
    return CustomContainer(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isUploaded ? successColor : borderColor),
      ),
      child: Row(
        children: [
          Icon(Icons.upload_file, color: primaryColor),
          const SizedBox(width: 10),
          Expanded(
            child: CustomText(
              text: isUploaded ? "$title ✓" : title,
              fontSize: 13,
              textColor: textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
