import 'package:bocw_contractor_app/utilities/app_color.dart';
import 'package:bocw_contractor_app/utilities/input_formatters.dart';
import 'package:bocw_contractor_app/utilities/validators.dart';
import 'package:bocw_contractor_app/widgets/custom_text.dart';
import 'package:bocw_contractor_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterScreenItem extends StatefulWidget {
  const RegisterScreenItem({super.key});

  @override
  State<RegisterScreenItem> createState() => _RegisterScreenItemState();
}

class _RegisterScreenItemState extends State<RegisterScreenItem> {

  /// CONTROLLERS
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final regNoController = TextEditingController();
  final passwordController = TextEditingController();

  bool isVisible = true;

  void togglePasswordVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    addressController.dispose();
    regNoController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(text: "Name", fontWeight: FontWeight.w600),
        const SizedBox(height: 8),
        CustomTextField(
          hint: "Enter your name",
          controller: nameController,
          readOnly: false,
          textCapitalization: TextCapitalization.words,
          inputFormatters: InputFormatters.normalText,
          fillColor: cardColor,
          validator: (value) => Validators.textValidation(value ?? "", context),
        ),

        const SizedBox(height: 16),
        const CustomText(text: "Mobile", fontWeight: FontWeight.w600),
        const SizedBox(height: 8),
        CustomTextField(
          hint: "Enter mobile number",
          controller: mobileController,
          readOnly: false,
          keyboardType: TextInputType.phone,
          textCapitalization: TextCapitalization.none,
          inputFormatters: InputFormatters.mobileNumber,
          fillColor: cardColor,
          validator: (value) => Validators.mobileValidation(value ?? "", context),
        ),

        const SizedBox(height: 16),
        const CustomText(text: "Email", fontWeight: FontWeight.w600),
        const SizedBox(height: 8),
        CustomTextField(
          hint: "Enter your email",
          controller: emailController,
          readOnly: false,
          textCapitalization: TextCapitalization.none,
          inputFormatters: InputFormatters.spaceNotAllowed,
          fillColor: cardColor,
          validator: (value) => Validators.emailValidation(value ?? "", context),
        ),

        const SizedBox(height: 16),
        const CustomText(text: "Address", fontWeight: FontWeight.w600),
        const SizedBox(height: 8),
        CustomTextField(
          hint: "Enter your address",
          controller: addressController,
          readOnly: false,
          maxLines: 3,
          textCapitalization: TextCapitalization.sentences,
          inputFormatters: InputFormatters.textWithNumAndSpecialChar,
          fillColor: cardColor,
          validator: (value) => Validators.textValidation(value ?? "", context),
        ),

        const SizedBox(height: 16),
        const CustomText(text: "Registration No.", fontWeight: FontWeight.w600),
        const SizedBox(height: 8),
        CustomTextField(
          hint: "Enter registration number",
          controller: regNoController,
          readOnly: false,
          textCapitalization: TextCapitalization.characters,
          inputFormatters: InputFormatters.textWithNum,
          fillColor: cardColor,
          validator: (value) => Validators.textValidation(value ?? "", context),
        ),

        const SizedBox(height: 16),
        const CustomText(text: "Password", fontWeight: FontWeight.w600),
        const SizedBox(height: 8),
        CustomTextField(
          textCapitalization: TextCapitalization.none,
          hint: "Enter password",
          controller: passwordController,
          readOnly: false,
          obscureText: isVisible,
          inputFormatters: InputFormatters.spaceNotAllowed,
          fillColor: cardColor,
          validator: (value) => Validators.passwordValidation(value ?? "", context),
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility_off : Icons.visibility,
              color: primaryColor,
            ),
            onPressed: togglePasswordVisibility,
          ),
        ),
      ],
    );
  }
}