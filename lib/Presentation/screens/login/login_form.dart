import 'package:bocw_contractor_app/utilities/app_color.dart';
import 'package:bocw_contractor_app/utilities/input_formatters.dart';
import 'package:bocw_contractor_app/utilities/validators.dart';
import 'package:bocw_contractor_app/widgets/custom_text.dart';
import 'package:bocw_contractor_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreenItem extends StatefulWidget {
  const LoginScreenItem({super.key});

  @override
  State<LoginScreenItem> createState() => _LoginScreenItemState();
}

class _LoginScreenItemState extends State<LoginScreenItem> {

  /// CONTROLLERS
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// PASSWORD VISIBILITY
  bool isVisible = true;

  void togglePasswordVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// EMAIL
          const CustomText(
            text: "Email",
            fontSize: 15,
            fontWeight: FontWeight.w600,
            textColor: textPrimary,
          ),
          const SizedBox(height: 8),

          CustomTextField(
            hint: "Enter your email",
            controller: emailController,
            readOnly: false,
            textCapitalization: TextCapitalization.none,
            inputFormatters: InputFormatters.specialRestrictions,
            fillColor: cardColor,
            validator: (value) =>
                Validators.emailValidation(value ?? "", context),
          ),

          const SizedBox(height: 18),

          /// PASSWORD
          const CustomText(
            text: "Password",
            fontSize: 15,
            fontWeight: FontWeight.w600,
            textColor: textPrimary,
          ),
          const SizedBox(height: 8),

          CustomTextField(
            hint: "Enter your password",
            controller: passwordController,
            readOnly: false,
            obscureText: isVisible,
            textCapitalization: TextCapitalization.none,
            inputFormatters: InputFormatters.spaceNotAllowed,
            fillColor: cardColor,
            validator: (value) =>
                Validators.passwordValidation(value ?? "", context),
            suffixIcon: IconButton(
              icon: Icon(
                isVisible
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: primaryColor,
              ),
              onPressed: togglePasswordVisibility,
            ),
          ),
        ],
      ),
    );
  }
}