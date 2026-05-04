import 'package:bocw_contractor_app/Presentation/screens/reset_password/reset_password_form.dart';
import 'package:bocw_contractor_app/utilities/app_color.dart';
import 'package:bocw_contractor_app/utilities/image_data.dart';
import 'package:bocw_contractor_app/widgets/custom_button.dart';
import 'package:bocw_contractor_app/widgets/custom_text.dart';
import 'package:bocw_contractor_app/widgets/image_assets.dart';
import 'package:bocw_contractor_app/widgets/terms_conditions.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: textSecondary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const ImageAssets(
                        image: workerLogo,
                        height: 90,
                      ),
                      const CustomText(
                        text: "Reset Password",
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        textAlign: TextAlign.center,
                        textColor: textPrimary,
                      ),
                      const SizedBox(height: 10),
                      const CustomText(
                        text: "Create new password for your account",
                        fontSize: 14,
                        textAlign: TextAlign.center,
                        textColor: textSecondary,
                      ),
                      const SizedBox(height: 30),
                      const ResetPasswordItem(),
                      const SizedBox(height: 30),
                      CustomButton(
                        width: double.infinity,
                        height: 48,
                        buttonText: "Reset Password",
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                          }
                        },
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: const TermsConditions(),
    );
  }
}