import 'package:bocw_contractor_app/Presentation/screens/registration/registration_form.dart';
import 'package:bocw_contractor_app/utilities/app_color.dart';
import 'package:bocw_contractor_app/utilities/image_data.dart';
import 'package:bocw_contractor_app/widgets/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/terms_conditions.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context); // login pe wapas
          },
          child: const Icon(Icons.arrow_back, color: textSecondary),
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
                      const ImageAssets(image: workerLogo, height: 90),
                      const SizedBox(height: 20),
                      const CustomText(
                        text: "Sign up",
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        textAlign: TextAlign.center,
                        textColor: textPrimary,
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                              color: textSecondary,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: "Sign In",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      const RegisterScreenItem(),
                      const SizedBox(height: 25),
                      CustomButton(
                        width: double.infinity,
                        height: 48,
                        buttonText: "Register",
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Registration Successful (UI test)",
                                ),
                              ),
                            );
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
