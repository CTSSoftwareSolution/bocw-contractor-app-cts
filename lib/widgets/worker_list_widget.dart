import 'package:flutter/material.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';
import '../../../utilities/app_color.dart';

class WorkerListWidget extends StatelessWidget {
  const WorkerListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        workerCard("Rahul", true),
        workerCard("Amit", false),
      ],
    );
  }

  Widget workerCard(String name, bool active) {
    return CustomContainer(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              text: name,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              textColor: textPrimary,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: active ? successColor.withOpacity(0.1) : errorColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: CustomText(
              text: active ? "Active" : "Inactive",
              fontSize: 11,
              textColor: active ? successColor : errorColor,
            ),
          )
        ],
      ),
    );
  }
}