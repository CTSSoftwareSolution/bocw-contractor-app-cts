import 'package:flutter/material.dart';
import '../../../utilities/app_color.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';

class DashboardStatCard extends StatelessWidget {
  final String title;
  final String count;

  const DashboardStatCard({
    super.key,
    required this.title,
    required this.count,
  });

  Color getBgColor() {
    switch (title) {
      case "Workers":
        return primaryLight;
      case "Projects":
        return Colors.blue.shade50;
      case "SAS":
        return warningColor.withOpacity(0.15);
      default:
        return primaryLight;
    }
  }

  Color getTextColor() {
    switch (title) {
      case "Workers":
        return primaryColor;
      case "Projects":
        return Colors.blue;
      case "SAS":
        return warningColor;
      default:
        return primaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bg = getBgColor();
    final textClr = getTextColor();

    return Expanded(
      child: CustomContainer(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: textClr.withOpacity(0.25),
            width: 1,
          ),

          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.03),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: count,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              textColor: textClr,
            ),
            const SizedBox(height: 2),
            CustomText(
              text: title,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              textColor: textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}