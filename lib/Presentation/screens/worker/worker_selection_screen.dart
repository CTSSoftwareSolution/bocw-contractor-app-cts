import 'package:bocw_contractor_app/utilities/app_color.dart';
import 'package:bocw_contractor_app/widgets/custom_container.dart';
import 'package:bocw_contractor_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';


class WorkerSelectionScreen extends StatefulWidget {
  const WorkerSelectionScreen({super.key});

  @override
  State<WorkerSelectionScreen> createState() => _WorkerSelectionScreenState();
}

class _WorkerSelectionScreenState extends State<WorkerSelectionScreen> {

  final List<Map<String, dynamic>> workers = [
    {"name": "Rahul", "selected": false},
    {"name": "Amit", "selected": false},
    {"name": "Rohit", "selected": false},
    {"name": "Suresh", "selected": false},
  ];

  void toggleSelection(int index) {
    setState(() {
      workers[index]["selected"] = !workers[index]["selected"];
    });
  }

  List selectedWorkers() {
    return workers.where((w) => w["selected"] == true).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const CustomText(
          text: "Select Workers",
          textColor: whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: primaryColor,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: workers.length,
              itemBuilder: (context, index) {
                final worker = workers[index];

                return CustomContainer(
                  onTap: () => toggleSelection(index),
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
                          text: worker["name"],
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          textColor: textPrimary,
                        ),
                      ),
                      Checkbox(
                        value: worker["selected"],
                        activeColor: primaryColor,
                        onChanged: (_) => toggleSelection(index),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final selected = selectedWorkers();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${selected.length} Workers Selected"),
                    ),
                  );

                  Navigator.pop(context, selected);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: whiteColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text("Done"),
              ),
            ),
          )
        ],
      ),
    );
  }
}