import 'package:bocw_contractor_app/utilities/hardcoded_data.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: byContinuing,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center,
            ),
            CustomText(
              text: termsConditions,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center,
              decoration: TextDecoration.underline,
            ),
          ],
        ),
      ),
    );
  }
}
