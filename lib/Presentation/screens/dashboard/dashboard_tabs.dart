import 'package:bocw_contractor_app/widgets/project_list_widget.dart';
import 'package:bocw_contractor_app/widgets/worker_list_widget.dart';
import 'package:flutter/material.dart';


class DashboardTabs extends StatelessWidget {
  const DashboardTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        ProjectListWidget(),
        WorkerListWidget(),
      ],
    );
  }
}