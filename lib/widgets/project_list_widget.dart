import 'package:bocw_contractor_app/Presentation/screens/worker/worker_selection_screen.dart';
import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';
import '../../../utilities/app_color.dart';

class ProjectListWidget extends StatelessWidget {
  const ProjectListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        projectCard("Metro Work", "REG123", context),
        projectCard("Bridge Work", "REG456", context),
      ],
    );
  }

  Widget projectCard(String name, String regNo, BuildContext context) {
    return CustomContainer(
      onTap: () async {
        final selected = await context.push<List>(
          const WorkerSelectionScreen(),
        );

        if (selected != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${selected.length} Workers mapped to $name"),
            ),
          );
        }
      },
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: name,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            textColor: textPrimary,
          ),
          const SizedBox(height: 4),
          CustomText(text: regNo, fontSize: 12, textColor: textSecondary),
        ],
      ),
    );
  }
}
